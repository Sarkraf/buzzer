import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["status", "buzzer"]
  buzz(event) {
    console.log(this.statusTarget.innerText);


    // fetch(`parties/Le Wagon/groups/Group 1`)
    //   .then(response => response.json())
    //   .then(data => {
    //     console.log(data)

    //   })
  }
  // this.element.textContent = "Hello, Stimulus!"

  // buzz() {
  //       alert("Buzz!")
  //     }
}
