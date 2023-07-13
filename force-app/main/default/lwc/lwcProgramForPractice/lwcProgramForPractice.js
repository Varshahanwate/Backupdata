import { LightningElement ,track } from 'lwc';

export default class LwcProgramForPractice extends LightningElement {
   @ track
    items = [
        {
            id: 'menu-item-1',
            label: 'Alpha',
            value: 'alpha',
        },
        {
            id: 'menu-item-2',
            label: 'Beta',
            value: 'beta',
        },
        {
            id: 'menu-item-3',
            label: 'Gamma',
            value: 'gamma',
        },
    ];

    handleMenuSelect(event) {
        // retrieve the selected item's value
        const selectedItemValue = event.detail.value;

        // INSERT YOUR CODE HERE
    }
}