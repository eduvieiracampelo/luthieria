class CreateServicos < ActiveRecord::Migration[8.1]
  def change
    create_table :servicos do |t|
      t.text :descricao
      t.decimal :valor, precision: 10, scale: 2
      t.text :observacoes
      t.date :data_inicio
      t.date :data_conclusao
      t.boolean :concluido
      t.references :cliente, null: false, foreign_key: true
      t.references :instrumento, null: false, foreign_key: true

      t.timestamps
    end
  end
end
