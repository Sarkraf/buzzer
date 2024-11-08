import consumer from "channels/consumer";

document.addEventListener("turbo:load", () => {
  const partyView = document.querySelector("#party-view");
  if (partyView) {
    const partyName = partyView.innerText;
    console.log("test");
    if (partyName) {
      const subscription = consumer.subscriptions.create(
        { channel: "PartyChannel", name: partyName },
        {
          connected() {

            this.perform("confirm_subscription");
          },
          received(data) {
            if (data.action === "buzz") {
              const groupAvatar = document.querySelector('#image');
              groupAvatar.insertAdjacentHTML("beforeend", `<img src="app/assets/images/avatars/${data.avatar.filename}" class="mx-5 avatar-xl" id="player-avatar">`);
              // console.log(data);
            }

            if ("update_score" === data.action) {
              const groupAvatar = document.querySelector('#player-avatar');
              if (data.operator === "+") {
                groupAvatar.classList.add("green")
                setTimeout(() => {
                  groupAvatar.remove()
                }, 5000);

              } else {
                groupAvatar.classList.add("red")
                setTimeout(() => {
                  groupAvatar.classList.remove("red")
                }, 5000);
              }
            }

            if (["update_score", "initial_state"].includes(data.action)) {
              const tbody = document.getElementById("score-rows");
              tbody.innerHTML = "";
              data.groups.forEach((group, index) => {
                const tr = document.createElement("tr");
                tr.innerHTML = `<td class="text-center">${index + 1}</td>
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
