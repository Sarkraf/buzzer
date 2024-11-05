import consumer from "./consumer";

document.addEventListener("turbo:load", () => {
  const partyElement = document.querySelector("#party-name");
  if (partyElement) {
    const partyName = partyElement.innerText;
    if (partyName) {
      const subscription = consumer.subscriptions.create(
        { channel: "PartyChannel", name: partyName },
        {
          connected() {
            this.perform("confirm_subscription");
          },
          received(data) {


            if (["update_score", "initial_state"].includes(data.action)) {
              const tbody = document.getElementById("score-rows");
              tbody.innerHTML = "";
              data.groups.forEach((group, index) => {
                const tr = document.createElement("tr");
                tr.innerHTML = `<td>${index + 1}</td>
                <td>${group.name}</td>
                <td>${group.score}</td>`;
                tbody.appendChild(tr);
              });
              tbody.childNodes.forEach((tr, index) => {
                setTimeout(() => {
                  tr.classList.add("fs-4", "visible");
                  tr.querySelectorAll("td").forEach(td => {
                    td.classList.add("visible");
                  });
                }, (index + 1) * 500);
              });
            }

          },
        }
      );

      // Annulation de la souscription lorsque l'élément #manager n'est plus sur la page
      document.addEventListener("turbo:before-cache", () => {
        consumer.subscriptions.remove(subscription);
      });
    }
  }

  const managerElement = document.querySelector("#manager");
  if (managerElement) {
    const subscription = consumer.subscriptions.create(
      { channel: "PartyChannel", name: managerElement.innerText },
      {
        received(data) {
          if (data.action === "buzz") {
            const myModal = document.getElementById('displayPointsManager');
            myModal.click();
            // console.log(data);
          }
        }
      }
    );
    document.addEventListener("turbo:before-cache", () => {
      consumer.subscriptions.remove(subscription);
    });
  }
});
