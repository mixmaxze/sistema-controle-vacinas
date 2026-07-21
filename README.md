# Sistema de Controle de Vacinas

Sistema para gerenciamento de vacinas, pacientes e agendamento de vacinações em postos de saúde, desenvolvido como projeto da disciplina Paradigmas de Linguagem de Programação.

## Objetivo

Oferecer uma solução para controle de estoque de vacinas e gestão de pacientes em postos de vacinação, permitindo cadastro, atualização e consulta de informações sobre vacinas disponíveis, pacientes cadastrados e agendamentos de vacinação.

## Stack e Tecnologias

O sistema foi implementado em dois paradigmas distintos de programação:

- **Haskell** - Paradigma funcional
- **Prolog** - Paradigma lógico

Ambas as implementações oferecem as mesmas funcionalidades, permitindo a comparação entre os dois paradigmas.

## Funcionalidades

### Controle de Vacinas

- Cadastrar vacina
- Atualizar informações da vacina
- Listar vacinas em falta
- Listar vacinas em estoque
- Listar todas as vacinas cadastradas
- Buscar vacinas por laboratório, doença ou país de origem
- Calcular doses disponíveis para aplicação

### Controle de Pacientes

- Cadastrar paciente
- Atualizar informações do paciente
- Listar todos os pacientes
- Verificar situação de vacinação do paciente

### Controle de Vacinações

- Agendar vacinação
- Listar pacientes habilitados para uma determinada vacina
- Calcular projeção de conclusão da vacinação

## Estrutura de Dados

### Vacina

- Nome
- Data de fabricação
- Data de validade
- Laboratório fornecedor
- Quantidade de doses disponíveis
- Quantidade de doses necessárias
- Enfermidade associada
- Taxa de eficiência
- Selo de aprovação
- País de origem

### Paciente

- Nome
- Sexo
- CPF
- Endereço
- Idade
- Telefone

### Vacinação

- Nome da vacina
- Local
- Data da primeira dose
- Data da segunda dose
- Horário de início
- Horário de término
- Faixa etária mínima

## Instalação

### Haskell

#### Windows

Baixar e instalar a Haskell Platform em: https://www.haskell.org/platform/windows.html

#### Ubuntu/Linux

```bash
sudo apt-get install haskell-platform
```

#### Dependências adicionais

Instalar os pacotes não nativos `strict` e `split`:

```bash
cabal install strict
cabal install split
```

### Prolog

É necessário ter o SWI-Prolog instalado no sistema.

## Como Executar

### Versão Haskell

1. Navegue até a pasta `Haskell`:

```bash
cd Haskell
```

2. Inicie o interpretador GHCi:

```bash
ghci main.hs
```

3. Execute o programa:

```bash
main
```

### Versão Prolog

1. Navegue até a pasta `Prolog`:

```bash
cd Prolog
```

2. Execute o arquivo principal:

```bash
swipl SistemaVacinas.pl
```

## Persistência de Dados

Os dados são armazenados em arquivos de texto no formato CSV nas pastas `dados/` de cada implementação:

### Haskell
- `Haskell/dados/vacinas.txt`
- `Haskell/dados/pacientes.txt`
- `Haskell/dados/vacinações.txt`

### Prolog
- `Prolog/dados/Vacinas.txt`
- `Prolog/dados/Pacientes.txt`
- `Prolog/dados/Vacinacoes.txt`

## Estrutura do Projeto

```
sistema-controle-vacinas/
│
├── Haskell/
│   ├── main.hs              # Ponto de entrada e menus
│   ├── Vacina.hs            # Módulo de controle de vacinas
│   ├── Paciente.hs          # Módulo de controle de pacientes
│   ├── Vacinacao.hs         # Módulo de controle de vacinações
│   ├── Auxiliar.hs          # Funções auxiliares e persistência
│   └── dados/               # Arquivos de dados
│       ├── vacinas.txt
│       ├── pacientes.txt
│       └── vacinações.txt
│
├── Prolog/
│   ├── SistemaVacinas.pl    # Arquivo principal e menus
│   ├── Vacina.pl            # Predicados de controle de vacinas
│   ├── Paciente.pl          # Predicados de controle de pacientes
│   ├── Vacinacao.pl         # Predicados de controle de vacinações
│   ├── Persistencia.pl      # Predicados de leitura/escrita
│   └── dados/               # Arquivos de dados
│       ├── Vacinas.txt
│       ├── Pacientes.txt
│       └── Vacinacoes.txt
│
└── README.md
```

## Interface do Sistema

O sistema possui interface em modo texto com menus interativos que permitem navegar entre as diferentes funcionalidades. O menu principal oferece acesso aos três módulos principais:

1. Controle de Vacinas
2. Controle de Pacientes
3. Controle de Vacinações

Cada módulo possui seu próprio submenu com as operações disponíveis.
