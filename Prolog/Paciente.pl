:- style_check(-singleton).
:- style_check(-discontiguous).

constroiPaciente(Nome, Sexo, CPF, Endereco, Idade, Telefone, paciente(Nome, Sexo, CPF, Endereco, Idade, Telefone)).

/* retorna os dados do Paciente */
getPacienteNome((Nome, _, _, _, _, _), Nome).
getPacienteSexo((_, Sexo, _, _, _, _), Sexo).
getPacienteCPF((_, _, CPF, _, _, _), CPF).
getPacienteEndereco((_, _, _, Endereco, _, _), Endereco).
getPacienteIdade((_, _, _, _, Idade, _), Idade).
getPacienteTelefone((_, _, _, _, _, Telefone), Telefone).

% busca paciente
buscaPaciente(_,[],Resultado):- Resultado = 'Paciente não encontrado.'.
buscaPaciente(NomePaciente,[H|T], Resultado):- getPacienteNome(H,Nome), string_upper(Nome, NomeUpper), string_upper(NomePaciente, NomePacienteUpper),
            (NomeUpper = NomePacienteUpper -> Resultado = H; buscaPaciente(NomePaciente,T,Resultado)).

% lista os pacientes
listarPacientes([]):- nl.
listarPacientes([H|T]):- pacienteToString(H,PacienteToString), write(PacienteToString), nl, listarPacientes(T).

% representação em texto do paciente
pacienteToString(paciente(Nome,Sexo, CPF, Endereco, Idade, Telefone), Resultado) :- 
    string_concat('Nome: ', Nome, Concat1),
    string_concat(Concat1, ' - Sexo: ', Concat2), 
    string_concat(Concat2, Sexo, Concat3),
    string_concat(Concat3, ' - CPF: ', Concat4), 
    string_concat(Concat4, CPF, Concat5),
    string_concat(Concat5, ' - Endereço: ', Concat6),
    string_concat(Concat6, Endereco, Concat7),
    string_concat(Concat7, ' - Idade: ', Concat8),
    string_concat(Concat8, Idade, Concat9),
    string_concat(Concat9, ' - Telefone: ', Concat10),
    string_concat(Concat10, Telefone, Resultado).

deletaPaciente([], ListaAtual, CpfPaciente, NovaLista).
deletaPaciente([H|T], ListaAtual, CpfPaciente, NovaLista):- 
    getPacienteCPF(H,Cpf), string_upper(Cpf, CpfUpper), string_upper(CpfPaciente, CpfPacienteUpper),
    (CpfUpper == CpfPacienteUpper -> delete(ListaAtual,H, NovaLista);
    deletaPaciente(T, ListaAtual, CpfPaciente, NovaLista)).

atualizaNomePaciente([], CpfPaciente, NovoValor, PacienteSaida).
atualizaNomePaciente([H|T], CpfPaciente, NovoValor, PacienteSaida):-
    getPacienteCPF(H,Cpf), string_upper(Cpf, CpfUpper), string_upper(CpfPaciente, CpfPacienteUpper),
    (CpfUpper == CpfPacienteUpper -> novoNomePaciente(H, NovoValor, PacienteSaida), pacienteToString(PacienteSaida,Result), write(Result), nl;
    atualizaNomePaciente(T, CpfPaciente, NovoValor, PacienteSaida)).

novoNomePaciente(Paciente, NovoValor, Result):- 
    getPacienteNome(Paciente, NOME),
    getPacienteCPF(Paciente, CPF),
    getPacienteEndereco(Paciente, ENDERECO),
    getPacienteIdade(Paciente, IDADE),
    getPacienteSexo(Paciente, SEXO),
    getPacienteTelefone(Paciente, TELEFONE),
    constroiPaciente(NovoValor, SEXO, CPF, ENDERECO, IDADE, TELEFONE, Result).

atualizaSexoPaciente([], CpfPaciente, NovoValor, PacienteSaida).
atualizaSexoPaciente([H|T], CpfPaciente, NovoValor, PacienteSaida):-
    getPacienteCPF(H,Cpf), string_upper(Cpf, CpfUpper), string_upper(CpfPaciente, CpfPacienteUpper),
    (CpfUpper == CpfPacienteUpper -> novoSecsoPaciente(H, NovoValor, PacienteSaida), pacienteToString(PacienteSaida,Result), write(Result), nl;
    atualizaSexoPaciente(T, CpfPaciente, NovoValor, PacienteSaida)).

novoSecsoPaciente(Paciente, NovoValor, Result):- 
    getPacienteNome(Paciente, NOME),
    getPacienteCPF(Paciente, CPF),
    getPacienteEndereco(Paciente, ENDERECO),
    getPacienteIdade(Paciente, IDADE),
    getPacienteSexo(Paciente, SEXO),
    getPacienteTelefone(Paciente, TELEFONE),
    constroiPaciente(NOME, NovoValor, CPF, ENDERECO, IDADE, TELEFONE, Result).

atualizaTelefonePaciente([], CpfPaciente, NovoValor, PacienteSaida).
atualizaTelefonePaciente([H|T], CpfPaciente, NovoValor, PacienteSaida):-
    getPacienteCPF(H,Cpf), string_upper(Cpf, CpfUpper), string_upper(CpfPaciente, CpfPacienteUpper),
    (CpfUpper == CpfPacienteUpper -> novoTelPaciente(H, NovoValor, PacienteSaida), pacienteToString(PacienteSaida,Result), write(Result), nl;
    atualizaTelefonePaciente(T, CpfPaciente, NovoValor, PacienteSaida)).

novoTelPaciente(Paciente, NovoValor, Result):- 
    getPacienteNome(Paciente, NOME),
    getPacienteCPF(Paciente, CPF),
    getPacienteEndereco(Paciente, ENDERECO),
    getPacienteIdade(Paciente, IDADE),
    getPacienteSexo(Paciente, SEXO),
    getPacienteTelefone(Paciente, TELEFONE),
    constroiPaciente(NOME, SEXO, CPF, ENDERECO, IDADE, NovoValor, Result).

atualizaEnderecoPaciente([], CpfPaciente, NovoValor, PacienteSaida).
atualizaEnderecoPaciente([H|T], CpfPaciente, NovoValor, PacienteSaida):-
    getPacienteCPF(H,Cpf), string_upper(Cpf, CpfUpper), string_upper(CpfPaciente, CpfPacienteUpper),
    (CpfUpper == CpfPacienteUpper -> novoEndPaciente(H, NovoValor, PacienteSaida), pacienteToString(PacienteSaida,Result), write(Result), nl;
    atualizaEnderecoPaciente(T, CpfPaciente, NovoValor, PacienteSaida)).

novoEndPaciente(Paciente, NovoValor, Result):- 
    getPacienteNome(Paciente, NOME),
    getPacienteCPF(Paciente, CPF),
    getPacienteEndereco(Paciente, ENDERECO),
    getPacienteIdade(Paciente, IDADE),
    getPacienteSexo(Paciente, SEXO),
    getPacienteTelefone(Paciente, TELEFONE),
    constroiPaciente(NOME, SEXO, CPF, NovoValor, IDADE, TELEFONE, Result).

atualizaIdadePaciente([], CpfPaciente, NovoValor, PacienteSaida).
atualizaIdadePaciente([H|T], CpfPaciente, NovoValor, PacienteSaida):-
    getPacienteCPF(H,Cpf), string_upper(Cpf, CpfUpper), string_upper(CpfPaciente, CpfPacienteUpper),
    (CpfUpper == CpfPacienteUpper -> novoIdadePaciente(H, NovoValor, PacienteSaida), pacienteToString(PacienteSaida,Result), write(Result), nl;
    atualizaIdadePaciente(T, CpfPaciente, NovoValor, PacienteSaida)).

novoIdadePaciente(Paciente, NovoValor, Result):- 
    getPacienteNome(Paciente, NOME),
    getPacienteCPF(Paciente, CPF),
    getPacienteEndereco(Paciente, ENDERECO),
    getPacienteIdade(Paciente, IDADE),
    getPacienteSexo(Paciente, SEXO),
    getPacienteTelefone(Paciente, TELEFONE),
    constroiPaciente(NOME, SEXO, CPF, ENDERECO, NovoValor, TELEFONE, Result).
