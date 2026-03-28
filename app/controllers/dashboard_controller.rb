class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @total_clientes = Cliente.count
    @total_instrumentos = Instrumento.count
    @servicos_pendentes = Servico.pendentes.count
    @servicos_concluidos = Servico.concluidos.count
    @receita_total = Servico.concluidos.sum(:valor)
    @servicos = Servico.order(created_at: :desc).limit(50)
  end
end
