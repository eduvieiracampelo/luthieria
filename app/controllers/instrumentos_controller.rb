class InstrumentosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_instrumento, only: %i[ show edit update destroy ]

  def index
    @instrumentos = Instrumento.all
  end

  def show
  end

  def new
    @instrumento = Instrumento.new
  end

  def edit
  end

  def create
    @instrumento = Instrumento.new(instrumento_params)

    if @instrumento.save
      respond_to do |format|
        format.turbo_stream { redirect_to root_path, notice: "Instrumento criado com sucesso!" }
        format.html { redirect_to root_path, notice: "Instrumento criado com sucesso!" }
      end
    else
      respond_to do |format|
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @instrumento.update(instrumento_params)
      respond_to do |format|
        format.turbo_stream { redirect_to root_path, notice: "Instrumento atualizado com sucesso!" }
        format.html { redirect_to root_path, notice: "Instrumento atualizado com sucesso!", status: :see_other }
      end
    else
      respond_to do |format|
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @instrumento.destroy!

    respond_to do |format|
      format.turbo_stream { redirect_to root_path, notice: "Instrumento excluído com sucesso!" }
      format.html { redirect_to root_path, notice: "Instrumento excluído com sucesso!", status: :see_other }
    end
  end

  private

  def set_instrumento
    @instrumento = Instrumento.find(params.expect(:id))
  end

  def instrumento_params
    params.expect(instrumento: [ :modelo, :marca, :tipo, :observacoes, :cliente_id ])
  end
end
