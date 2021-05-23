:- style_check(-singleton).

constroiPaciente(Nome, Sexo, CPF, Endereco, Idade, Telefone, paciente(Nome, Sexo, CPF, Endereco, Idade, Telefone)).

/* retorna os dados do Paciente */
getPacienteNome(paciente(Nome, _, _, _, _, _), Nome).
getPacienteSexo(paciente(_, Sexo, _, _, _, _), Sexo).
getPacienteCPF(paciente(_, _, CPF, _, _, _), CPF).
getPacienteEndereco(paciente(_, _, _, Endereco, _, _), Endereco).
getPacienteIdade(paciente(_, _, _, _, Idade, _), Idade).
getPacienteTelefone(paciente(_, _, _, _, _, Telefone), Telefone).
%getIddPaciente(_,[],ListaVacinacao):- write('Paciente não existe.').
getIddPaciente(_,[],IdadePaciente) :- nl.
getIddPaciente(Cpf,[H|T],IdadePaciente):- getPacienteCPF(H,CpfPacienteH),
    (Cpf = CpfPacienteH -> IdadePaciente is Idade,getPacienteIdade(H,IdadeH),atom_number(IdadeH,Idade);
    getIddPaciente(Cpf,T,IdadePaciente)).

% busca paciente
buscaPaciente(_,[],Resultado):- Resultado = 'Paciente não encontrado.'.
buscaPaciente(Cpf,[H|T], Resultado):- getPacienteCPF(H,CpfPaciente),
            (Cpf = CpfPaciente -> Resultado is pacienteToString(H); buscaPaciente(NomePaciente,T,Resultado)).

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
