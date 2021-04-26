module Paciente where

data Paciente = Paciente {nome:: String, sexo:: String, cpf::String, cep:: String, bairro:: String, 
rua::String, numResidencia:: Int, idade:: Int, telefone::String} deriving(Show, Eq)

adicionaPaciente:: String -> String -> String -> String -> String -> String -> Int -> Int -> String -> Paciente
adicionaPaciente nome sexo cpf cep bairro rua numResidencia idade telefone = 
    (Paciente {nome = nome,
    sexo = sexo,
    cpf = cpf,
    cep = cep,
    bairro = bairro,
    rua = rua,
    numResidencia = numResidencia,
    idade = idade,
    telefone = telefone
})

todosOsPacientes:: [Paciente] -> String
todosOsPacientes [] = ""
todosOsPacientes (h:t) = "Nome: " ++ nome h ++ ", " ++ 
                        "Sexo: " ++ show(sexo h) ++ ", " ++ 
                        "CEP: " ++ show(cep h) ++ ", " ++ 
                        "Bairro: " ++ bairro h ++ ", " ++ 
                        "Rua: " ++ rua h ++ " " ++ 
                        "Num. Residência: " ++ show(numResidencia h) ++ ", " ++ 
                        "Idade: " ++ show(idade h) ++ ", " ++ 
                        "Telefone: " ++ telefone h ++ 
                        todosOsPacientes t


pegaIdadePaciente :: String -> [Paciente] -> Int
pegaIdadePaciente _ [] = 0 
pegaIdadePaciente cpfPaciente (h:t)
    | cpf h == cpfPaciente = idade h
    |otherwise = pegaIdadePaciente cpfPaciente t

