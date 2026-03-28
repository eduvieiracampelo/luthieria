class BuscaController < ApplicationController
  before_action :authenticate_user!

  def index
    query = params[:q].to_s.strip

    if query.present?
      @clientes = Cliente.where("nome LIKE ?", "%#{query}%")
      @instrumentos = Instrumento.where("modelo LIKE ? OR marca LIKE ?", "%#{query}%", "%#{query}%")
    else
      @clientes = Cliente.none
      @instrumentos = Instrumento.none
    end
  end
end
