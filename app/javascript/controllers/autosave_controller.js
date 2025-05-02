import { Controller } from "@hotwired/stimulus";
import debounce from "lodash.debounce";

export default class extends Controller {
  static targets = ["form", "preview"];

  connect() {
    console.log("Autosave controller connected", this.element);
    console.log("Does preview target exist on connect?", this.hasPreviewTarget);
    if (this.hasPreviewTarget) {
      console.log("Preview target element: ", this.previewTarget);
    } else {
      console.error("Preview target not found on connect");
    }
    this.form = this.hasFormTarget ? this.formTarget : this.element;
    this.save = debounce(this.save.bind(this), 500);

    if (this.element.tagName === "FORM") {
      this.element.addEventListener("input", this.save);
      console.log("Attached input listener to form");
    } else {
      console.log("Relying on data-action on form element");
    }
  }

  disconnect() {
    if (this.element.tagName === "FORM") {
      this.element.removeEventListener("input", this.save);
    }
  }

  save(event) {
    const url = this.form.action;
    console.log("Autosaving form to: ", url);
    const formData = new FormData(this.form);

    const csrfToken = document.querySelector("meta[name='csrf-token']").content;

    fetch(url, {
      method: "PATCH",
      headers: {
        "X-CSRF-Token": csrfToken,
        Accept: "application/json",
      },
      body: formData,
    })
      .then((response) => {
        if (response.ok) {
          console.log("Autosave success");
          return response.json();
        } else {
          console.error("Autosave failed: ", response.statusText);

          response
            .json()
            .then((errors) => {
              console.error("Validation errors: ", errors);
            })
            .catch(() => {});
          throw new Error("Autosave failed");
        }
      })
      .then((data) => {
        console.log("Server resonse data: ", data);
        console.log("this: ", this);
        if (this.hasPreviewTarget && data.previewHtml) {
          console.log("Updating preview target HTML...");
          this.previewTarget.innerHTML = data.previewHtml;
        }
      })
      .catch((error) => {
        console.error("Error fetching: ", error);
      });
  }
}
