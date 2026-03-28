import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.searchInput = document.getElementById("search-servicos")
    this.searchInput.addEventListener("input", this.filter.bind(this))
  }

  filter() {
    const query = this.searchInput.value.toLowerCase()
    const rows = document.querySelectorAll(".search-row")

    rows.forEach(row => {
      const text = row.dataset.searchText
      row.style.display = text.includes(query) ? "" : "none"
    })
  }
}
