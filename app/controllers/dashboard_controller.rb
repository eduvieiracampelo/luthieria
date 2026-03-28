class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @total_clientes = Cliente.count
    @total_instrumentos = Instrumento.count
    @servicos_pendentes = Servico.pendentes.count
    @servicos_concluidos = Servico.concluidos.count
    @receita_total = Servico.concluidos.sum(:valor)
    @clientes_recentes = Cliente.order(created_at: :desc).limit(20)
    @instrumentos_recentes = Instrumento.order(created_at: :desc).limit(20)
    @servicos_recentes = Servico.order(created_at: :desc).limit(20)
  end
end
