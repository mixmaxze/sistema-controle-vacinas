:- style_check(-singleton).
:- style_check(-discontiguous).

constroiVacinacao(NomeVacina, Local, DataPrimeiraDose, DataSegundaDose, HorarioInicio, HorarioFim, IdadeMinima, vacinacao(NomeVacina, Local, DataPrimeiraDose, DataSegundaDose, HorarioInicio, HorarioFim, IdadeMinima)).

%gets
getNomeVacina((NomeVacina, _, _, _, _, _, _), NomeVacina).
getLocal((_, Local, _, _, _, _, _), Local).
getDataPrimeiraDose((_, _, DataPrimeiraDose, _, _, _, _), DataPrimeiraDose).
getDataSegundaDose((_, _, _, DataSegundaDose, _, _, _), DataSegundaDose).
getIdadeMinima((_, _, _, _, _, _, IdadeMinima), IdadeMinima).

listarVacinacao([]):- nl.
listarVacinacao([H|T]):- vacinacaoToString(H,VacinacaoToString), write(VacinacaoToString), nl, listarVacinacao(T).

vacinacaoToString(vacincao(NomeVacina, Local, DataPrimeiraDose, DataSegundaDose, HorarioInicio, HorarioFim, IdadeMinima), Resultado) :-
    string_concat('NomeVacina: ', NomeVacina, Concat1),
    string_concat(Concat1, ' - Local: ', Concat2), 
    string_concat(Concat2, Local, Concat3),
    string_concat(Concat3, ' - DataPrimeiraDose: ', Concat4), 
    string_concat(Concat4, DataPrimeiraDose, Concat5),
    string_concat(Concat5, ' - DataSegundaDose: ', Concat6),
    string_concat(Concat6, DataSegundaDose, Concat7),
    string_concat(Concat7, ' - HorarioInicio: ', Concat8),
    string_concat(Concat8, HorarioInicio, Concat9),
    string_concat(Concat9, ' - HorarioFim: ', Concat10),
    string_concat(Concat10, HorarioFim, Concat11),
    string_concat(Concat11, ' - IdadeMinima: ', Concat12),
    string_concat(Concat12, IdadeMinima, Resultado).