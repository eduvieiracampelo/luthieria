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

    respond_to do |format|
      if @instrumento.save
        format.turbo_stream
        format.html { redirect_to @instrumento, notice: "Instrumento criado com sucesso!" }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @instrumento.update(instrumento_params)
        format.turbo_stream
        format.html { redirect_to @instrumento, notice: "Instrumento atualizado com sucesso!", status: :see_other }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @instrumento.destroy!

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to instrumentos_path, notice: "Instrumento excluído com sucesso!", status: :see_other }
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
