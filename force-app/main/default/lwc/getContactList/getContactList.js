import { LightningElement, wire } from "lwc";
import getCount from "@salesforce/apex/AccountCount.getCount";
export default class RecordCount extends LightningElement {
  @wire(getCount) count;
}