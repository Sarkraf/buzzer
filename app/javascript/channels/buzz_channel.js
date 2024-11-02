import consumer from "./consumer";


document.addEventListener("turbo:load", () => {
  if (document.querySelector("#buzz_button")) {

    // Arrivée sur la show group

    const buzzer = document.querySelector("#buzz_button");
    const image = buzzer.querySelector("svg");
    setBuzz(buzzer.dataset.clickable);
    // console.log("hello from channel");
    consumer.subscriptions.create("BuzzChannel", {
      received(data) {
        // Action click sur le buzzer
        console.log("test");
        console.log(data.buzz.clickable);
        if (data.action === "disable_buzzers") {
          // Désactive le bouton de buzzer sur chaque page
          setBuzz(data.buzz.clickable);
        }
      }
    })
    function setBuzz(clickable) {
      if (clickable == "true") {
        console.log("ici");
        image.classList.remove("buzz-disabled")
        image.classList.add("buzz-enabled")
      } else {
        console.log("la");
        image.classList.remove("buzz-enabled")
        image.classList.add("buzz-disabled")
      }
    }
  }
})
