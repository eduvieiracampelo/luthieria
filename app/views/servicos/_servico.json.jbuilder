json.extract! servico, :id, :descricao, :valor, :observacoes, :data_inicio, :data_conclusao, :concluido, :cliente_id, :instrumento_id, :created_at, :updated_at
json.url servico_url(servico, format: :json)
