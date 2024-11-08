import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dropdown"
export default class extends Controller {
  static targets = ["menu"];

  toggle(event) {
    // Prevent the event from propagating to avoid immediate closure of the menu
    event.stopPropagation();

    // Toggle the hidden class to show/hide the menu
    this.menuTarget.classList.toggle("hidden");

    // Also, ensure the Bootstrap dropdown toggle behavior doesn't interfere with the Stimulus control
    event.preventDefault();
  }

  connect() {
    // Listen for clicks on the document to close the dropdown if clicked outside
    document.addEventListener("click", this.closeMenu.bind(this));
  }

  disconnect() {
    // Cleanup event listener when the controller is disconnected
    document.removeEventListener("click", this.closeMenu.bind(this));
  }

  closeMenu(event) {
    if (!this.element.contains(event.target)) {
      this.menuTarget.classList.add("hidden");
    }
  }
}
