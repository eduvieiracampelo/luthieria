import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["cliente", "instrumento"]

  connect() {
    this.clienteTarget.addEventListener("change", this.onClienteChange.bind(this))
    if (this.clienteTarget.value) {
      this.filterInstrumentos(this.clienteTarget.value)
    }
  }

  onClienteChange(event) {
    const clienteId = event.target.value
    this.filterInstrumentos(clienteId)
  }

  filterInstrumentos(clienteId) {
    const instrumentoSelect = this.instrumentoTarget
    const instrumentos = JSON.parse(instrumentoSelect.dataset.instrumentos || "[]")
    const instrumentoAtual = instrumentoSelect.dataset.selected
    
    instrumentoSelect.innerHTML = '<option value="">Selecione um instrumento</option>'
    
    if (!clienteId) {
      return
    }

    const filtered = instrumentos.filter(i => i.cliente_id == clienteId)
    
    filtered.forEach(instrumento => {
      const option = document.createElement("option")
      option.value = instrumento.id
      option.textContent = instrumento.modelo
      if (instrumento.id.toString() === instrumentoAtual) {
        option.selected = true
      }
      instrumentoSelect.appendChild(option)
    })
  }
}
