:- style_check(-singleton).
:- style_check(-discontiguous).

constroiVacina(Nome,Fabricacao,Validade,Laboratorio,Quantidade,QuantidadeDoses,Doenca,Eficiencia,Selo,Pais,vacina(Nome,Fabricacao,Validade,Laboratorio,Quantidade,QuantidadeDoses,Doenca,Eficiencia,Selo)).

%salvaVacina(Vacina,Lista,Result):- append(Lista,[Vacina],Result).

/*get dados de Vacina*/
getVacinaNome(Nome,_,_,_,_,_,_,_,_,_),Nome).
getVacinaFabricacao(_,Fabricacao,_,_,_,_,_,_,_,_),Fabricacao).
getVacinaValidade(_,_,Validade,_,_,_,_,_,_,_),Validade).
getVacinaLaboratorio(_,_,_,Laboratorio,_,_,_,_,_,_),Laboratorio).
getVacinaQuantidade(_,_,_,_,Quantidade,_,_,_,_,_),Quantidade).
getVacinaQuantidadeDoses(_,_,_,_,_,QuantidadeDoses,_,_,_,_),QuantidadeDoses).
getVacinaDoenca(_,_,_,_,_,_,Doenca,_,_,_),Doenca).
getVacinaEficiencia(_,_,_,_,_,_,_,Eficiencia,_,_),Eficiencia).
getVacinaSelo(_,_,_,_,_,_,_,_,Selo,_),Selo).
getVacinaPais(_,_,_,_,_,_,_,_,_,Pais),Pais).

