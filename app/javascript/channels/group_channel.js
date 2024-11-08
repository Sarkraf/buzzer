import consumer from "channels/consumer";

document.addEventListener("turbo:load", () => {
  const choiceView = document.querySelector("#choice-view");
  if (choiceView) {
    const partyName = document.querySelector("#choice-view").innerText;
    const subscription = consumer.subscriptions.create(
      { channel: "GroupChannel", party_name: partyName }, {
      connected() {
        this.perform("confirm_subscription");
      },

      disconnected() {
        const avatar = document.querySelector("img.selected");
        // Called when the subscription has been terminated by the server
        if (avatar) {
          fetch(`/avatars/${avatar.dataset.id}`, {
            method: 'POST',
            headers: {
              'Content-Type': 'application/json'
            },
            body: JSON.stringify({ toggle: false })
          });
        }
      },

      received(data) {
        data.avatars.forEach((avatar) => {
          console.log(avatar.taken);
          document.querySelector(`img[data-id="${avatar.id}"]`).classList.toggle("taken", avatar.taken);
        })

        // if (data.action === "avatar_toggle") {
        //   const avatarId = data.avatar.id;
        //   document.querySelectorAll(`img`).forEach((img) => {
        //     if (data.toggle && avatarId == img.dataset.id) {
        //       if (!img.classList.contains("selected")) {
        //         img.classList.add("taken");
        //       }
        //     } else if (!data.toggle && avatarId == img.dataset.id) {
        //       img.classList.remove("taken");
        //     }
        //   });
        // }
      }
    });
    // Annulation de la souscription lorsque l'élément #choice n'est plus sur la page
    document.addEventListener("turbo:before-cache", () => {
      consumer.subscriptions.remove(subscription);
    });
  }
});

function triggerStimulusMethod(data) {
  // Dispatch a custom event with any necessary details
  const event = new CustomEvent("trigger-stimulus-method", data);
  document.dispatchEvent(event);
}
