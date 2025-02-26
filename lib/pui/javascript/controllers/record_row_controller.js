import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    connect() {
        this.applyPointerCursor(this.element.querySelectorAll("li"));
        this.applyPointerCursor(this.element.querySelectorAll("tr.group"));
    }

    applyPointerCursor(elements) {
        elements.forEach((element) => {
            element.style.cursor = "pointer";
        });
    }

    showRecord(event) {
        if (event.target.closest("button") || event.target.closest("a")) {
            return;
        }

        document.getElementById(event.params.id).click();
    }
}