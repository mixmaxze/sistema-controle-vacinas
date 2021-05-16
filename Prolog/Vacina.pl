:- style_check(-singleton).
:- style_check(-discontiguous).

constroiVacina(Nome,DataFabricacao,DataValidade,Laboratorio,Quantidade,QuantidadeDoses,Doenca,Eficiencia,Selo,Pais,vacina(Nome,DataFabricacao,DataValidade,Laboratorio,Quantidade,QuantidadeDoses,Doenca,Eficiencia,Selo)).
salvaVacina(Vacina,Lista,Retorno):- append(Lista,[Vacina],Retorno).

% retorna atributos da vacina
getVacinaNome((Nome,_,_,_,_,_,_,_,_,_),Nome).
getVacinaDataFabricacao((_,DataFabricacao,_,_,_,_,_,_,_,_),DataFabricacao).
getVacinaDataValidade((_,_,DataValidade,_,_,_,_,_,_,_),DataValidade).
getVacinaLaboratorio((_,_,_,Laboratorio,_,_,_,_,_,_),Laboratorio).
getVacinaQuantidade((_,_,_,_,Quantidade,_,_,_,_,_),Quantidade).
getVacinaQuantidadeDoses((_,_,_,_,_,QuantidadeDoses,_,_,_,_),QuantidadeDoses).
getVacinaDoenca((_,_,_,_,_,_,Doenca,_,_,_),Doenca).
getVacinaEficiencia((_,_,_,_,_,_,_,Eficiencia,_,_),Eficiencia).
getVacinaSelo((_,_,_,_,_,_,_,_,Selo,_),Selo).
getVacinaPais((_,_,_,_,_,_,_,_,_,Pais),Pais).

% busca vacina
buscaVacina(_,[],Resultado):- Resultado = 'Vacina não encontrada.'.
buscaVacina(NomeVacina,[H|T], Resultado):- getVacinaNome(H,Nome), string_upper(Nome, NomeUpper), string_upper(NomeVacina, NomeVacinaUpper),
            (NomeUpper = NomeVacinaUpper -> Resultado = H; buscaVacina(NomeVacina,T,Resultado)).

% lista as vacinas
listaVacinas([]):- nl.
listaVacinas([H|T]):- vacinaToString(H,VacinaToString), write(VacinaToString), nl, listaVacinas(T).

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
    string_concat(Concat18, Pais, Concat19),
    string_concat(Concat19, Hospital, Resultado).
