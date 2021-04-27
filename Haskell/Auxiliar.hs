module Auxiliar where

import qualified Vacina
import qualified Paciente
import qualified Vacinacao
import Data.Map as Map (fromList, Map)
import Data.List
import Data.List.Split (splitOn)
import System.IO as Strict

criaArquivos :: IO()
criaArquivos = do
    appendFile "dados/pacientes.txt" ("")
    appendFile "dados/vacinas.txt" ("")
   
iniciaVacina:: IO[Vacina.Vacina]
iniciaVacina = do
    arquivo <- Strict.readFile "dados/vacinas.txt"
    let lista = map (splitOn ",") (lines arquivo)
    let lista_vacina = Data.List.map constroiVacina lista
    return lista_vacina

iniciaPaciente:: IO[Paciente.Paciente ]
iniciaPaciente = do
    arquivo <- Strict.readFile "dados/pacientes.txt"
    let lista = map (splitOn ",") (lines arquivo)
    let lista_paciente = Data.List.map constroiPaciente lista
    return lista_paciente

iniciaVacinacao:: IO[Vacinacao.Vacinacao]
iniciaVacinacao = do
    arquivo <- Strict.readFile "dados/vacinações.txt"
    let lista = map (splitOn ",") (lines arquivo)
    let lista_vacinacoes = Data.List.map constroiVacinacao lista
    return lista_vacinacoes

escreverVacina:: Vacina.Vacina -> IO()
escreverVacina vacina = do
    let vacinaStr = Vacina.nome vacina ++ "," ++ 
                show (Vacina.dataFabricacao vacina) ++ "," ++ 
                show (Vacina.dataValidade vacina) ++ "," ++ 
                Vacina.laboratorio vacina ++ "," ++ 
                show (Vacina.estoque vacina) ++ "," ++ 
                show (Vacina.quantidadeDosesNecessarias vacina) ++ "," ++ 
                Vacina.enfermidade vacina ++ "," ++ 
                show (Vacina.taxaEficiencia vacina) ++ "," ++ 
                Vacina.seloAprovacao vacina ++ "," ++ 
                Vacina.paisOrigem vacina ++ "\n"
    appendFile "dados/vacinas.txt" vacinaStr
    return ()

escreverPaciente:: Paciente.Paciente -> IO()
escreverPaciente paciente = do
    
    let pacienteStr = Paciente.nome paciente ++ "," ++ 
                    show (Paciente.sexo paciente) ++ "," ++ 
                    show (Paciente.cpf paciente) ++ "," ++ 
                    show(Paciente.endereco paciente) ++ "," ++ 
                    show(Paciente.idade paciente) ++ "," ++ 
                    Paciente.telefone paciente ++ "," ++ "\n"
    appendFile "dados/pacientes.txt" pacienteStr
    return ()

escreverVacinacao :: Vacinacao.Vacinacao -> IO()
escreverVacinacao vacinacao = do
    let vacinacaoStr = Vacinacao.nomeVacina vacinacao ++ "," ++
                    Vacinacao.local vacinacao ++ "," ++
                    Vacinacao.dataPrimeiraDose vacinacao ++ "," ++
                    Vacinacao.dataSegundaDose vacinacao ++ "," ++
                    Vacinacao.horarioInicio vacinacao ++ "," ++
                    Vacinacao.horarioFim vacinacao ++ "," ++
                    show (Vacinacao.faixaEtariaInicio vacinacao) ++ "," ++
                    show (Vacinacao.faixaEtariaFim vacinacao) ++ "," ++ "\n"
    appendFile "dados/vacinações.txt" vacinacaoStr
    return()

constroiVacina :: [String] -> Vacina.Vacina 
constroiVacina lista = 
    Vacina.Vacina {
        Vacina.nome = lista !! 0,
        Vacina.dataFabricacao  =  read (lista !! 1),
        Vacina.dataValidade =  read (lista !! 2),
        Vacina.laboratorio =  lista !! 3,
        Vacina.estoque = read (lista !! 4),
        Vacina.quantidadeDosesNecessarias = read (lista !! 5),
        Vacina.enfermidade =  lista !! 6,
        Vacina.taxaEficiencia = read (lista !! 7),
        Vacina.seloAprovacao =  lista !! 8,
        Vacina.paisOrigem = lista !! 9
    }

constroiPaciente :: [String] -> Paciente.Paciente 
constroiPaciente lista = 
    Paciente.Paciente {
        Paciente.nome = lista !! 0,
        Paciente.sexo  =  read (lista !! 1),
        Paciente.cpf =  read (lista !! 2),
        Paciente.endereco =  read (lista !! 3),
        Paciente.idade = read (lista !! 4),
        Paciente.telefone =  lista !! 5
    }

constroiVacinacao :: [String] -> Vacinacao.Vacinacao
constroiVacinacao lista =
    Vacinacao.Vacinacao {
        Vacinacao.nomeVacina = lista !! 0,
        Vacinacao.local = lista !! 1,
        Vacinacao.dataPrimeiraDose = lista !! 2,
        Vacinacao.dataSegundaDose  = lista !! 3,
        Vacinacao.horarioInicio  = lista !! 4,
        Vacinacao.horarioFim  = lista !! 5,
        Vacinacao.faixaEtariaInicio = read (lista !! 6),
        Vacinacao.faixaEtariaFim  = read (lista !! 7)
    }