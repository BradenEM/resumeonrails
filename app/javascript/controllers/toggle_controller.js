import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["toggleable", "button"];

  toggle() {
    this.toggleableTarget.classList.toggle("d-none");

    this.buttonTarget.classList.toggle("d-none");
  }
}
