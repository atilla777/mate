import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    connect() {
        this.element.querySelectorAll("li").forEach((li) => {
            li.style.cursor = "pointer";
        });
    }

    showRecord(event) {
        document.getElementById(event.params.id).click();
    }
}