class Cliente < ApplicationRecord
  has_many :instrumentos, dependent: :destroy
  has_many :servicos, dependent: :destroy

  validates :nome, presence: true
end
