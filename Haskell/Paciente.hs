module Paciente where

import Data.List

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
                        "CPF: " ++ cpf h ++ ", " ++ 
                        "Endereço: " ++ endereco h ++ ", " ++ 
                        "Idade: " ++ show(idade h) ++ ", " ++ 
                        "Telefone: " ++ telefone h ++ "\n" ++ 
                        todosOsPacientes t


pegaIdadePaciente :: String -> [Paciente] -> Int
pegaIdadePaciente _ [] = 0
pegaIdadePaciente cpfPaciente (h:t)
    | cpf h == cpfPaciente = idade h
    |otherwise = pegaIdadePaciente cpfPaciente t

pegaPacientesHabilitados :: Int -> [Paciente] -> String
pegaPacientesHabilitados _ [] = ""
pegaPacientesHabilitados faixaEtaria (h:t)
                        | idade h >= faixaEtaria = "Nome: | " ++ nome h ++ " | Telefone: | " ++ telefone h ++ " | Sexo: " ++ sexo h ++ "\n" ++ pegaPacientesHabilitados faixaEtaria t ++ "\n"
                        | otherwise = pegaPacientesHabilitados faixaEtaria t ++ "\n"

atualizaEnderecoPaciente :: String -> [Paciente] -> String -> [Paciente]
atualizaEnderecoPaciente cpfPaciente [] novoEndereco = []
atualizaEnderecoPaciente cpfPaciente (h:t) novoEndereco 
    | cpfPaciente == cpf h = ((Paciente(nome h) (sexo h) (cpf h) (novoEndereco) (idade h) (telefone h)) : t)
    | otherwise =  (h: atualizaEnderecoPaciente cpfPaciente t novoEndereco)

atualizaNomePaciente :: String -> [Paciente] -> String -> [Paciente]
atualizaNomePaciente cpfPaciente [] novoValor = []
atualizaNomePaciente cpfPaciente (h:t) novoValor 
    | cpfPaciente ==  cpf h = ((Paciente(novoValor) (sexo h) (cpf h) (endereco h) (idade h) (telefone h)) : t)
    | otherwise =  (h: atualizaNomePaciente cpfPaciente t novoValor)

atualizaSexoPaciente :: String -> [Paciente] -> String -> [Paciente]
atualizaSexoPaciente cpfPaciente [] novoValor = []
atualizaSexoPaciente cpfPaciente (h:t) novoValor 
    | cpfPaciente == cpf h = ((Paciente(nome h) (novoValor) (cpf h) (endereco h) (idade h) (telefone h)) : t)
    | otherwise =  (h: atualizaSexoPaciente cpfPaciente t novoValor)

atualizaTelefonePaciente :: String -> [Paciente] -> String -> [Paciente]
atualizaTelefonePaciente cpfPaciente [] novoValor = []
atualizaTelefonePaciente cpfPaciente (h:t) novoValor 
    | cpfPaciente == cpf h = ((Paciente(nome h) (sexo h) (cpf h) (endereco h) (idade h) (novoValor)) : t)
    | otherwise =  (h: atualizaTelefonePaciente cpfPaciente t novoValor)

atualizaIdadePaciente :: String -> [Paciente] -> Int -> [Paciente]
atualizaIdadePaciente cpfPaciente [] novoValor = []
atualizaIdadePaciente cpfPaciente (h:t) novoValor 
    | cpfPaciente == cpf h = ((Paciente(nome h) (sexo h) (cpf h) (endereco h) (novoValor) (telefone h)) : t)
    | otherwise =  (h: atualizaIdadePaciente cpfPaciente t novoValor)