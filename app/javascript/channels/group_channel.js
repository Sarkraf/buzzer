import consumer from "channels/consumer";

document.addEventListener("turbo:load", () => {
  const choice = document.querySelector("#choice");
  if (partyElement) {
    const partyName = partyElement.innerText;
    if (partyName) {
      const subscription = consumer.subscriptions.create(
        { channel: "GroupChannel", name: partyName },
        {
          connected() {
            this.perform("confirm_subscription");
          },
        }
      )
    }
  }
});
