module Paciente where

data Paciente = Paciente {nome:: String, sexo:: String, cpf::String, endereco:: String, idade:: Int, telefone::String} deriving(Show, Eq)

adicionaPaciente:: String -> String -> String -> String -> Int -> String -> Paciente
adicionaPaciente nome sexo cpf endereco idade telefone = 
    (Paciente {nome = nome,
    sexo = sexo,
    cpf = cpf,
    endereco = endereco,
    idade = idade,
    telefone = telefone
})

todosOsPacientes:: [Paciente] -> String
todosOsPacientes [] = ""
todosOsPacientes (h:t) = "Nome: " ++ nome h ++ ", " ++ 
                        "Sexo: " ++ show(sexo h) ++ ", " ++ 
                        "Endereço: " ++ show(endereco h) ++ ", " ++ 
                        "Idade: " ++ show(idade h) ++ ", " ++ 
                        "Telefone: " ++ telefone h ++ "\n" ++ 
                        todosOsPacientes t


pegaIdadePaciente :: String -> [Paciente] -> Int
pegaIdadePaciente _ [] = 0
pegaIdadePaciente cpfPaciente (h:t)
    | cpf h == cpfPaciente = idade h
    |otherwise = pegaIdadePaciente cpfPaciente t

contaPaciente :: [Paciente] -> Int
contaPaciente [] = 0
contaPaciente lista = length (lista)