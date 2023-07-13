import { LightningElement, track ,wire, api} from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import CAR_OBJECT from '@salesforce/schema/Car__c';
import NAME_FIELD from '@salesforce/schema/Car__c.Name';
import FUEL_TYPE_FIELD from '@salesforce/schema/Car__c.Fuel_Type__c';
import PRICE_FIELD from '@salesforce/schema/Car__c.Price__c';
import MODEL_NUMBER_FIELD from '@salesforce/schema/Car__c.Model_Number__c';
import VEHICLE_TYPE_FIELD from '@salesforce/schema/Car__c.Vehicle_Type__c';
//import getVehicles from '@salesforce/apex/c/VehicleInformation.VList';
import getVehicleList from '@salesforce/apex/VehicleInformationnew.getVehiclelist';
export default class parentCar extends LightningElement {
    @track record;
    @track clickme = false;
    @track vehiclelist;
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
    objectApiName = CAR_OBJECT;
    fields = [NAME_FIELD, FUEL_TYPE_FIELD, PRICE_FIELD, MODEL_NUMBER_FIELD, VEHICLE_TYPE_FIELD];
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
        getVehicleList({ s: this.saveCars })
            .then(result => {
                this.vehiclelist = result;
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
        this.selectedVehicle = this.vehiclelist.find(vehicle => vehicle.Id === vehid);
    } get listIsNotEmpty() {
        return this.vehiclelist && Array.isArray(this.vehiclelist) && this.vehiclelist.length > 0;
    }
}