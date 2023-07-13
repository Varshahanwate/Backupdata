import { api, LightningElement } from 'lwc';

export default class VehicleProjectChild extends LightningElement {
    @api vehicle;
    selectHandler(event) {

        // Prevents the anchor element from navigating to a URL.
        event.preventDefault();

        // Creates the event with the contact ID data.
        const selectedEvent = new CustomEvent('selected', { detail: this.vehicle.Id });

        // Dispatches the event.
        this.dispatchEvent(selectedEvent);

    }
}