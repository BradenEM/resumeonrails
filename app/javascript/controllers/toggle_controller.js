import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["toggleable", "button"];

  toggle() {
    this.toggleableTarget.classList.toggle("hidden");

    this.buttonTarget.classList.toggle("hidden");
  }
}
