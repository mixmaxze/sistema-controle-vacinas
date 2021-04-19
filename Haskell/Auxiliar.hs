module Auxiliar where

import qualified Vacina
import qualified Paciente
import Data.Map as Map (fromList, Map)
import Data.List
import System.IO

iniciaVacina:: IO[Vacina.Vacina]
iniciaVacina = do
    arquivo <- readFile "dados/vacina.txt"
    let lista = map (splitOn ",") (lines arquivo)
    let lista_vacina = Data.list.map constroiVacina lista
    return lista_vacina

escreverVacina:: Vacina.Vacina -> IO()
escreverVacina vacina = do
    let vacinaStr = Vacina.nome vacina ++ "," ++ Vacina.dataFabricacao vacina ++ "," ++ Vacina.dataValidade vacina ++ "," ++ Vacina.laboratorio vacina ++ "," ++ show (Vacina.estoque vacina) ++ "," ++ show (Vacina.quantidadeDosesNecessarias vacina) ++ "," ++ Vacina.enfermidade vacina ++ "," ++ show (Vacina.taxaEficiencia vacina) ++ "," ++ Vacina.seloAprovacao vacina ++ "," ++ Vacina.paisOrigem vacina ++ "\n"
    appendFile "dados/vacina.txt" vacinaStr
    return ()


escreverPaciente:: Paciente.Paciente -> IO()
escreverPaciente paciente = do
    let pacienteStr = Paciente.nome paciente ++ "," ++ show (Paciente.sexo paciente) ++ "," ++ show (Paciente.cpf paciente) ++ "," ++ show (Paciente.cep paciente) ++ "," ++ Paciente.bairro paciente ++ "," ++ Paciente.rua paciente ++ "," ++ show(Paciente.numResidencia paciente) ++ "," ++ Paciente.dataNascimento paciente ++ "," ++ Paciente.telefone paciente ++ "," ++ "\n"
    appendFile "dados/paciente.txt" pacienteStr
    return ()