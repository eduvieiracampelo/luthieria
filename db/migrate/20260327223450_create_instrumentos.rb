class CreateInstrumentos < ActiveRecord::Migration[8.1]
  def change
    create_table :instrumentos do |t|
      t.string :modelo
      t.string :marca
      t.string :tipo
      t.text :observacoes
      t.references :cliente, null: false, foreign_key: true

      t.timestamps
    end
  end
end
