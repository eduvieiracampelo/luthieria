import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.searchInput = document.getElementById("global-search")
    this.searchInput.addEventListener("input", this.filter.bind(this))
  }

  filter() {
    const query = this.searchInput.value.toLowerCase().trim()
    const items = document.querySelectorAll(".search-item")

    items.forEach(item => {
      const text = item.dataset.searchText.toLowerCase()
      const parent = item.closest("table")
      const tbody = parent.querySelector("tbody")
      const parentSection = tbody.closest(".bg-white")

      if (query === "" || text.includes(query)) {
        item.style.display = ""
        parentSection.style.display = ""
      } else {
        item.style.display = "none"
      }
    })

    this.checkEmptySections()
  }

  checkEmptySections() {
    const sections = document.querySelectorAll(".bg-white.rounded-lg")
    sections.forEach(section => {
      const visibleRows = section.querySelectorAll(".search-item:not([style*='display: none'])")
      const emptyMessage = section.querySelector("td[colspan]")

      if (emptyMessage) {
        const hasData = Array.from(section.querySelectorAll("tr")).some(tr => !tr.querySelector("td[colspan]"))
        emptyMessage.style.display = visibleRows.length === 0 ? "" : "none"
      }
    })
  }
}
