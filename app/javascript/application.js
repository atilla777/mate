// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

import "@rails/request.js"

import { themeChange } from "theme-change"
themeChange()

// Turbo.config.forms.confirm((message) => {
// eslint-disable-next-line no-undef
Turbo.setConfirmMethod((message) => {
    const dialog = document.getElementById("confirm")
    dialog.querySelector('span').textContent = message
    dialog.showModal()

    return new Promise((resolve) => {
        dialog.addEventListener("close", () => {
            resolve(dialog.returnValue == "confirm")
        }, { once: true })
    })
})
