:- include('Vacina.pl').
:- include('Paciente.pl').
:- include('Vacinacao.pl').
:- include('Persistencia.pl').
:- style_check(-singleton).
:- style_check(-discontiguous).
:- initialization(main).
:- style_check(-singleton).
:- style_check(-discontiguous).




main :-
    carregaVacinas(),
    menuPrincipal(0),
    halt.

menuPrincipal(0):-
    tty_clear,
    write('               
                          Sistema de
                           Controle
               ___        de Vacinas
        ___    | |___________________________
        | |____| |                           |___
        | |____| |       |       |       |   |___|------------
        |_|    | |___|___|___|___|___|___|___|
               |_|'), nl, nl,
    write('Informe qual controle deseja acessar:'),nl,
    write('1. Controle de Vacinas'),nl,
    write('2. Controle de Pacientes'),nl,
    write('3. Controle de Vacinações'),nl,
    readNumber(Numero),
    menuPrincipal(Numero).

menuPrincipal(1):-
    tty_clear,
    menuVacinas(99).

menuPrincipal(2):-
    tty_clear,
    menuPacientes(99).

menuPrincipal(3) :-
    tty_clear,
    menuVacinacoes(99), nl.

menuVacinas(99):-
    tty_clear,  
    write('Menu das Vacinas'), nl,
    write('1. Cadastrar Vacina'), nl,
    write('2. Listar vacinas em falta'), nl,
    write('3. Listar vacinas em estoque'), nl,
    write('4. Listar todas as vacinas do sistema'), nl,
    write('5. Listar vacinas por atributo'), nl,
    write('6. Doses disponiveis para aplicação'), nl,
    write('7. Atualizar Vacina'),nl,
    write('8. Salvar Dados'),nl,
    write('0. Voltar para o menu principal'), nl,
    readNumber(Numero),
    menuVacinas(Numero).

menuVacinas(0) :-
    menuPrincipal(0).

menuVacinas(1):-
    tty_clear,
    write('Cadastrando uma vacina'),nl,
    write('Insina o nome da vacina: '),
    readString(Nome),
    write('Insira a data de fabricação da vacina: '),
    readString(DataFabricacao),
    write('Insira a data de validade da vacina: '),
    readString(Validade),
    write('Insira o laboratório que forneceu a vacina: '),
    readString(Laboratorio),
    write('Insira a quantidade de vacinas fornecidas: '),
    readNumber(Quantidade),
    write('Insira a quantidade de doses necessarias da vacina: '),
    readNumber(QuantidadeDoses),
    write('Insira a doença associada: '),
    readString(Doenca),
    write('Insira a porcentagem de eficiência da vacina: '),
    readNumber(Eficiencia),
    write('Insira o selo de aprovação da vacina: '),
    readString(Selo),
    write('Insira o país de origem da vacina: '),
    readString(Pais),
    constroiVacina(Nome,DataFabricacao,Validade,Laboratorio,Quantidade,QuantidadeDoses,Doenca,Eficiencia,Selo,Pais,Vacina),
    salvaVacinas(Vacina),
    write('Vacina cadastrada!'), nl,  
    write('Pressione ENTER para continuar.'),
    readString(_),
    menuVacinas(99).

menuVacinas(2) :-
    tty_clear,
    write('Vacinas em falta:'), nl,
    listaVacinas(ListaVacinas),
    listarVacinasEmFalta(ListaVacinas,0),nl,
    write('Pressione ENTER para continuar.'), nl,
    readString(_),
    menuVacinas(99).


menuVacinas(3) :-
    tty_clear,
    write('Vacinas em estoque:'), nl,
    listaVacinas(ListaVacinas),
    %listarVacinasEmEstoque(ListaVacinas),
    write('Pressione ENTER para continuar.'), nl,
    readString(_),
    menuVacinas(99).

menuVacinas(4) :-
    tty_clear,
    write('Todas as vacinas cadastradas:'), nl,
    listaVacinas(ListaVacinas),
    listarVacinas(ListaVacinas),nl,
    write('Pressione ENTER para continuar.'), nl,
    readString(_),
    menuVacinas(99).

menuVacinas(5) :-
    tty_clear,
    write('Listar vacinas por:'), nl,
    write('1. Enfermidade (doença)'), nl,
    write('2. Laboratório'), nl,
    write('3. País de origem'), nl,
    readNumber(Numero),
    menuListaVacinas(Numero).

menuVacinas(6) :-
    tty_clear,
    write('Nome da vacina:'), nl,
    readString(NomeVacina),
    write('Quantidade de doses disponíveis para aplicação:'), nl,
    % EXIBIR QUANTIDADE DE DOSES DISPONÍVEIS AQUI.
    write('Pressione ENTER para continuar.'), nl,
    readString(_),
    menuVacinas(99).

menuVacinas(7) :-
    tty_clear,
    write('Atualizando vacina'), nl, nl,
    write('Insira o nome da vacina:'), nl,
    readString(Vacina),
    menuAtualizaVacina(-1, Vacina).

menuVacinas(8) :-
    salvarDados(),
    write('Dados salvos.'),nl,
    write('Pressione ENTER para continuar.'), nl,
    readString(_),
    menuVacinas(99).

menuAtualizaVacina(-1, Vacina) :-
    tty_clear,
    write('Escolha qual atributo da vacina deseja alterar:'), nl, nl,
    write('1. Alterar a data de fabricação'),nl,
    write('2. Atualizar a data de validade'),nl,
    write('3. Atualizar o laboratório'),nl,
    write('4. Atualizar o estoque'),nl,
    write('5. Atualizar a quantidade de doses necessárias'),nl,
    write('6. Atualizar a enfermidade'),nl ,
    write('7. Atualizar a taxa de efuciência'),nl,
    write('8. Atualizar o selo de aprovação'),nl,
    write('9. Atualizar o país de origem'),nl,nl,
    readNumber(Numero),
    write('Insira o novo valor:'), nl,
    readString(NovoValor),
    listaVacinas(ListaVacinas),
    deletaVacina(ListaVacinas, ListaVacinas, Vacina, NovaLista),

    (Numero == 1 -> alteraFabricacaoVacina(ListaVacinas, Vacina, NovoValor, VacinaSaida);
    Numero == 2 -> alteraValidadeVacina(ListaVacinas, Vacina, NovoValor, VacinaSaida);
    Numero == 3 -> alteraLaboratorioVacina(ListaVacinas, Vacina, NovoValor, VacinaSaida);
    Numero == 4 -> alteraEstoqueVacina(ListaVacinas, Vacina, NovoValor, VacinaSaida);
    Numero == 5 -> alteraDosesVacina(ListaVacinas, Vacina, NovoValor, VacinaSaida);
    Numero == 6 -> alteraEnfermidadeVacina(ListaVacinas, Vacina, NovoValor, VacinaSaida);
    Numero == 7 -> alteraTaxaVacina(ListaVacinas, Vacina, NovoValor, VacinaSaida);
    Numero == 8 -> alteraSeloVacina(ListaVacinas, Vacina, NovoValor, VacinaSaida);
    Numero == 9 -> alteraPaisVacina(ListaVacinas, Vacina, NovoValor, VacinaSaida);
    write("Opção Invalida")),

    salvarDados(NovaLista),
    salvaVacinas(VacinaSaida),
    salvarDados(),
    vacinaToString(VacinaSaida, Result), write(Result), nl,
    write('Pressione ENTER para continuar.'), nl,
    readString(_),
    menuVacinas(99).

menuListaVacinas(1) :-
    tty_clear,
    write('Insira o nome da enfermidade (doença):'), nl,
    readString(Enfermidade),
    % LISTAR VACINAS POR ENFERMIDADE AQUI.
    tty_clear,
    write('Pressione ENTER para continuar.'), nl,
    readString(_),
    menuVacinas(-1).

menuListaVacinas(2) :-
    tty_clear,
    write('Insira o nome do laboratório:'), nl,
    readString(Laboratorio),
    % LISTAR VACINAS POR LABORATÓRIO AQUI.
    tty_clear,
    write('Pressione ENTER para continuar.'), nl,
    readString(_),
    menuVacinas(-1).

menuListaVacinas(3) :-
    tty_clear,
    write('Insira o país de origem:'), nl,
    readString(Pais),
    % LISTAR VACINAS POR PAÍS DE ORIGEM AQUI.
    tty_clear,
    write('Pressione ENTER para continuar.'), nl,
    readString(_),
    menuVacinas(-1).

menuPacientes(99) :-
    tty_clear,
    write('Menu dos Pacientes'), nl,nl,
    write('1. Cadastrar paciente'), nl,
    write('2. Atualizar paciente'), nl,
    write('3. Listar pacientes'), nl,
    write('4. Ver situação'), nl,
    write('5. Salvar Dados'),nl,
    write('0. Voltar ao menu principal'), nl,
    readNumber(Numero),
    menuPacientes(Numero).

menuPacientes(0) :-
    menuPrincipal(0).

menuPacientes(1) :-
    tty_clear,
    write('Cadastrando um paciente'), nl,
    write('Insira o nome do paciente:'), nl,
    readString(Nome),
    write('Insira o sexo:'), nl,
    readString(Sexo),
    write('Insira o CPF:'), nl,
    readString(CPF),
    write('Insira o endereço:'), nl,
    readString(Endereco),
    write('Insira a idade:'), nl,
    readNumber(Idade),
    write('Insira o telefone:'), nl,
    readNumber(Telefone),
    constroiPaciente(Nome,Sexo,CPF,Endereco,Idade,Telefone,Paciente),
    salvaPacientes(Paciente),
    write('Paciente cadastrado!'), nl,
    write('Pressione ENTER para continuar.'), nl,
    readString(_),
    menuPacientes(99).

menuPacientes(2) :-
    tty_clear,
    write('Alterando um paciente'), nl, nl,
    write('1. Digite o CPF do Paciente'), nl,
    readString(Cpf),
    write('1. Alterar o nome'), nl,
    write('2. Alterar o sexo'), nl,
    write('3. Alterar o telefone'), nl,
    write('4. Alterar o endereco'), nl,
    write('5. Alterar a idade'), nl,
    readNumber(Opcao),
    write('Insira o novo valor:'), nl,
    readString(Valor),
    listaPacientes(ListaPacientes),
    deletaPaciente(ListaPacientes,ListaPacientes, Cpf, NovaLista),
    (Opcao == 1 -> atualizaNomePaciente(ListaPacientes, Cpf, Valor, PacienteSaida);
    Opcao == 2 -> atualizaSexoPaciente(ListaPacientes, Cpf, Valor, PacienteSaida);
    Opcao == 3 -> atualizaTelefonePaciente(ListaPacientes, Cpf, Valor, PacienteSaida);
    Opcao == 4 -> atualizaEnderecoPaciente(ListaPacientes, Cpf, Valor, PacienteSaida);
    Opcao == 5 -> atualizaIdadePaciente(ListaPacientes, Cpf, Valor, PacienteSaida);
    write("Opcao invalida")),
    salvaListaPacientes(NovaLista),
    salvaPacientes(PacienteSaida),
    salvarDados(),
    write('Pressione ENTER para continuar.'), nl,
    readString(_),
    menuPacientes(99).

menuPacientes(3) :-
    tty_clear,
    write('Pacientes cadastrados:'), nl,
    listaPacientes(ListaPacientes),
    listarPacientes(ListaPacientes),nl,
    write('Pressione ENTER para continuar.'), nl,
    readString(_),
    menuPacientes(99).

menuPacientes(4) :-
    tty_clear,
    write('Insira o CPF do paciente o qual deseja ver a situação:'),
    readString(CPF),
    % EXIBIR SITUAÇÃO DO PACIENTE AQUI.
    write('Pressione ENTER para continuar.'), nl,
    readString(_),
    menuPacientes(-1).

menuPacientes(5) :-
    salvarDados(),
    write('Dados salvos.'),nl,
    menuPacientes(99).

menuVacinacoes(99) :-
    tty_clear,
    write('Menu de vacinações'), nl, nl,
    write('1. Agendar vacinação'), nl,
    write('2. Listar pacientes a serem vacinados por uma determinada vacina'), nl,
    write('3. Calcular projeção de conclusão de uma vacinação'), nl,
    write('4. Salvar Dados'),nl,
    write('0. Voltar ao menu principal'), nl,
    readNumber(Numero),
    menuVacinacoes(Numero).

menuVacinacoes(0) :-
    menuPrincipal(0).

menuVacinacoes(1) :-
    tty_clear,
    write('Insira o nome da vacina:'), nl,
    readString(NomeVacina),
    write('Insira o local:'), nl,
    readString(Local),
    write('Insira a data da primeira dose:'), nl,
    readString(DataPrimeiraDose),
    write('Insira a data da segunda dose (caso necessário):'), nl,
    readString(DataSegundaDose),
    write('Insira o horário de início:'), nl,
    readString(HorarioInicio),
    write('Insira o horário de término:'), nl,
    readString(HorarioFim),
    write('Informe a idade mínima:'),nl,
    readNumber(IdadeMinima),
    % AGENDAR VACINAÇÃO AQUI.
    constroiVacinacao(NomeVacina, Local, DataPrimeiraDose, DataSegundaDose, HorarioInicio, HorarioFim, IdadeMinima, Vacinacao),
    salvaVacinacao(Vacinacao),
    write('Vacinação agendada!'), nl,
    write('Pressione ENTER para continuar.'), nl,
    readString(_),
    menuVacinacoes(99).

menuVacinacoes(2) :-
    tty_clear,
    write('Nome da vacina:'), nl,
    readString(NomeVacina),
    % LISTAR PACIENTES QUE VAO SER VACINADOS AQUI
    write('Pressione ENTER para continuar.'), nl,
    readString(_),
    menuVacinacoes(99).

menuVacinacoes(3) :-
    tty_clear,
    % NÃO ENTENDI MUITO BEM O QUE FAZ AQUI
    % MAS TEM A VER COM PROJEÇAO DA VACINAÇÃO
    write('Pressione ENTER para continuar.'), nl,
    readString(_),
    menuVacinacoes(99).

menuVacinacoes(4) :-
    salvarDados(),
    write('Dados salvos.'),nl,
    menuVacinacoes(99).
% \\\\\\\\\\\\\\\\\\\\ SALVAR DADOS /////////////////////

% \\\\\\\\\\\\\\\\\\\\ SALVAR VACINA /////////////////////
salvaVacinas(Vacina):-
    retract(listaVacinas(Lista)),
    append(Lista,[Vacina],NovaLista),
    assert(listaVacinas(NovaLista)).
  
 listaVacinas([]).
:- dynamic listaVacinas/1.

carregaVacinas():-
    iniciaVacinas(ListaVacinas),
    retract(listaVacinas(Lista)),
    append(Lista,ListaVacinas,NovaLista),
    assert(listaVacinas(NovaLista)).

% \\\\\\\\\\\\\\\\\\\\ SALVAR PACIENTE /////////////////////
salvaPacientes(Paciente):-
    retract(listaPacientes(Lista)),
    append(Lista,[Paciente],NovaLista),
    assert(listaPacientes(NovaLista)).

listaPacientes([]).
:- dynamic listaPacientes/1.

carregaPacientes():-
    iniciaPacientes(ListaPacientes),
    retract(listaPacientes(Lista)),
    append(Lista,ListaPacientes,NovaLista),
    assert(listaPacientes(NovaLista)).



%\\\\\\\\\\\\\\\\\\\SALVAR VACINAÇÃO//////////////////
salvaVacinacao(Vacinacao):-
    retract(listaVacinacao(Lista)),
    append(Lista,[Vacinacao],NovaLista),
    assert(listaVacinacao(NovaLista)).

listaVacinacao([]).
:- dynamic listaVacinacao/1.

carregaVacinacao():-
    iniciaVacinacao(listaVacinacao),
    retract(listaVacinacao(Lista)),
    append(Lista,ListaVacinacao,NovaLista),
    assert(listaVacinacao(NovaLista)).


salvarDados():-
    listaVacinas(ListaVacinas),
    listaPacientes(ListaPacientes),
    listaVacinacao(ListaVacinacao),
    salvaListaPacientes(ListaPacientes),
    salvaListaVacinas(ListaVacinas),
    salvaListaVacinacao(ListaVacinacao).

salvarDados(ListaVacinas):-
    listaPacientes(ListaPacientes),
    listaVacinacao(ListaVacinacao),
    salvaListaPacientes(ListaPacientes),
    salvaListaVacinas(ListaVacinas),
    salvaListaVacinacao(ListaVacinacao).
readString(String):- read_line_to_codes(user_input, E), atom_string(E,String).
readNumber(Number):- read_line_to_codes(user_input, E), atom_string(E,X), atom_number(X,Number).

