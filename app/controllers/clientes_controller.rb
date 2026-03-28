class ClientesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cliente, only: %i[ show edit update destroy ]

  def index
    @clientes = Cliente.all
  end

  def show
  end

  def new
    @cliente = Cliente.new
  end

  def edit
  end

  def create
    @cliente = Cliente.new(cliente_params)

    if @cliente.save
      respond_to do |format|
        format.turbo_stream { redirect_to root_path, notice: "Cliente criado com sucesso!" }
        format.html { redirect_to root_path, notice: "Cliente criado com sucesso!" }
      end
    else
      respond_to do |format|
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @cliente.update(cliente_params)
      respond_to do |format|
        format.turbo_stream { redirect_to root_path, notice: "Cliente atualizado com sucesso!" }
        format.html { redirect_to root_path, notice: "Cliente atualizado com sucesso!", status: :see_other }
      end
    else
      respond_to do |format|
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @cliente.destroy!

    respond_to do |format|
      format.turbo_stream { redirect_to root_path, notice: "Cliente excluído com sucesso!" }
      format.html { redirect_to root_path, notice: "Cliente excluído com sucesso!", status: :see_other }
    end
  end

  private

  def set_cliente
    @cliente = Cliente.find(params.expect(:id))
  end

  def cliente_params
    params.expect(cliente: [ :nome, :telefone, :email, :endereco ])
  end
end
