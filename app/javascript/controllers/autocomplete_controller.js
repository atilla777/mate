import { Controller } from "@hotwired/stimulus"
import { get } from "@rails/request.js"
import { useDebounce } from 'stimulus-use'

export default class extends Controller {
    static debounces = ['search']
    static values = { url: String }
    static targets = ["selectedLabel", "selectedValue", "variants"]

    connect() {
        useDebounce(this)

        this.inputElement = this.selectedLabelTarget
        this.inputElement.addEventListener("focusout", this.handleFocusOut)
    }

    disconnect() {
        this.inputElement.removeEventListener("focusout", this.handleFocusOut)
    }

    search(event) {
        const value = event.target.value.trim()

        if (value === "") {
            this.clearAll()
            return
        }

        this.selectedValueTarget.value = ""

        const url = this.urlValue
        const targetId = this.variantsTarget.id

        get(`${url}?value=${encodeURIComponent(value)}&target_id=${targetId}`, {
            responseKind: "turbo-stream"
        })
    }

    select(event) {
        const selected = event.target;
        this.selectedLabelTarget.value = selected.textContent;
        this.selectedValueTarget.value = selected.id;
        this.clearList()
    }

    handleFocusOut = (event) => {
        const next = event.relatedTarget

        if (this.element.contains(next)) {
            return
        }

        if (this.selectedValueTarget.value !== "") {
            this.clearList()
            return
        }

        this.clearAll()
    }

    clearList() {
        this.variantsTarget.innerHTML = ""
    }

    clearAll() {
        this.clearList()
        this.selectedLabelTarget.value = ""
        this.selectedValueTarget.value = ""
    }
}
