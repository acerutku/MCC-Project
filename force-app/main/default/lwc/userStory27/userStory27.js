import { api, LightningElement, wire } from 'lwc';
import searchSas from '@salesforce/apex/getSAdetails.searchSas';
import { NavigationMixin } from 'lightning/navigation';
import { publish, MessageContext } from "lightning/messageService";
import SA_LIST_UPDATE_MESSAGE from "@salesforce/messageChannel/SAListUpdate__c";


export default class UserStory27 extends  NavigationMixin(LightningElement)  {
  searchTerm = "";

  sadetails;
  @wire(MessageContext) messageContext;

  @wire(searchSas, { searchTerm: "$searchTerm" })
  loadSAdetails(result) {
    this.sadetails = result;

    if (result.data) {
      const message = {
        sadetails: result.data
      };
      publish(this.messageContext, SA_LIST_UPDATE_MESSAGE, message);
    }
  }

  handleSearchTermChange(event) {
    // Debouncing this method: do not update the reactive property as
    // long as this function is being called within a delay of 300 ms.
    // This is to avoid a very large number of Apex method calls.

    window.clearTimeout(this.delayTimeout);
    const searchTerm = event.target.value;
    // eslint-disable-next-line @lwc/lwc/no-async-operation
    this.delayTimeout = setTimeout(() => {
      this.searchTerm = searchTerm;
    }, 300);
  }

  get hasResults() {
    return this.sadetails.data.length > 0;
  }

  handleSAView(event) {
    const saId = event.detail;

    this[NavigationMixin.Navigate]({
      type: "standard__recordPage",
      attributes: {
        recordId: saId,
        objectApiName: "SA_detail__c",
        actionName: "view"
      }
    });
  }
}