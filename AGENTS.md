# AGENTS.md - Luthieria Campelo

## Overview
Aplicação Rails para gestão de clientes, instrumentos e serviços de uma luthieria.

## Stack
- Rails 8.x
- Ruby 3.x
- Tailwind CSS
- Devise (autenticação)
- Hotwire (Turbo + Stimulus)
- SQLite (desenvolvimento)

## Build / Lint / Test Commands

### Comandos Rails
```bash
rails server              # Iniciar servidor development
rails console            # Console Rails
rails c                  # Console Rails (atalho)

# DB
rails db:create          # Criar banco
rails db:migrate         # Rodar migrations
rails db:rollback        # Desfazer última migration
rails db:seed            # Popular banco (cria admin@luthieria.com / admin123)
rails db:reset           # Recriar banco

# Assets
rails assets:precompile  # Compilar assets
rails tailwindcss:build  # Compilar Tailwind
```

### Testes
```bash
rails test               # Rodar todos os testes
rails test test/models/cliente_test.rb
rails test test/models/cliente_test.rb -n test_foo
```

### Linting
```bash
rubocop                  # Verificar código Ruby
rubocop -A              # Corrigir automaticamente
```

## Code Style Guidelines

### Naming Conventions
- **Arquivos**: `snake_case.rb`
- **Classes/Modules**: `PascalCase`
- **Métodos**: `snake_case`
- **Tabelas/Colunas**: `snake_case`

### Models
```ruby
class Cliente < ApplicationRecord
  has_many :instrumentos, dependent: :destroy
  has_many :servicos, dependent: :destroy

  validates :nome, presence: true
end
```

### Controllers
```ruby
class ClientesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cliente, only: %i[ show edit update destroy ]
end
```

### Views (ERB + Tailwind)
```erb
<div class="bg-white rounded-lg shadow">
  <table class="w-full">
    <thead>
      <tr>
        <th>Nome</th>
      </tr>
    </thead>
  </table>
</div>
```

## Estrutura de Arquivos
```
app/
├── controllers/
│   ├── dashboard_controller.rb
│   ├── busca_controller.rb
│   ├── clientes_controller.rb
│   ├── instrumentos_controller.rb
│   └── servicos_controller.rb
├── models/
│   ├── cliente.rb
│   ├── instrumento.rb
│   ├── servico.rb
│   └── user.rb
└── views/
    ├── dashboard/
    ├── busca/
    ├── clientes/
    ├── instrumentos/
    └── servicos/
```

## Rotas
```ruby
root "dashboard#index"
resources :clientes
resources :instrumentos
resources :servicos
get "busca" => "busca#index"
devise_for :users
```

## Boas Práticas
1. Usar generators: `rails g scaffold Cliente nome:string telefone:string`
2. Sempre usar `authenticate_user!` nos controllers
3. Validações no model
4. Scopes para queries reutilizáveis
5. Testar casos de erro

## Usuário Inicial
- Email: admin@luthieria.com
- Senha: admin123
