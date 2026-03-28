import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["row", "empty"]

  connect() {
    this.searchInput = document.getElementById("search-servicos")
    this.searchInput.addEventListener("input", this.filter.bind(this))
  }

  filter() {
    const query = this.searchInput.value.toLowerCase()
    const rows = document.querySelectorAll("[data-servico-id]")

    rows.forEach(row => {
      const text = row.dataset.servicoSearch.toLowerCase()
      row.style.display = text.includes(query) ? "" : "none"
    })
  }
}
