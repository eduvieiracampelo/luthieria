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

    if @servico.save
      respond_to do |format|
        format.turbo_stream { redirect_to root_path, notice: "Serviço criado com sucesso!" }
        format.html { redirect_to root_path, notice: "Serviço criado com sucesso!" }
      end
    else
      respond_to do |format|
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @servico.update(servico_params)
      respond_to do |format|
        format.turbo_stream { redirect_to root_path, notice: "Serviço atualizado com sucesso!" }
        format.html { redirect_to root_path, notice: "Serviço atualizado com sucesso!", status: :see_other }
      end
    else
      respond_to do |format|
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @servico.destroy!

    respond_to do |format|
      format.turbo_stream { redirect_to root_path, notice: "Serviço excluído com sucesso!" }
      format.html { redirect_to root_path, notice: "Serviço excluído com sucesso!", status: :see_other }
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
