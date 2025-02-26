// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

import { themeChange } from 'theme-change'
themeChange()

// Turbo.config.forms.confirm((message) => {
// eslint-disable-next-line no-undef
Turbo.setConfirmMethod((message) => {
    const dialog = document.getElementById('confirm')
    dialog.querySelector('span').textContent = message
    dialog.showModal()

    return new Promise((resolve) => {
        dialog.addEventListener("close", () => {
            resolve(dialog.returnValue == "confirm")
        }, { once: true })
    })
})

// const events = [
//     "turbo:fetch-request-error",
//     "turbo:frame-missing",
//     "turbo:frame-load",
//     "turbo:frame-render",
//     "turbo:before-frame-render",
//     "turbo:load",
//     "turbo:render",
//     "turbo:before-stream-render",
//     "turbo:before-render",
//     "turbo:before-cache",
//     "turbo:submit-end",
//     "turbo:before-fetch-response",
//     "turbo:before-fetch-request",
//     "turbo:submit-start",
//     "turbo:visit",
//     "turbo:before-visit",
//     "turbo:click",
//     "confirm:accepted"
// ]
//
// events.forEach(e => {
//     document.addEventListener(e, () => {
//         console.log(e);
//     });
// });
// window.StimulusDebug = true;
