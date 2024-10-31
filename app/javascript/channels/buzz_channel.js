import consumer from "./consumer";



document.addEventListener("turbo:load", () => {
  console.log("loaded");
  consumer.subscriptions.create("BuzzChannel", {
    received(data) {
      if (data.action === "disable_buzzers") {
        // Désactive le bouton de buzzer sur chaque page

        console.log("hello from channel");
        // console.log(data);

        // const buzzerButton = document.querySelector("#buzzer_button")
        // if (buzzerButton) {
        //   buzzerButton.disabled = true
        //   // Affiche un message indiquant qui a buzzé en premier (facultatif)
        //   const message = document.querySelector("#buzzer_message")
        //   if (message) {
        //     message.innerText = `Le joueur ${data.clicked_by} a buzzé en premier !`
        //   }
        // }
      }
    }
  })
})
