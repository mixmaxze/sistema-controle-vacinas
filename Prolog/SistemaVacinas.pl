:- include('Vacina.pl').
:- include('Persistencia.pl').
:- initialization(main).

main:-
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
    read(Numero),
    menuPrincipal(Numero).

menuPrincipal(1):-
    tty_clear,
    menuVacinas(-1).

menuPrincipal(2):-
    tty_clear,
    menuPacientes(-1).

menuPrincipal(3) :-
    tty_clear,
    menuVacinacoes(-1), nl.

menuVacinas(-1):-
    tty_clear,
    write('Menu das Vacinas'), nl,
    write('1. Cadastrar Vacina'), nl,
    write('2. Listar vacinas em falta'), nl,
    write('3. Listar vacinas em estoque'), nl,
    write('4. Listar todas as vacinas do sistema'), nl,
    write('5. Listar vacinas por atributo'), nl,
    write('6. Doses disponiveis para aplicação'), nl,
    write('7. Atualizar Vacina'),nl,
    write('0. Voltar para o menu principal'), nl,
    read(Numero),
    menuVacinas(Numero).

menuVacinas(0) :-
    menuPrincipal(0).

menuVacinas(1):-
    tty_clear,
    write('Cadastrando uma vacina'),nl,
    write('Insina o nome da vacina:'),
    read(Nome),
    write('Insira a data de fabricação da vacina:'),
    read(Fabricacao),
    write('Insira a data de validade da vacina:'),
    read(Validade),
    write('Insira o laboratório que forneceu a vacina:'),
    read(Laboratorio),
    write('Insira a quantidade de vacinas fornecidas:'),
    read(Quantidade),
    write('Insira a quantidade de doses necessarias da vacina:'),
    read(QuantidadeDoses),
    write('Insira a doença associada:'),
    read(Doenca),
    write('Insira a taxa de eficiência da vacina:'),
    read(Eficiencia),
    write('Insira o selo de aprovação da vacina:'),
    read(Selo),
    write('Insira o pais de origem da vacina:'),
    read(Pais),
    constroiVacina(Nome,Fabricacao,Validade,Laboratorio,Quantidade,QuantidadeDoses,Doenca,Eficiencia,Selo,Pais,Vacina),
    salvaVacina(Vacina),
    write('Vacina cadastrada'), nl,  
    write('Pressione ENTER para continuar.'),
    %lerString(_),
    menuVacinas(-1).

menuVacinas(2) :-
    tty_clear,
    write('Vacinas em falta:'), nl,
    % LISTAR VACINAS EM FALTA AQUI.
    menuVacinas(-1).

menuVacinas(3) :-
    tty_clear,
    write('Vacinas em estoque:'), nl,
    % LISTAR VACINAS EM ESTOQUE AQUI.
    menuVacinas(-1).

menuVacinas(4) :-
    tty_clear,
    write('Todas as vacinas cadastradas:'), nl,
    % LISTAR TODAS AS VACINAS AQUI.
    menuVacinas(-1).

menuVacinas(5) :-
    tty_clear,
    write('Listar vacinas por:'), nl,
    write('1. Enfermidade (doença)'), nl,
    write('2. Laboratório'), nl,
    write('3. País de origem'), nl,
    read(Numero),
    menuListaVacinas(Numero).

menuVacinas(6) :-
    tty_clear,
    write('Nome da vacina:'), nl,
    read(NomeVacina),
    write('Quantidade de doses disponíveis para aplicação:'), nl,
    % EXIBIR QUANTIDADE DE DOSES DISPONÍVEIS AQUI.
    menuVacinas(-1).

menuVacinas(7) :-
    tty_clear,
    write('Atualizando vacina'), nl, nl,
    write('Insira o nome da vacina:'), nl,
    read(Vacina),
    menuAtualizaVacina(-1).

menuAtualizaVacina(-1) :-
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
    read(Numero),
    write('Insira o novo valor:'), nl,
    read(NovoValor),
    % ATUALIZAR VACINA AQUI
    menuVacinas(-1).

menuListaVacinas(1) :-
    tty_clear,
    write('Insira o nome da enfermidade (doença):'), nl,
    read(Enfermidade),
    % LISTAR VACINAS POR ENFERMIDADE AQUI.
    menuVacinas(-1).

menuListaVacinas(2) :-
    tty_clear,
    write('Insira o nome do laboratório:'), nl,
    read(Laboratorio),
    % LISTAR VACINAS POR LABORATÓRIO AQUI.
    menuVacinas(-1).

menuListaVacinas(3) :-
    tty_clear,
    write('Insira o país de origem:'), nl,
    read(Pais),
    % LISTAR VACINAS POR PAÍS DE ORIGEM AQUI.
    menuVacinas(-1).

salvaVacina(Vacina):-
    retract(listaVacinas(Lista)),
    append(Lista,[Vacina],NovaLista),
    assert(listaVacinas(NovaLista)).

menuPacientes(-1) :-
    tty_clear,
    write('Menu dos Pacientes'), nl,nl,
    write('1. Cadastrar paciente'), nl,
    write('2. Atualizar paciente'), nl,
    write('3. Listar pacientes'), nl,
    write('4. Ver situação'), nl,
    write('0. Voltar ao menu principal'), nl,
    read(Numero),
    menuPacientes(Numero).

menuPacientes(0) :-
    menuPrincipal(0).

menuPacientes(1) :-
    tty_clear,
    write('Cadastrando um paciente'), nl,
    write('Insira o nome do paciente:'), nl,
    read(Nome),
    write('Insira o sexo:'), nl,
    read(Sexo),
    write('Insira o CPF:'), nl,
    read(CPF),
    write('Insira o endereço:'), nl,
    read(Sexo),
    write('Insira a idade:'), nl,
    read(Idade),
    write('Insira o telefone:'), nl,
    read(Telefone),
    % CADASTRAR PACIENTE AQUI
    menuPacientes(-1).

menuPacientes(2) :-
    tty_clear,
    write('Alterando um paciente'), nl,
    write('1. Alterar o nome'), nl,
    write('2. Alterar o sexo'), nl,
    write('3. Alterar o telefone'), nl,
    write('4. Alterar o endereco'), nl,
    write('5. Alterar a idade'), nl,
    read(Opcao),
    write('Insira o novo valor:'), nl,
    read(Valor),
    % ATUALIZAR PACIENTE AQUI
    menuPacientes(-1).

menuPacientes(3) :-
    tty_clear,
    write('Pacientes cadastrados:'), nl,
    % LISTAR PACIENTES AQUI
    menuPacientes(-1).

menuPacientes(4) :-
    tty_clear,
    write('Insira o CPF do paciente o qual deseja ver a situação:'),
    read(CPF),
    % EXIBIR SITUAÇÃO DO PACIENTE AQUI.
    menuPacientes(-1).

menuVacinacoes(-1) :-
    tty_clear,
    write('Menu de vacinações'), nl, nl,
    write('1. Agendar vacinação'), nl,
    write('2. Listar pacientes a serem vacinados por uma determinada vacina'), nl,
    write('3. Calcular projeção de conclusão de uma vacinação'), nl,
    write('0. Voltar ao menu principal'), nl,
    read(Numero),
    menuVacinacoes(Numero).

menuVacinacoes(0) :-
    menuPrincipal(0).

menuVacinacoes(1) :-
    tty_clear,
    write('Insira o nome da vacina:'), nl,
    read(NomeVacina),
    write('Insira o local:'), nl,
    read(Local),
    write('Insira a data da primeira dose:'), nl,
    read(DataPrimeiraDose),
    write('Insira a data da segunda dose (caso não precise, digite um .):'), nl,
    read(DataSegundaDose),
    write('Insira o horário de início:'), nl,
    read(Horario),
    write('Insira o horário de término:'), nl,
    read(HorarioTermino),
    write('Informe a idade mínima:'),nl,
    read(IdadeMinima),
    % AGENDAR VACINAÇÃO AQUI.
    menuVacinacoes(-1).

menuVacinacoes(2) :-
    tty_clear,
    write('Nome da vacina:'), nl,
    read(NomeVacina),
    % LISTAR PACIENTES QUE VAO SER VACINADOS AQUI
    menuVacinacoes(-1).

menuVacinacoes(3) :-
    tty_clear,
    % NÃO ENTENDI MUITO BEM O QUE FAZ AQUI
    % MAS TEM A VER COM PROJEÇAO DA VACINAÇÃO
    menuVacinacoes(-1).

listaVacinas([]).
:- dynamic listaVacinas/1.

