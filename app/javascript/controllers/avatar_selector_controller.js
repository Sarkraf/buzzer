import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="avatar-selector"
export default class extends Controller {
  static targets = ["img", "avatarId"]

  async selectAvatar(event) {
    if (!event.currentTarget.classList.contains("taken") && !event.currentTarget.classList.contains("selected")) {
      const newAvatar = event.currentTarget;
      this.avatarIdTarget.value = newAvatar.dataset.id;

      const oldAvatar = document.querySelector("img.selected");
      if (oldAvatar) {
        await this.toggle(oldAvatar, false);
        oldAvatar.classList.remove("selected");
      }
      await this.toggle(newAvatar, true);
      newAvatar.classList.add("selected");
      setTimeout(() => {
        newAvatar.classList.remove("taken");
      }, 15);

    }
  }

  async toggle(avatar, boolean) {
    await fetch(`/avatars/${avatar.dataset.id}`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({ toggle: boolean })
    });
  }

}
