class ServicosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_servico, only: %i[ show edit update destroy ]

  def index
    @servicos = Servico.all
  end

  def show
  end

  def new
    @servico = Servico.new
  end

  def edit
  end

  def create
    @servico = Servico.new(servico_params)

    respond_to do |format|
      if @servico.save
        format.turbo_stream
        format.html { redirect_to @servico, notice: "Serviço criado com sucesso!" }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @servico.update(servico_params)
        format.turbo_stream
        format.html { redirect_to @servico, notice: "Serviço atualizado com sucesso!", status: :see_other }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @servico.destroy!

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to servicos_path, notice: "Serviço excluído com sucesso!", status: :see_other }
    end
  end

  private

  def set_servico
    @servico = Servico.find(params.expect(:id))
  end

  def servico_params
    params.expect(servico: [ :descricao, :valor, :observacoes, :data_inicio, :data_conclusao, :concluido, :cliente_id, :instrumento_id ])
  end
end
