class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @total_clientes = Cliente.count
    @total_instrumentos = Instrumento.count
    @servicos_pendentes = Servico.pendentes.count
    @servicos_concluidos = Servico.concluidos.count
    @receita_total = Servico.concluidos.sum(:valor)

    @itens = []
    Cliente.order(created_at: :desc).limit(20).each do |c|
      @itens << { tipo: "Cliente", modelo: c.nome, detalhes: c.email, item: c }
    end
    Instrumento.order(created_at: :desc).limit(20).each do |i|
      @itens << { tipo: "Instrumento", modelo: i.modelo, detalhes: "#{i.marca} - #{i.tipo}", item: i }
    end
    Servico.order(created_at: :desc).limit(20).each do |s|
      status = s.concluido ? "Concluído" : "Pendente"
      @itens << { tipo: "Serviço", modelo: s.descricao, detalhes: "#{s.cliente.nome} - #{s.instrumento.modelo} (#{status})", item: s }
    end
  end
end
