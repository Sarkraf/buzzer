import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="avatar-selector"
export default class extends Controller {
  static targets = ["avatar", "input"]

  connect() {
    this.avatarTargets.forEach(avatar => {
      avatar.addEventListener("click", this.selectAvatar.bind(this))
    })
  }

  selectAvatar(event) {
    this.avatarTargets.forEach(avatar => avatar.classList.remove("selected"))
    event.currentTarget.classList.add("selected")
    this.inputTarget.value = event.currentTarget.dataset.id
  }
}
