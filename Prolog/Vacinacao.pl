:- style_check(-singleton).
:- style_check(-discontiguous).

constroiVacinacao(NomeVacina, Local, DataPrimeiraDose, DataSegundaDose, HorarioInicio, HorarioFim, IdadeMinima).
salvaVacinacao(Vacinacao, Lista, Retorno) :- append(Lista, [Vacinacao], Retorno).

getNomeVacina((NomeVacina, _, _, _, _, _, _), NomeVacina).
getIdadeMinima((_, _, _, _, _, _, IdadeMinima), IdadeMinima).