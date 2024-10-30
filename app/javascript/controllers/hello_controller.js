import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["value", "buzzer"]
  connect() {
    console.log(targets);

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
