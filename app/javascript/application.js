import "@hotwired/turbo-rails"
import "controllers"
import * as bootstrap from "bootstrap"
import "bootstrap"


document.addEventListener("turbo:load", () => {
    const toasts = document.querySelectorAll('.custom-toast');
    toasts.forEach(toast => {
        setTimeout(() => {
            toast.classList.remove('show');
            setTimeout(() => {
                toast.remove();
            }, 500);
        }, 3000);
    });
});