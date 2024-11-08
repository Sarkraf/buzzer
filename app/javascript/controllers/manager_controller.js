import { Controller } from "@hotwired/stimulus"


// Connects to data-controller="manager"
export default class extends Controller {

  static targets = ["input"];

  connect() {
  }

  checkPassword(event) {
    event.preventDefault();
    const partyName = this.element.dataset.partyName;
    fetch(`/parties/${partyName}/fetch_data`)
      .then(response => response.json())
      .then(data => {
        const party = data.party;
        const passphrase = prompt("Enter Passphrase");
        if (party.passphrase === passphrase) {
          window.location.href = `/parties/${party.name}/${party.url}`;
        } else {
          alert("Wrong Passphrase");
        }
      })
  };

  scoring(event) {
    const encodedPartyName = encodeURIComponent(document.querySelector("#manager").innerText);
    if (["Bonus", "Malus"].includes(event.target.innerText)) {
      const score = document.querySelector('#score-value');
      if (score.value && score.dataset.group) {
        fetch(`/parties/${encodedPartyName}/update_score`, {
          method: 'PATCH',
          headers: {
            'Content-Type': 'application/json'
          },
          body: JSON.stringify({ operator: "Bonus" == event.target.innerText ? "+" : "-", value: score.value, group: score.dataset.group })
        })
        console.log(score.dataset.group);

        score.dataset.group = "";
        score.value = "";

      }


    } else {
      const score = event.target.innerText.split('');
      fetch(`/parties/${encodedPartyName}/update_score`, {
        method: 'PATCH',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify({ operator: score[0], value: score[1] })
      })
    }
  }
}
