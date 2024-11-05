import consumer from "./consumer";


document.addEventListener("turbo:load", () => {
  const buzzer = document.querySelector("#buzz_button");
  if (buzzer) {
    const buzzerId = buzzer.dataset.id;
    const image = buzzer.querySelector("svg");
    // Arrivée sur la show group
    function setBuzz(clickable) {
      if (clickable) {
        image.classList.remove("buzz-disabled")
        image.classList.add("buzz-enabled")
      } else {
        image.classList.remove("buzz-enabled")
        image.classList.add("buzz-disabled")
      }
    }

    if (buzzerId) {
      const subscription = consumer.subscriptions.create(
        { channel: "BuzzChannel", id: buzzerId },
        {
          connected() {
            this.perform("confirm_subscription");
          },
          received(data) {
            if (data.action !== "update") {
              setBuzz(data.buzz.clickable);
            }
          },
        }
      );

      // Annulation de la souscription lorsque l'élément #buzzer n'est plus sur la page
      document.addEventListener("turbo:before-cache", () => {
        consumer.subscriptions.remove(subscription);
      });
    }
  }
})
