:- style_check(-singleton).
:- style_check(-discontiguous).

constroiVacina(Nome,DataFabricacao,DataValidade,Laboratorio,Quantidade,QuantidadeDoses,Doenca,Eficiencia,Selo,Pais,vacina(Nome,DataFabricacao,DataValidade,Laboratorio,Quantidade,QuantidadeDoses,Doenca,Eficiencia,Selo,Pais)).

% retorna atributos da vacina
getVacinaNome(vacina(Nome,_,_,_,_,_,_,_,_,_),Nome).
getVacinaDataFabricacao(vacina(_,DataFabricacao,_,_,_,_,_,_,_,_),DataFabricacao).
getVacinaDataValidade(vacina(_,_,DataValidade,_,_,_,_,_,_,_),DataValidade).
getVacinaLaboratorio(vacina(_,_,_,Laboratorio,_,_,_,_,_,_),Laboratorio).
getVacinaQuantidade(vacina(_,_,_,_,Quantidade,_,_,_,_,_),Quantidade).
getVacinaQuantidadeDoses(vacina(_,_,_,_,_,QuantidadeDoses,_,_,_,_),QuantidadeDoses).
getVacinaDoenca(vacina(_,_,_,_,_,_,Doenca,_,_,_),Doenca).
getVacinaEficiencia(vacina(_,_,_,_,_,_,_,Eficiencia,_,_),Eficiencia).
getVacinaSelo(vacina(_,_,_,_,_,_,_,_,Selo,_),Selo).
getVacinaPais(vacina(_,_,_,_,_,_,_,_,_,Pais),Pais).

% busca vacina
buscaVacina(_,[],Resultado):- Resultado = 'Vacina não encontrada.'.
buscaVacina(NomeVacina,[H|T], Resultado):- getVacinaNome(H,Nome), string_upper(Nome, NomeUpper), string_upper(NomeVacina, NomeVacinaUpper),
            (NomeUpper = NomeVacinaUpper -> Resultado = H; buscaVacina(NomeVacina,T,Resultado)).

% lista as vacinas
listarVacinas([]):- nl.
listarVacinas([H|T]):- vacinaToString(H,VacinaToString), write(VacinaToString), nl, listarVacinas(T).

% representação em texto da vacina
vacinaToString(vacina(Nome,DataFabricacao,DataValidade,Laboratorio,Quantidade,QuantidadeDoses,Doenca,Eficiencia,Selo,Pais), Resultado) :- 
    string_concat('Nome: ', Nome, Concat1),
    string_concat(Concat1, ' - Data de fabricação: ', Concat2), 
    string_concat(Concat2, DataFabricacao, Concat3),
    string_concat(Concat3, ' - Data de validade: ', Concat4),
    string_concat(Concat4, DataValidade, Concat5),
    string_concat(Concat5, ' - Laboratório: ', Concat6), 
    string_concat(Concat6, Laboratorio, Concat7),
    string_concat(Concat7, ' - Quantidade disponível: ', Concat8), 
    string_concat(Concat8, Quantidade, Concat9),
    string_concat(Concat9, ' - Quantidade de doses necessárias: ', Concat10), 
    string_concat(Concat10, QuantidadeDoses, Concat11),
    string_concat(Concat11, ' - Doença: ', Concat12), 
    string_concat(Concat12, Doenca, Concat13),
    string_concat(Concat13, ' - Taxa de eficiência: ', Concat14), 
    string_concat(Concat14, Eficiencia, Concat15),
    string_concat(Concat15, ' - Selo de aprovação: ', Concat16), 
    string_concat(Concat16, Selo, Concat17),
    string_concat(Concat17, ' - País: ', Concat18), 
    string_concat(Concat18, Pais, Resultado).

% listar vacinas em falta
listarVacinasEmFalta([],Aux) :- nl.
listarVacinasEmFalta([H|T],Aux) :- getVacinaQuantidade(H,Quantidade),(Quantidade = Aux -> vacinaToString(H,VacinaToString), write(VacinaToString), nl,listarVacinasEmFalta(T,Aux));
    listarVacinasEmFalta(T,Aux).

deletaVacina([], ListaAtual, NomeVacina, NovaLista).
deletaVacina([H|T], ListaAtual, NomeVacina, NovaLista):- 
    getVacinaNome(H,Nome), string_upper(Nome, NomeUpper), string_upper(NomeVacina, NomeVacinaUpper),
    (NomeUpper == NomeVacinaUpper -> delete(ListaAtual,H, NovaLista);
    deletaVacina(T, ListaAtual, NomeVacina, NovaLista)).


alteraValidadeVacina([], NomeVacina, NovoValor, VacinaSaida).
alteraValidadeVacina([H|T], NomeVacina, NovoValor, VacinaSaida):- 
    getVacinaNome(H,Nome), string_upper(Nome, NomeUpper), string_upper(NomeVacina, NomeVacinaUpper),
    (NomeUpper == NomeVacinaUpper -> novaValidadeVacina( H, NovoValor, VacinaSaida);
    alteraValidadeVacina(T, NomeVacina, NovoValor, VacinaSaida)).

novaValidadeVacina(Vacina, NovoValor, Result) :-
    getVacinaNome(Vacina, NOME),
    getVacinaDataFabricacao(Vacina, DATAF),
    getVacinaDoenca(Vacina, DOENCA),
    getVacinaEficiencia(Vacina, EFC),
    getVacinaLaboratorio(Vacina, LAB),
    getVacinaPais(Vacina, PAIS),
    getVacinaQuantidade(Vacina, QTD),
    getVacinaQuantidadeDoses(Vacina, QTDD),
    getVacinaSelo(Vacina, SELO),
    constroiVacina(NOME, DATAF, NovoValor, LAB, QTD, QTDD, DOENCA, EFC, SELO, PAIS, Result).

alteraFabricacaoVacina([], NomeVacina, NovoValor, VacinaSaida).
alteraFabricacaoVacina([H|T], NomeVacina, NovoValor, VacinaSaida):- 
    getVacinaNome(H,Nome), string_upper(Nome, NomeUpper), string_upper(NomeVacina, NomeVacinaUpper),
    (NomeUpper == NomeVacinaUpper -> novoValorVacina( H, NovoValor, VacinaSaida);
    alteraFabricacaoVacina(T, NomeVacina, NovoValor, VacinaSaida)).

novoValorVacina(Vacina, NovoValor, Result) :-
    getVacinaNome(Vacina, NOME),
    getVacinaDataValidade(Vacina, DATAV),
    getVacinaDoenca(Vacina, DOENCA),
    getVacinaEficiencia(Vacina, EFC),
    getVacinaLaboratorio(Vacina, LAB),
    getVacinaPais(Vacina, PAIS),
    getVacinaQuantidade(Vacina, QTD),
    getVacinaQuantidadeDoses(Vacina, QTDD),
    getVacinaSelo(Vacina, SELO),
    constroiVacina(NOME, NovoValor, DATAV, LAB, QTD, QTDD, DOENCA, EFC, SELO, PAIS, Result).

alteraLaboratorioVacina([], NomeVacina, NovoValor, VacinaSaida).
alteraLaboratorioVacina([H|T], NomeVacina, NovoValor, VacinaSaida):- 
    getVacinaNome(H,Nome), string_upper(Nome, NomeUpper), string_upper(NomeVacina, NomeVacinaUpper),
    (NomeUpper == NomeVacinaUpper -> novoLabVacina( H, NovoValor, VacinaSaida);
    alteraLaboratorioVacina(T, NomeVacina, NovoValor, VacinaSaida)).

novoLabVacina(Vacina, NovoValor, Result) :-
    getVacinaNome(Vacina, NOME),
    getVacinaDataValidade(Vacina, DATAV),
    getVacinaDataFabricacao(Vacina, DATAF),
    getVacinaDoenca(Vacina, DOENCA),
    getVacinaEficiencia(Vacina, EFC),
    getVacinaLaboratorio(Vacina, LAB),
    getVacinaPais(Vacina, PAIS),
    getVacinaQuantidade(Vacina, QTD),
    getVacinaQuantidadeDoses(Vacina, QTDD),
    getVacinaSelo(Vacina, SELO),
    constroiVacina(NOME, DATAF, DATAV, NovoValor, QTD, QTDD, DOENCA, EFC, SELO, PAIS, Result).

alteraEstoqueVacina([], NomeVacina, NovoValor, VacinaSaida).
alteraEstoqueVacina([H|T], NomeVacina, NovoValor, VacinaSaida):- 
    getVacinaNome(H,Nome), string_upper(Nome, NomeUpper), string_upper(NomeVacina, NomeVacinaUpper),
    (NomeUpper == NomeVacinaUpper -> novoEstoqueVacina( H, NovoValor, VacinaSaida);
    alteraEstoqueVacina(T, NomeVacina, NovoValor, VacinaSaida)).

novoEstoqueVacina(Vacina, NovoValor, Result) :-
    getVacinaNome(Vacina, NOME),
    getVacinaDataValidade(Vacina, DATAV),
    getVacinaDataFabricacao(Vacina, DATAF),
    getVacinaDoenca(Vacina, DOENCA),
    getVacinaEficiencia(Vacina, EFC),
    getVacinaLaboratorio(Vacina, LAB),
    getVacinaPais(Vacina, PAIS),
    getVacinaQuantidade(Vacina, QTD),
    getVacinaQuantidadeDoses(Vacina, QTDD),
    getVacinaSelo(Vacina, SELO),
    constroiVacina(NOME, DATAF, DATAV, LAB, NovoValor, QTDD, DOENCA, EFC, SELO, PAIS, Result).

alteraDosesVacina([], NomeVacina, NovoValor, VacinaSaida).
alteraDosesVacina([H|T], NomeVacina, NovoValor, VacinaSaida):- 
    getVacinaNome(H,Nome), string_upper(Nome, NomeUpper), string_upper(NomeVacina, NomeVacinaUpper),
    (NomeUpper == NomeVacinaUpper -> novoDosesVacina( H, NovoValor, VacinaSaida);
    alteraDosesVacina(T, NomeVacina, NovoValor, VacinaSaida)).

novoDosesVacina(Vacina, NovoValor, Result) :-
    getVacinaNome(Vacina, NOME),
    getVacinaDataValidade(Vacina, DATAV),
    getVacinaDataFabricacao(Vacina, DATAF),
    getVacinaDoenca(Vacina, DOENCA),
    getVacinaEficiencia(Vacina, EFC),
    getVacinaLaboratorio(Vacina, LAB),
    getVacinaPais(Vacina, PAIS),
    getVacinaQuantidade(Vacina, QTD),
    getVacinaQuantidadeDoses(Vacina, QTDD),
    getVacinaSelo(Vacina, SELO),
    constroiVacina(NOME, DATAF, DATAV, LAB, QTD, NovoValor, DOENCA, EFC, SELO, PAIS, Result).

alteraEnfermidadeVacina([], NomeVacina, NovoValor, VacinaSaida).
alteraEnfermidadeVacina([H|T], NomeVacina, NovoValor, VacinaSaida):- 
    getVacinaNome(H,Nome), string_upper(Nome, NomeUpper), string_upper(NomeVacina, NomeVacinaUpper),
    (NomeUpper == NomeVacinaUpper -> novoEnfermidadeVacina( H, NovoValor, VacinaSaida);
    alteraEnfermidadeVacina(T, NomeVacina, NovoValor, VacinaSaida)).

novoEnfermidadeVacina(Vacina, NovoValor, Result) :-
    getVacinaNome(Vacina, NOME),
    getVacinaDataValidade(Vacina, DATAV),
    getVacinaDataFabricacao(Vacina, DATAF),
    getVacinaDoenca(Vacina, DOENCA),
    getVacinaEficiencia(Vacina, EFC),
    getVacinaLaboratorio(Vacina, LAB),
    getVacinaPais(Vacina, PAIS),
    getVacinaQuantidade(Vacina, QTD),
    getVacinaQuantidadeDoses(Vacina, QTDD),
    getVacinaSelo(Vacina, SELO),
    constroiVacina(NOME, DATAF, DATAV, LAB, QTD, QTDD, NovoValor, EFC, SELO, PAIS, Result).

alteraTaxaVacina([], NomeVacina, NovoValor, VacinaSaida).
alteraTaxaVacina([H|T], NomeVacina, NovoValor, VacinaSaida):- 
    getVacinaNome(H,Nome), string_upper(Nome, NomeUpper), string_upper(NomeVacina, NomeVacinaUpper),
    (NomeUpper == NomeVacinaUpper -> novoTaxaVacina( H, NovoValor, VacinaSaida);
    alteraTaxaVacina(T, NomeVacina, NovoValor, VacinaSaida)).

novoTaxaVacina(Vacina, NovoValor, Result) :-
    getVacinaNome(Vacina, NOME),
    getVacinaDataValidade(Vacina, DATAV),
    getVacinaDataFabricacao(Vacina, DATAF),
    getVacinaDoenca(Vacina, DOENCA),
    getVacinaEficiencia(Vacina, EFC),
    getVacinaLaboratorio(Vacina, LAB),
    getVacinaPais(Vacina, PAIS),
    getVacinaQuantidade(Vacina, QTD),
    getVacinaQuantidadeDoses(Vacina, QTDD),
    getVacinaSelo(Vacina, SELO),
    constroiVacina(NOME, DATAF, DATAV, LAB, QTD, QTDD, DOENCA, NovoValor, SELO, PAIS, Result).

alteraSeloVacina([], NomeVacina, NovoValor, VacinaSaida).
alteraSeloVacina([H|T], NomeVacina, NovoValor, VacinaSaida):- 
    getVacinaNome(H,Nome), string_upper(Nome, NomeUpper), string_upper(NomeVacina, NomeVacinaUpper),
    (NomeUpper == NomeVacinaUpper -> novoSeloVacina( H, NovoValor, VacinaSaida);
    alteraSeloVacina(T, NomeVacina, NovoValor, VacinaSaida)).

novoSeloVacina(Vacina, NovoValor, Result) :-
    getVacinaNome(Vacina, NOME),
    getVacinaDataValidade(Vacina, DATAV),
    getVacinaDataFabricacao(Vacina, DATAF),
    getVacinaDoenca(Vacina, DOENCA),
    getVacinaEficiencia(Vacina, EFC),
    getVacinaLaboratorio(Vacina, LAB),
    getVacinaPais(Vacina, PAIS),
    getVacinaQuantidade(Vacina, QTD),
    getVacinaQuantidadeDoses(Vacina, QTDD),
    getVacinaSelo(Vacina, SELO),
    constroiVacina(NOME, DATAF, DATAV, LAB, QTD, QTDD, DOENCA, EFC, NovoValor, PAIS, Result).

alteraPaisVacina([], NomeVacina, NovoValor, VacinaSaida).
alteraPaisVacina([H|T], NomeVacina, NovoValor, VacinaSaida):- 
    getVacinaNome(H,Nome), string_upper(Nome, NomeUpper), string_upper(NomeVacina, NomeVacinaUpper),
    (NomeUpper == NomeVacinaUpper -> novoPaisVacina( H, NovoValor, VacinaSaida);
    alteraPaisVacina(T, NomeVacina, NovoValor, VacinaSaida)).

novoPaisVacina(Vacina, NovoValor, Result) :-
    getVacinaNome(Vacina, NOME),
    getVacinaDataValidade(Vacina, DATAV),
    getVacinaDataFabricacao(Vacina, DATAF),
    getVacinaDoenca(Vacina, DOENCA),
    getVacinaEficiencia(Vacina, EFC),
    getVacinaLaboratorio(Vacina, LAB),
    getVacinaPais(Vacina, PAIS),
    getVacinaQuantidade(Vacina, QTD),
    getVacinaQuantidadeDoses(Vacina, QTDD),
    getVacinaSelo(Vacina, SELO),
    constroiVacina(NOME, DATAF, DATAV, LAB, QTD, QTDD, DOENCA, EFC, SELO, NovoValor, Result).