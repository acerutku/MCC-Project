import { LightningElement, wire } from 'lwc';
import getSAdetails from '@salesforce/apex/getSAdetails.getSAdetails';

export default class UserStory27 extends LightningElement {
    
    details;
    error;

    connectedCallback(){
        debugger;
        this.getdetails();
    }
    getdetails(){
        getSAdetails()
        .then(result => {
            this.details = result;
        })
        .catch(error =>{
            this.error = error;
        })
    }

}