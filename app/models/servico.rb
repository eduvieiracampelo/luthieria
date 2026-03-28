class Servico < ApplicationRecord
  belongs_to :cliente
  belongs_to :instrumento

  validates :descricao, presence: true
  validates :data_inicio, presence: true
  validates :cliente, presence: true
  validates :instrumento, presence: true

  scope :pendentes, -> { where(concluido: false) }
  scope :concluidos, -> { where(concluido: true) }
end
