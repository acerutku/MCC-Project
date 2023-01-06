import { LightningElement, wire } from 'lwc';
import getSAdetail from '@salesforce/apex/getSAdetails.getSAdetail';


export default class UserStory27 extends LightningElement {
    search = '';

    searcHandle(event){
        this.search = event.target.value;
    }
    @wire(getSAdetail, {searchTerm: '$search'})details;
}