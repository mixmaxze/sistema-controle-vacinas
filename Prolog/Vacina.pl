:- style_check(-singleton).

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
buscaVacina(_,[],Aux):- nl.
buscaVacina(NomeVacina,[H|T],Aux):- getVacinaNome(H,Nome), string_upper(Nome, NomeUpper), string_upper(NomeVacina, NomeVacinaUpper),getVacinaQuantidadeDoses(H,NDeDoses),
            (NomeUpper = NomeVacinaUpper,getVacinaQuantidade(H,Quantidade),Quantidade = '0' -> write(NomeVacina),write(' Não possui doses disponíveis para vacinação.'),nl,nl;
            (NomeUpper = NomeVacinaUpper,atom_number(NDeDoses, Number),Number = 1->  getVacinaQuantidade(H,Quantidade), write(NomeVacina),write(' Possui '),write(Quantidade),write(' doses disponíveis para aplicação.'),nl,nl;
            (NomeUpper = NomeVacinaUpper,atom_number(NDeDoses,Number),Number > 1-> getVacinaQuantidade(H,Quantidade),atom_number(Quantidade,QtndInt),Aux is QtndInt/Number ,write(NomeVacina),write(' Possui '),write(Aux),write(' doses disponíveis para aplicação.'),nl,nl));
            buscaVacina(NomeVacina,T,Aux)).

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
listarVacinasEmFalta([H|T],Aux) :- getVacinaQuantidade(H,Quantidade),
    (Quantidade = Aux -> vacinaToString(H,VacinaToString), write(VacinaToString), nl,listarVacinasEmFalta(T,Aux);
    listarVacinasEmFalta(T,Aux)).

% listar vacinas em estoque
listarVacinasEmEstoque([],Aux) :- nl.
listarVacinasEmEstoque([H|T],Aux) :- getVacinaQuantidade(H,Quantidade),
    (Quantidade = Aux -> listarVacinasEmEstoque(T,Aux);
    vacinaToString(H,VacinaToString), write(VacinaToString), nl,listarVacinasEmEstoque(T,Aux)).

% buscar por doenca
buscaVacinaPorDoenca(_,[]):- nl.
buscaVacinaPorDoenca(NomeDoenca,[H|T]):- getVacinaDoenca(H,Doenca), string_upper(Doenca, DoencaUpper), string_upper(NomeDoenca, NomeDoencaUpper),
            (DoencaUpper = NomeDoencaUpper -> vacinaToString(H,VacinaToString), write(VacinaToString),nl,buscaVacinaPorDoenca(NomeDoenca,T); buscaVacinaPorDoenca(NomeDoenca,T)).

% buscar por laboratorio
buscaVacinaPorLaboratorio(_,[]):- nl.
buscaVacinaPorLaboratorio(NomeLaboratorio,[H|T]):- getVacinaLaboratorio(H,Laboratorio), string_upper(Laboratorio, LaboratorioUpper), string_upper(NomeLaboratorio, NomeLaboratorioUpper),
            (LaboratorioUpper = NomeLaboratorioUpper -> vacinaToString(H,VacinaToString), write(VacinaToString),nl,buscaVacinaPorLaboratorio(NomeLaboratorio,T); buscaVacinaPorLaboratorio(NomeLaboratorio,T)).
        
% buscar por pais 
buscaVacinaPorPais(_,[]):- nl.
buscaVacinaPorPais(NomePais,[H|T]):- getVacinaPais(H,Pais), string_upper(Pais, PaisUpper), string_upper(NomePais, NomePaisUpper),
            (PaisUpper = NomePaisUpper -> vacinaToString(H,VacinaToString), write(VacinaToString),nl,buscaVacinaPorPais(NomePais,T); buscaVacinaPorPais(NomePais,T)).

