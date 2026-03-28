# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     Movie.find_or_create_by!(name: genre_name)
#   end

# Criar usuário admin
User.find_or_create_by!(email: "admin@luthieria.com") do |user|
  user.password = "admin123"
  user.password_confirmation = "admin123"
end

# Criar clientes de teste
cliente1 = Cliente.find_or_create_by!(nome: "João Silva") do |c|
  c.telefone = "(11) 99999-0001"
  c.email = "joao@email.com"
  c.endereco = "Rua das Flores, 123 - São Paulo, SP"
end

cliente2 = Cliente.find_or_create_by!(nome: "Maria Santos") do |c|
  c.telefone = "(11) 99999-0002"
  c.email = "maria@email.com"
  c.endereco = "Av. Brasil, 456 - São Paulo, SP"
end

cliente3 = Cliente.find_or_create_by!(nome: "Pedro Oliveira") do |c|
  c.telefone = "(21) 99999-0003"
  c.email = "pedro@email.com"
  c.endereco = "Rua do Sol, 789 - Rio de Janeiro, RJ"
end

# Criar instrumentos de teste
inst1 = Instrumento.find_or_create_by!(modelo: "Stratocaster", cliente: cliente1) do |i|
  i.marca = "Fender"
  i.tipo = "Guitarra"
  i.observacoes = "Guitarra clásica com verniz gastado"
end

inst2 = Instrumento.find_or_create_by!(modelo: "Les Paul Standard", cliente: cliente1) do |i|
  i.marca = "Gibson"
  i.tipo = "Guitarra"
  i.observacoes = "Tomebraço original"
end

inst3 = Instrumento.find_or_create_by!(modelo: "D-28", cliente: cliente2) do |i|
  i.marca = "Martin"
  i.tipo = "Violão"
  i.observacoes = "Violão classicom"
end

inst4 = Instrumento.find_or_create_by!(modelo: "SG Special", cliente: cliente3) do |i|
  i.marca = "Epiphone"
  i.tipo = "Guitarra"
  i.observacoes = "Pestana dobra leicht"
end

# Criar serviços de teste
Servico.find_or_create_by!(descricao: "Troca de cordas e regulagem", cliente: cliente1, instrumento: inst1) do |s|
  s.valor = 150.00
  s.data_inicio = Date.today - 5.days
  s.concluido = true
  s.data_conclusao = Date.today - 3.days
  s.observacoes = "Corda 011"
end

Servico.find_or_create_by!(descricao: "Ajuste de action", cliente: cliente1, instrumento: inst2) do |s|
  s.valor = 200.00
  s.data_inicio = Date.today - 2.days
  s.concluido = false
  s.observacoes = "Cliente pediu para baixar action"
end

Servico.find_or_create_by!(descricao: "Troca de captadores", cliente: cliente2, instrumento: inst3) do |s|
  s.valor = 350.00
  s.data_inicio = Date.today
  s.concluido = false
  s.observacoes = "Instalar captadores fishman"
end

Servico.find_or_create_by!(descricao: "Conserto de traste", cliente: cliente3, instrumento: inst4) do |s|
  s.valor = 180.00
  s.data_inicio = Date.today - 7.days
  s.concluido = true
  s.data_conclusao = Date.today - 1.day
  s.observacoes = "Traste 5 arranhado"
end

Servico.find_or_create_by!(descricao: "Polimento e acabamento", cliente: cliente2, instrumento: inst3) do |s|
  s.valor = 250.00
  s.data_inicio = Date.today - 1.day
  s.concluido = false
  s.observacoes = "Polimento full body"
end

# Mais clientes
cliente4 = Cliente.find_or_create_by!(nome: "Ana Costa") do |c|
  c.telefone = "(11) 99999-0004"
  c.email = "ana@email.com"
  c.endereco = "Rua Augusta, 100 - São Paulo, SP"
end

cliente5 = Cliente.find_or_create_by!(nome: "Carlos Souza") do |c|
  c.telefone = "(21) 99999-0005"
  c.email = "carlos@email.com"
  c.endereco = "Av. Nossa Senhora, 200 - Rio de Janeiro, RJ"
end

# Mais 20 clientes
clientes_adicionais = [
  { nome: "Ricardo Lima", telefone: "(11) 99911-0001", email: "ricardo@email.com", endereco: "Rua Alameda, 50 - São Paulo, SP" },
  { nome: "Juliana Martins", telefone: "(11) 99911-0002", email: "juliana@email.com", endereco: "Av. Paulista, 1000 - São Paulo, SP" },
  { nome: "Fernanda Oliveira", telefone: "(21) 99911-0003", email: "fernanda@email.com", endereco: "Rua das Acácias, 200 - Rio de Janeiro, RJ" },
  { nome: "Roberto Alves", telefone: "(31) 99911-0004", email: "roberto@email.com", endereco: "Av. Afonso Pena, 500 - Belo Horizonte, MG" },
  { nome: "Patrícia Dias", telefone: "(41) 99911-0005", email: "patricia@email.com", endereco: "Rua XV de Novembro, 150 - Curitiba, PR" },
  { nome: "Marcos Ferreira", telefone: "(51) 99911-0006", email: "marcos@email.com", endereco: "Av. Borges de Medeiros, 800 - Porto Alegre, RS" },
  { nome: "Camila Rodrigues", telefone: "(61) 99911-0007", email: "camila@email.com", endereco: "SHLN Conjunto A, 50 - Brasília, DF" },
  { nome: "Bruno Costa", telefone: "(81) 99911-0008", email: "bruno@email.com", endereco: "Av. Boa Viagem, 1000 - Recife, PE" },
  { nome: "Larissa Pereira", telefone: "(71) 99911-0009", email: "larissa@email.com", endereco: "Av. Oceânica, 200 - Salvador, BA" },
  { nome: "Diego Santos", telefone: "(11) 99911-0010", email: "diego@email.com", endereco: "Rua Oscar Freire, 300 - São Paulo, SP" },
  { nome: "Priscila Gomes", telefone: "(21) 99911-0011", email: "priscila@email.com", endereco: "Rua Humaitá, 150 - Rio de Janeiro, RJ" },
  { nome: "Rafael Teixeira", telefone: "(31) 99911-0012", email: "rafael@email.com", endereco: "Av. Contorno, 1000 - Belo Horizonte, MG" },
  { nome: "Sabrina Lima", telefone: "(41) 99911-0013", email: "sabrina@email.com", endereco: "Rua das Flores, 250 - Curitiba, PR" },
  { nome: "Vinícius Castro", telefone: "(51) 99911-0014", email: "vinicius@email.com", endereco: "Av. Ipiranga, 1200 - Porto Alegre, RS" },
  { nome: "Bianca Martins", telefone: "(61) 99911-0015", email: "bianca@email.com", endereco: "SHC Setor Comercial, 80 - Brasília, DF" },
  { nome: "Gustavo Ribeiro", telefone: "(81) 99911-0016", email: "gustavo@email.com", endereco: "Rua da Moeda, 90 - Recife, PE" },
  { nome: "Renata Alves", telefone: "(71) 99911-0017", email: "renata@email.com", endereco: "Av. Garibaldi, 350 - Salvador, BA" },
  { nome: "Lucas Ferreira", telefone: "(11) 99911-0018", email: "lucas@email.com", endereco: "Rua Haddock Lobo, 400 - São Paulo, SP" },
  { nome: "Amanda Costa", telefone: "(21) 99911-0019", email: "amanda@email.com", endereco: "Rua Botafogo, 500 - Rio de Janeiro, RJ" },
  { nome: "Thiago Dias", telefone: "(31) 99911-0020", email: "thiago@email.com", endereco: "Av. Raja Gabáglia, 600 - Belo Horizonte, MG" }
]

clientes_adicionais.each do |c|
  Cliente.find_or_create_by!(nome: c[:nome]) do |cliente|
    cliente.telefone = c[:telefone]
    cliente.email = c[:email]
    cliente.endereco = c[:endereco]
  end
end

# Mais instrumentos
inst5 = Instrumento.find_or_create_by!(modelo: "Telecaster", cliente: cliente4) do |i|
  i.marca = "Fender"
  i.tipo = "Guitarra"
  i.observacoes = "Cor sunburst"
end

inst6 = Instrumento.find_or_create_by!(modelo: "SG Standard", cliente: cliente4) do |i|
  i.marca = "Gibson"
  i.tipo = "Guitarra"
  i.observacoes = "Picks original"
end

inst7 = Instrumento.find_or_create_by!(modelo: "AC30", cliente: cliente5) do |i|
  i.marca = "Vox"
  i.tipo = "Amplificador"
  i.observacoes = "Valvulas novas"
end

inst8 = Instrumento.find_or_create_by!(modelo: "Jazz Bass", cliente: cliente4) do |i|
  i.marca = "Fender"
  i.tipo = "Baixo"
  i.observacoes = "4 cordas"
end

# Mais 30 instrumentos
instrumentos_adicionais = [
  { modelo: "Stratocaster Plus", marca: "Squier", tipo: "Guitarra", cliente: Cliente.find_by(nome: "Ricardo Lima"), observacoes: "Modelo entry level" },
  { modelo: "Les Paul Studio", marca: "Epiphone", tipo: "Guitarra", cliente: Cliente.find_by(nome: "Juliana Martins"), observacoes: "Cor wine red" },
  { modelo: "OM-28", marca: "Martin", tipo: "Violão", cliente: Cliente.find_by(nome: "Fernanda Oliveira"), observacoes: "Fingerstyle" },
  { modelo: "Precision Bass", marca: "Fender", tipo: "Baixo", cliente: Cliente.find_by(nome: "Roberto Alves"), observacoes: "5 cordas" },
  { modelo: "Thunderbolt", marca: "Gibson", tipo: "Amplificador", cliente: Cliente.find_by(nome: "Patrícia Dias"), observacoes: "Valvulado" },
  { modelo: "GS Mini", marca: "Taylor", tipo: "Violão", cliente: Cliente.find_by(nome: "Marcos Ferreira"), observacoes: "Eletroacustico" },
  { modelo: "Explorer", marca: "Gibson", tipo: "Guitarra", cliente: Cliente.find_by(nome: "Camila Rodrigues"), observacoes: "Modelo icônico" },
  { modelo: "Duke", marca: "Ibanez", tipo: "Baixo", cliente: Cliente.find_by(nome: "Bruno Costa"), observacoes: "Ativo" },
  { modelo: "Dreadnought", marca: "Yamaha", tipo: "Violão", cliente: Cliente.find_by(nome: "Larissa Pereira"), observacoes: "Acoustico" },
  { modelo: "Mustang", marca: "Fender", tipo: "Guitarra", cliente: Cliente.find_by(nome: "Diego Santos"), observacoes: "Short scale" },
  { modelo: "Flying V", marca: "Gibson", tipo: "Guitarra", cliente: Cliente.find_by(nome: "Priscila Gomes"), observacoes: "Edicao especial" },
  { modelo: "Spector", marca: "Spector", tipo: "Baixo", cliente: Cliente.find_by(nome: "Rafael Teixeira"), observacoes: "4 cordas" },
  { modelo: "000-15M", marca: "Martin", tipo: "Violão", cliente: Cliente.find_by(nome: "Sabrina Lima"), observacoes: "All mahogany" },
  { modelo: "Jaguar", marca: "Fender", tipo: "Guitarra", cliente: Cliente.find_by(nome: "Vinícius Castro"), observacoes: "Baritone" },
  { modelo: "Firebird", marca: "Gibson", tipo: "Guitarra", cliente: Cliente.find_by(nome: "Bianca Martins"), observacoes: "Mini humbuckers" },
  { modelo: "Streamer", marca: "Warwick", tipo: "Baixo", cliente: Cliente.find_by(nome: "Gustavo Ribeiro"), observacoes: "5 cordas ativo" },
  { modelo: "Grand Auditorium", marca: "Taylor", tipo: "Violão", cliente: Cliente.find_by(nome: "Renata Alves"), observacoes: "ES2 electronics" },
  { modelo: "Jazzmaster", marca: "Fender", tipo: "Guitarra", cliente: Cliente.find_by(nome: "Lucas Ferreira"), observacoes: " pickups single coil" },
  { modelo: "ES-335", marca: "Gibson", tipo: "Guitarra", cliente: Cliente.find_by(nome: "Amanda Costa"), observacoes: "Semi-acustico" },
  { modelo: "Stingray", marca: "Music Man", tipo: "Baixo", cliente: Cliente.find_by(nome: "Thiago Dias"), observacoes: "3 band EQ" },
  { modelo: "Baby Taylor", marca: "Taylor", tipo: "Violão", cliente: Cliente.find_by(nome: "Ricardo Lima"), observacoes: "Travel guitar" },
  { modelo: "Tele Thinline", marca: "Fender", tipo: "Guitarra", cliente: Cliente.find_by(nome: "Juliana Martins"), observacoes: "Semi-hollow" },
  { modelo: "Les Paul Special", marca: "Gibson", tipo: "Guitarra", cliente: Cliente.find_by(nome: "Fernanda Oliveira"), observacoes: "P90 pickups" },
  { modelo: "Acoustic Bass", marca: "Fender", tipo: "Baixo", cliente: Cliente.find_by(nome: "Roberto Alves"), observacoes: "Acoustico" },
  { modelo: "Catalina", marca: "Ibanez", tipo: "Violão", cliente: Cliente.find_by(nome: "Patrícia Dias"), observacoes: "Classical" },
  { modelo: "Corona", marca: "Fender", tipo: "Guitarra", cliente: Cliente.find_by(nome: "Marcos Ferreira"), observacoes: "vibrato stratocaster" },
  { modelo: "Zema", marca: "Tagima", tipo: "Violão", cliente: Cliente.find_by(nome: "Camila Rodrigues"), observacoes: "Eletroacustico" },
  { modelo: "Vintera", marca: "Fender", tipo: "Guitarra", cliente: Cliente.find_by(nome: "Bruno Costa"), observacoes: "70s style" },
  { modelo: "TRBX", marca: "Yamaha", tipo: "Baixo", cliente: Cliente.find_by(nome: "Larissa Pereira"), observacoes: "4 cordas" },
  { modelo: "LSR", marca: "Luthier", tipo: "Violão", cliente: Cliente.find_by(nome: "Diego Santos"), observacoes: "Custom" }
]

instrumentos_adicionais.each do |i|
  if i[:cliente]
    Instrumento.find_or_create_by!(modelo: i[:modelo], cliente: i[:cliente]) do |inst|
      inst.marca = i[:marca]
      inst.tipo = i[:tipo]
      inst.observacoes = i[:observacoes]
    end
  end
end

# Mais serviços (totalizando 20)
servicos_data = [
  { desc: "Troca de cordas", valor: 120.00, cliente: cliente1, instrumento: inst1, concluido: true, dias_inicio: 10, dias_fim: 8 },
  { desc: "Regulagem de truss rod", valor: 180.00, cliente: cliente1, instrumento: inst2, concluido: false, dias_inicio: 3 },
  { desc: "Ajuste de ponte", valor: 150.00, cliente: cliente2, instrumento: inst3, concluido: true, dias_inicio: 15, dias_fim: 13 },
  { desc: "Troca de captador ponte", valor: 280.00, cliente: cliente3, instrumento: inst4, concluido: false, dias_inicio: 1 },
  { desc: "Instalação de novo captador", valor: 320.00, cliente: cliente4, instrumento: inst5, concluido: true, dias_inicio: 20, dias_fim: 18 },
  { desc: "Conserto de chia", valor: 90.00, cliente: cliente4, instrumento: inst6, concluido: false, dias_inicio: 5 },
  { desc: "Troca de knob", valor: 50.00, cliente: cliente5, instrumento: inst7, concluido: true, dias_inicio: 25, dias_fim: 24 },
  { desc: "Manutenção geral", valor: 400.00, cliente: cliente1, instrumento: inst1, concluido: false, dias_inicio: 0 },
  { desc: "Troca de strap lock", valor: 80.00, cliente: cliente2, instrumento: inst3, concluido: true, dias_inicio: 30, dias_fim: 28 },
  { desc: "Ajuste de captadores", valor: 100.00, cliente: cliente3, instrumento: inst4, concluido: false, dias_inicio: 2 },
  { desc: "Polimento de tarraxas", valor: 70.00, cliente: cliente4, instrumento: inst5, concluido: true, dias_inicio: 35, dias_fim: 33 },
  { desc: "Troca de jack", valor: 60.00, cliente: cliente4, instrumento: inst6, concluido: false, dias_inicio: 4 },
  { desc: "Conserto de cabo", valor: 40.00, cliente: cliente5, instrumento: inst7, concluido: true, dias_inicio: 40, dias_fim: 39 },
  { desc: "Upgrade de hardware", valor: 500.00, cliente: cliente1, instrumento: inst2, concluido: false, dias_inicio: 0 }
]

servicos_data.each do |s|
  Servico.find_or_create_by!(descricao: s[:desc], cliente: s[:cliente], instrumento: s[:instrumento]) do |servico|
    servico.valor = s[:valor]
    servico.data_inicio = Date.today - s[:dias_inicio].days
    servico.concluido = s[:concluido]
    servico.data_conclusao = s[:concluido] ? (Date.today - s[:dias_fim].days) : nil
    servico.observacoes = "Servico de teste"
  end
end

puts "Dados de teste criados com sucesso!"
