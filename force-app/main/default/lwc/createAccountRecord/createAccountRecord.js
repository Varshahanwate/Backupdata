import { LightningElement ,track} from 'lwc';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import NAME_FIELD from '@salesforce/schema/Account.Name';

import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import RATING_FIELD from '@salesforce/schema/Account.Rating';
import PHONE_FIELD from '@salesforce/schema/Account.Phone';
import createAccount from '@salesforce/apex/createAcc.createAccount';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class CreateAccountRecord extends LightningElement {
   
    @track name = NAME_FIELD;
    @track industry = INDUSTRY_FIELD;
    @track phone = PHONE_FIELD;
    @track Rating = RATING_FIELD;
    rec = {
        Name : this.name,
        Industry : this.industry,
        Phone : this.phone,
        Rating : this.Rating
    }

    handleNameChange(event) {
        this.rec.Name = event.target.value;
        console.log("name1", this.rec.Name);
    }
    
    handleIndChange(event) {
        this.rec.Industry = event.target.value;
        console.log("Industry", this.rec.Industry);
    }
    
    handlePhnChange(event) {
        this.rec.Phone = event.target.value;
        console.log("Phone", this.rec.Phone);
    }
    handleratChange(event) {
        this.rec.Rating = event.target.value;
        console.log("Rating", this.rec.Rating);
    }

    handleClick() {
        createAccount({ acc : this.rec })
            .then(result => {
                this.message = result;
                this.error = undefined;
                if(this.message !== undefined) {
                    this.rec.Name = '';
                    this.rec.Industry = '';
                    this.rec.Phone = '';
                    this.rec.Rating ='';
                    this.dispatchEvent(
                        new ShowToastEvent({
                            title: 'Success',
                            message: 'Account created',
                            variant: 'success',
                        }),
                    );
                }
                
                console.log(JSON.stringify(result));
                console.log("result", this.message);
            })
            .catch(error => {
                this.message = undefined;
                this.error = error;
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Error creating record',
                        message: error.body.message,
                        variant: 'error',
                    }),
                );
                console.log("error", JSON.stringify(this.error));
            });
    }
}