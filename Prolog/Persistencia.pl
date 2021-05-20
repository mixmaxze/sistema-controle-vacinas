:- include('Vacina.pl').
:- include('Paciente.pl').
:- include('Vacinacao.pl').

%\\\\\\\\\\\\\\\\VACINAS/////////////////////////
salvaListaVacinas(ListaVacinas):-
    open('dados/Vacinas.txt', write, ArquivoVacinas),
    escreveTodasAsVacinas(ListaVacinas,String),
    write(ArquivoVacinas,String),
    close(ArquivoVacinas).

escreveTodasAsVacinas([],String):- String = ''.
escreveTodasAsVacinas([H|T],String):-
    escreveVacina(H,VacinaString),
    escreveTodasAsVacinas(T,StringProx),
    string_concat(VacinaString,StringProx,String).

escreveVacina(vacina(Nome,Fabricacao,Validade,Laboratorio,Quantidade,QuantidadeDoses,Doenca,Eficiencia,Selo,Pais),String):-
    string_concat(Nome, ',', Parte1), 
    string_concat(Parte1, Fabricacao, Parte2),
    string_concat(Parte2, ',', Parte3),
    string_concat(Parte3, Validade, Parte4), 
    string_concat(Parte4, ',', Parte5), 
    string_concat(Parte5, Laboratorio, Parte6), 
    string_concat(Parte6, ',', Parte7), 
    string_concat(Parte7, Quantidade, Parte8), 
    string_concat(Parte8, ',', Parte9), 
    string_concat(Parte9, QuantidadeDoses, Parte10), 
    string_concat(Parte10, ',', Parte11),
    string_concat(Parte11, Doenca, Parte12),
    string_concat(Parte12, ',', Parte13),
    string_concat(Parte13, Eficiencia, Parte14),
    string_concat(Parte14, ',', Parte15),
    string_concat(Parte15, Selo, Parte16),
    string_concat(Parte16, ',', Parte17),
    string_concat(Parte17, Pais, Parte18),
    string_concat(Parte18, '\n', String).

iniciaVacinas(ListaVacinas) :-
    open('dados/Vacinas.txt',read,Stream),
    read_file(Stream,ListaVacinasStr),
    resgataVacina(ListaVacinasStr,ListaVacinas),
    close(Stream).

resgataVacina([],_).
resgataVacina([H|T], Lista):-
    nth0(0, H, Nome),
    nth0(1, H, Fabricacao),
    nth0(2, H, Validade),
    nth0(3, H, Laboratorio),
    nth0(4, H, Quantidade),
    nth0(5, H, QuantidadeDoses),
    nth0(6, H, Doenca),
    nth0(7, H, Eficiencia),
    nth0(8, H, Selo),
    nth0(9, H, Pais),
    constroiVacina(Nome,Fabricacao,Validade,Laboratorio,Quantidade,QuantidadeDoses,Doenca,Eficiencia,Selo,Pais,Vacina),
    resgataVacina(T, ListaNova),
    append([Vacina], ListaNova, Lista).

%\\\\\\\\\\\\\\\\\\\\\\\PACIENTES////////////////////

salvaListaPacientes(ListaPacientes):- 
    open('dados/Pacientes.txt', write, ArquivoPacientes),
    escreveTodasOsPacientes(ListaPacientes,String),
    write(ArquivoPacientes,String),
    close(ArquivoPacientes).

escreveTodasOsPacientes([],String):- String = ''.
escreveTodasOsPacientes([H|T],String):-
    escrevePaciente(H,PacienteString),
    escreveTodasOsPacientes(T,StringProx),
    string_concat(PacienteString,StringProx,String).

escrevePaciente(paciente(Nome,Sexo, CPF, Endereco, Idade, Telefone),String):-
    string_concat(Nome, ',', Parte1), 
    string_concat(Parte1, Sexo, Parte2),
    string_concat(Parte2, ',', Parte3),
    string_concat(Parte3, CPF, Parte4), 
    string_concat(Parte4, ',', Parte5), 
    string_concat(Parte5, Endereco, Parte6), 
    string_concat(Parte6, ',', Parte7), 
    string_concat(Parte7, Idade, Parte8), 
    string_concat(Parte8, ',', Parte9), 
    string_concat(Parte9, Telefone, Parte10), 
    string_concat(Parte10, '\n', String).

iniciaPacientes(ListaPacientes):-
    open('dados/Pacientes.txt',read,Stream),
    read_file(Stream,ListaPacientesStr),
    resgataPaciente(ListaPacientesStr,ListaPacientes),
    close(Stream).

resgataPaciente([],_).
resgataPaciente([H|T],Lista):-
    nth0(0, H, Nome),
    nth0(1, H, Sexo),
    nth0(2, H, CPF),
    nth0(3, H, Endereco),
    nth0(4, H, Idade),
    nth0(5, H, Telefone),
    constroiPaciente(Nome,Sexo, CPF, Endereco, Idade, Telefone, Paciente),
    resgataPaciente(T, ListaNova),
    append([Paciente],ListaNova,Lista).


read_file(Stream,[]) :-
    at_end_of_stream(Stream).

read_file(Stream,[X|L]) :-
    \+ at_end_of_stream(Stream),
    read_line_to_string(Stream, String),
    atomic_list_concat(X,",", String),
    read_file(Stream,L),!.
