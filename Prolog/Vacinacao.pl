:- style_check(-singleton).

constroiVacinacao(NomeVacina, Local, DataPrimeiraDose, DataSegundaDose, HorarioInicio, HorarioFim, IdadeMinima, vacinacao(NomeVacina, Local, DataPrimeiraDose, DataSegundaDose, HorarioInicio, HorarioFim, IdadeMinima)).

%gets
getNomeVacina(vacinacao(NomeVacina, _, _, _, _, _, _), NomeVacina).
getLocal(vacinacao(_, Local, _, _, _, _, _), Local).
getDataPrimeiraDose(vacinacao(_, _, DataPrimeiraDose, _, _, _, _), DataPrimeiraDose).
getDataSegundaDose(vacinacao(_, _, _, DataSegundaDose, _, _, _), DataSegundaDose).
getIdadeMinima(vacinacao(_, _, _, _, _, _, IdadeMinima), IdadeMinima).

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

% situação do paciente
verSituacaoPaciente(_,[]) :- nl.
verSituacaoPaciente(IdadePaciente,[H|T]):- getIdadeMinima(H,IdadeMinima),getNomeVacina(H,NomeVacina),getDataPrimeiraDose(H,DataPrimeiraDose),getDataSegundaDose(H,DataSegundaDose),getLocal(H,LocalVacinacao),
    (IdadePaciente >= IdadeMinima , DataSegundaDose = '' -> write(NomeVacina),write(' em: '),nl,
    write('Primeira dose : '),write(DataPrimeiraDose),nl,
    write('Onde? '),write(LocalVacinacao),nl,nl,verSituacaoPaciente(IdadePaciente,T);
    (IdadePaciente >= IdadeMinima , DataSegundaDose \= '' -> write(NomeVacina),write(' em: '),nl,
    write('Primeira dose : '),write(DataPrimeiraDose),nl,
    write('Segunda dose : '),write(DataSegundaDose),nl,
    write('Onde? '),write(LocalVacinacao),nl,nl,verSituacaoPaciente(IdadePaciente,T));
    verSituacaoPaciente(IdadePaciente,T)).


getIddMinima(_,[],Retorno):-nl.
getIddMinima(NomeVacinaASerAplicada,[H|T],Retorno):- getNomeVacina(H,NomeVacinaH),string_upper(NomeVacinaH, NomeUpper), string_upper(NomeVacinaASerAplicada, NomeVacinaUpper),
    (NomeVacinaUpper = NomeUpper -> getIdadeMinima(H,IdadeMinima),Retorno is IdadeMinima;
    getIdadeMinima(NomeVacinaASerAplicada,T,Retorno)).