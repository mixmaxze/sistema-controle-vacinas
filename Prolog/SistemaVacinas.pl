:- include('Vacina.pl').
:- include('Persistencia.pl').
:- initialization(main).

main:-
menuPrincipal(0),
halt.


menuPrincipal(0):-
write("Informe qual controle deseja acessar:"),nl,
write("1. Controle de Vacinas"),nl,
write("2. Controle de Pacientes"),nl,
write("3. Controle de Vacinações"),nl,
read(Numero),
menuPrincipal(Numero).

menuPrincipal(1):-
    tty_clear, 
    menuVacinas(0)
    nl,
    menuPrincipal(0).

menuVacinas(0):-
write("Menu das Vacinas"),nl,
write("1. Cadastrar Vacina"),nl,
write("2. Listar vacinas em falta"),nl,
write("3. Listar vacinas em estoque"),nl,
write("4. Listar todas as vacinas do sistema"),nl,
write("5. Listar vacinas por atributo"),nl,
write("6. Doses disponiveis para aplicação"),nl,
write("7. Atualizar Vacina"),nl,
write("0. Voltar para o menu principal"),nl,
read(Numero)
tty_clear,
menuVacinas(Numero),
menuPrincipal(0).

menuVacinas(1):-
write("Cadastrando uma vacina"),nl,
write("Insina o nome da vacina:"),
read(Nome),
write("Insira a data de fabricação da vacina:"),
read(Fabricacao)
write("Insira a data de validade da vacina:"),
read(Validade),
write("Insira o laboratorio que forneceu a vacina:"),
read(Laboratorio),
write("Insira a quantidade de vacinas fornecidas:"),
read(Quantidade),
write("Insira a quantidade de doses necessarias da vacina:"),
read(QuantidadeDoses),
write("Insira a doença associada:"),
read(Doenca),
write("Insira a taxa de eficiência da vacina:"),
read(Eficiencia),
write("Insira o selo de aprovação da vacina:"),
read(Selo),
write("Insira o pais de origem da vacina:"),
read(Pais),
constroiVacina(Nome,Fabricacao,Validade,Laboratorio,Quantidade,QuantidadeDoses,Doenca,Eficiencia,Selo,Pais,Vacina),
salvaVacina(Vacina),
write("Vacina cadastrada"), nl,  
write("Pressione enter para continuar."),
lerString(_),    
menu(99).

salvaVacina(Vacina):-
    retract(listaVacinas(Lista)),
    append(Lista,[Vacina],NovaLista),
    assert(listaVacinas(NovaLista))

listaVacinas([]).
:-dynamic listaVacinas/1.