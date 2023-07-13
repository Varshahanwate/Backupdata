import { LightningElement, track ,wire, api} from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import VEHICLE_OBJECT from '@salesforce/schema/Vehicle__c';
import NAME_FIELD from '@salesforce/schema/Vehicle__c.Name';
import FUEL_TYPE_FIELD from '@salesforce/schema/Vehicle__c.Fuel_Type__c';
import VEHICLE_PRICE_FIELD from '@salesforce/schema/Vehicle__c.Vehicle_Price__c';
import MODEL_FIELD from '@salesforce/schema/Vehicle__c.Model__c';
import VEHICLE_TYPE_FIELD from '@salesforce/schema/Vehicle__c.Vehicle_Type__c';
//import getVehicles from '@salesforce/apex/c/VehicleInformation.VList';
import getVehiclelist from '@salesforce/apex/VehicleInformationew.getVehiclelist';
export default class VehicleInformationew extends LightningElement {
    @track record;
    @track clickme = false;
    @track getVehicle;
    //@wire (getVehicles) wiredVehicles;
    @track isShowModal = false;
    saveCars;
    @track error;
    carget(event) {
        this.saveCars = event.target.value;
    }
    //22-Jun
    showModalBox() {
        this.isShowModal = true;
    }

    hideModalBox() {
        this.isShowModal = false;
    }
    changeHandler(event) { }
    objectApiName = VEHICLE_OBJECT;
    fields = [NAME_FIELD, FUEL_TYPE_FIELD, VEHICLE_PRICE_FIELD, MODEL_FIELD, VEHICLE_TYPE_FIELD];
    handleSuccess(event) {
        const toastEvent = new ShowToastEvent({
            title: "car created",
            message: "Record ID: " + event.detail.id,
            variant: "success"
        });
        this.dispatchEvent(toastEvent);
    }
    SaveClick(event) {
        this.clickme = true;
        console.log('in' + this.vehicle);
        getVehiclelist({ s: this.saveCars })
            .then(result => {
                this.getVehicle = result;
                console.log('in' + this.vehicle);
            })
            .catch((error) => {
                this.error = error;
            });
    }
    selectedVehicle;
    //c/accountrecord// new addedselectedContact; @wire (getVehiclelist, {s:'$saveCars'})
    wiredvehicls;
    vehicleSelected(event) {
        const vehid = event.detail;
        this.selectedVehicle = this.getVehiclelist.find(vehicle => vehicle.Id === vehid);
    } get listIsNotEmpty() {
        return this.getVehicle && Array.isArray(this.getVehicle) && this.getVehicle.length > 0;
    }
}