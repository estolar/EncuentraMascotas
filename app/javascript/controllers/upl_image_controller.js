import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="upl-image"
export default class extends Controller {
  static values = { url: String };
  connect() {
    this.myWidget = cloudinary.createUploadWidget({
      cloudName: 'dqx97scli',
      uploadPreset: 'uw_test'
    }, (error, result) => {
      if (!error && result && result.event === "success") {
        // console.log(result.info.url);
        this.urlValue=result.info.url
        console.log(this.urlValue);
        console.log("..........");
        console.log('File uploaded successfully: ', result.info);
      }
    });
  }

  openWidget() {
    this.myWidget.open();
  }


}
