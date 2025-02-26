import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    connect() {
        this.modal = document.getElementById("record-modal-dialog")
    }

    closeOnSubmit(event)
    {
        const {success} = event.detail

        if (success) {
            this.close()
        }
    }

    close() {
        this.modal.remove()
    }
}