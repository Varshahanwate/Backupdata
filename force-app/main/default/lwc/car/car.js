import { LightningElement, api } from 'lwc';

export default class Car extends LightningElement {
    @api Vehicle;
    selectHandler(event) {

        // Prevents the anchor element from navigating to a URL.
        event.preventDefault();

        // Creates the event with the contact ID data.
        const selectedEvent = new CustomEvent('selected', { detail: this.vehicle.Id });

        // Dispatches the event.
        this.dispatchEvent(selectedEvent);

    }
}