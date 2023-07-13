import { LightningElement, track, wire } from 'lwc';
import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import LEAD_OBJECT from '@salesforce/schema/Lead';
import ADDRESS_FIELD from '@salesforce/schema/Lead.Address';
import getLeads from '@salesforce/apex/LeadController.getLeads';

export default class AddressSearch extends LightningElement {
    @track addressOptions = [];
    @track selectedAddress = '';
    addressFieldApiName;

    @wire(getObjectInfo, { objectApiName: LEAD_OBJECT })
    objectInfo;

    connectedCallback() {
        if(this.objectInfo.data) {
            this.addressFieldApiName = this.objectInfo.data.fields[ADDRESS_FIELD.fieldApiName].apiName;
        }
    }

    handleSearchKeyChange(event) {
        // Debouncing this method: do not update the reactive properties as
        // long as this function is being called within a delay of 300 ms.
        // This is to avoid a very large number of Apex method calls.
        clearTimeout(this.delayTimeout);
        const searchKey = event.target.value;
        // eslint-disable-next-line @lwc/lwc/no-async-operation
        this.delayTimeout = setTimeout(() => {
            getLeads({ searchKey, addressFieldApiName: this.addressFieldApiName })
                .then(result => {
                    this.addressOptions = result.map(lead => {
                        return {
                            label: getFieldValue(lead, this.addressFieldApiName),
                            value: lead.Id
                        };
                    });
                    this.addressKey = Date.now();
                })
                .catch(error => {
                    this.dispatchEvent(
                        new ShowToastEvent({
                            title: 'Error loading addresses',
                            message: error.message,
                            variant: 'error'
                        })
                    );
                });
        }, 300);
    }

    handleAddressChange(event) {
        this.selectedAddress = event.detail.value;
    }
}