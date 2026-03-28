class Instrumento < ApplicationRecord
  belongs_to :cliente
  has_many :servicos, dependent: :destroy

  validates :modelo, presence: true
  validates :tipo, presence: true
  validates :cliente, presence: true
end
