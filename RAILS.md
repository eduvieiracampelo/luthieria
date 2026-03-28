# Projeto Rails

## Stack
- Rails (latest)
- Tailwind CSS
- Devise (autenticação)
- Hotwire (Turbo + Stimulus)

## Contexto
Este projeto usa Rails como framework backend e frontend, com autenticação via Devise e reatividade via Hotwire.

## Arquitetura

### Estrutura de Pastas
```
app/
├── controllers/       # Controllers (API e monolith)
├── models/            # Models ActiveRecord
├── views/             # Views ERB + Turbo Frames/Streams
├── components/        # View Components (se usar)
├── services/          # Lógica de negócio
├── jobs/              # Jobs ActiveJob
├── mailers/           # ActionMailer
├── channels/          # ActionCable
├── javascript/        # JS + Turbo/Stimulus
├── assets/            # CSS, imagens
└── helpers/          # Helpers
```

### Camadas
- **Models**: ActiveRecord, callbacks, validações
- **Controllers**: API (JSON) e Monolith (HTML + Turbo)
- **Services**: Lógica de negócio isolada
- **Jobs**: Tarefas em background

## checkListProjeto
Sempre consultar CHECKLIST_PROJETO.md para práticas gerais.

## checkListTarefas
- [ ] Planejamento Inicial
- [ ] Arquitetura do Sistema
- [ ] Configuração do Ambiente
- [ ] Estrutura Base
- [ ] Desenvolvimento de Funcionalidades
- [ ] Validação e Consistência
- [ ] Qualidade e Manutenção

## Regras de Desenvolvimento

### Setup Inicial
1. Criar projeto: `rails new . --tailwind --css=tailwind`
2. Adicionar Devise: `rails g devise:install`, `rails g devise User`
3. Adicionar Hotwire: já vem incluso no Rails 7

### Padrões de Código
- Ruby: seguir RuboCop (configurar .rubocop.yml)
- Naming: `snake_case` para arquivos, `PascalCase` para classes
- Controllers: usar `rescue_from` para tratamento de erros
- Models: callbacks e validações no model
- Services: classes em `app/services/`

### Views com Hotwire
- Usar Turbo Frames e Turbo Streams para SPA-like
- Usar Stimulus para JavaScript interativo
- Evitar AJAX vanilla; preferir Turbo

### Autenticação com Devise
- User model com Devise
- Strong parameters no ApplicationController
- Flash messages para feedback

### Tailwind CSS
- Usar classes utilitárias
- Componentes reutilizáveis em `app/components/`
- Variáveis customizadas em `config/tailwind.config.js`

### Banco de Dados
- Migrations em `db/migrate/`
- Schema.rb como fonte de verdade
- Seeds em `db/seeds.rb`

### Testes
- RSpec: `rails g rspec:install`
- Factory Bot para factories
- Shoulda Matchers para validações
--system specs com Capybara para testes E2E

### Commits
- Conventional Commits: `feat:`, `fix:`, `chore:`, `refactor:`
- Branches: `feature/`, `fix/`, `hotfix/`

## Scripts Úteis
```bash
rails g scaffold nome attr:tipo  # CRUD completo
rails g resource nome attr:tipo   # API resource
rails g controller nome ação     # Controller
rails g model nome attr:tipo     # Model
rails db:migrate                 # Rodar migrations
rails db:rollback                # Desfazer última
rails db:seed                    # Popular banco
rails test                       # Rodar testes
rails server                     # Iniciar servidor
```

## Boas Práticas
- `rails g` ao invés de criar arquivos manualmente
- Variáveis de ambiente em `.env` (gem dotenv-rails)
- Usar `config_for` para configurações de ambiente
- Logging estruturado em produção
- Health check em `/health`
