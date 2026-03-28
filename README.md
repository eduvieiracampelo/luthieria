# Luthieria Campelo

Sistema de gestão para luthieria com registro de clientes, instrumentos e serviços.

## Funcionalidades

- **Clientes**: Cadastro, edição, visualização e exclusão de clientes
- **Instrumentos**: Registro de instrumentos vinculados aos clientes
- **Serviços**: Controle de serviços realizados nos instrumentos
- **Dashboard**: Visão geral com total de clientes, instrumentos, serviços e receita
- **Busca**: Pesquisa de clientes e instrumentos
- **Autenticação**: Sistema de login seguro com Devise

## Tecnologias

- Ruby on Rails 8
- Tailwind CSS
- Hotwire (Turbo + Stimulus)
- Devise (autenticação)
- SQLite (desenvolvimento)

## Pré-requisitos

- Ruby 3.x
- Rails 8.x
- Node.js (para Tailwind CSS)

## Como executar

```bash
# Clone o repositório
git clone https://github.com/eduvieiracampelo/luthieria.git
cd luthieria

# Instale as dependências
bundle install

# Compile os assets
rails tailwindcss:build

# Crie o banco de dados
rails db:create db:migrate

# (Opcional) Popule com dados de teste
rails db:seed

# Inicie o servidor
rails server
```

Acesse: http://localhost:3000

## Dados de acesso

Após executar `rails db:seed`:

- **Email**: admin@luthieria.com
- **Senha**: admin123

## Rotas principais

| Rota | Descrição |
|------|------------|
| `/` | Dashboard |
| `/clientes` | Lista de clientes |
| `/instrumentos` | Lista de instrumentos |
| `/servicos` | Lista de serviços |
| `/busca` | Busca global |
| `/users/sign_in` | Login |

## License

This project is available for use and modification.
