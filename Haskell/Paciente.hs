module Paciente where

data Paciente = Paciente {nome:: String, sexo:: Char, cpf::Int, cep:: Int, bairro:: String, 
rua::String, numResidencia:: Int, dataNascimento:: String, telefone::String} deriving(Show, Eq)

adicionaPaciente:: String -> Char -> Int -> Int -> String -> String -> Int -> String -> String -> Paciente
adicionaPaciente nome sexo cpf cep bairro rua numResidencia dataNascimento telefone = 
    (Paciente {nome = nome,
    sexo = sexo,
    cpf = cpf,
    cep = cep,
    bairro = bairro,
    rua = rua,
    numResidencia = numResidencia,
    dataNascimento = dataNascimento,
    telefone = telefone
    })

todosOsPacientes:: [Paciente] -> String
todosOsPacientes [] = ""
todosOsPacientes (h:t) = "Nome: " ++ nome h ++ 
                        "Sexo: " ++ show(sexo h) ++
                        "CEP: " ++ show(cep h) ++
                        "Bairro: " ++ bairro h ++
                        "Rua: " ++ rua h ++
                        "Num. Residência: " ++ show(numResidencia h) ++
                        "Data de nascimento: " ++ dataNascimento h ++
                        "Telefone: " ++ telefone h ++ 
                        todosOsPacientes t
