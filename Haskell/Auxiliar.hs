module Auxiliar where

import qualified Vacina
import qualified Paciente
import qualified Vacinacao
import Data.Map as Map (fromList, Map)
import Data.List
import Data.List.Split (splitOn)
import System.IO.Strict as Strict ( readFile )

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
                show (Vacina.enfermidade vacina) ++ "," ++ 
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
                    show (Paciente.telefone paciente) ++ "," ++ "\n"
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
                    show (Vacinacao.faixaEtaria vacinacao) ++ "," ++ "\n"
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
        Vacinacao.faixaEtaria = read (lista !! 6)
    }

escreverPacientes :: [Paciente.Paciente] -> IO()
escreverPacientes [] = return ()
escreverPacientes (h:t) = do   
    let pacienteStr = Paciente.nome h ++ "," ++  show (Paciente.sexo h) ++ "," ++ show (Paciente.cpf h) ++ "," ++ show(Paciente.endereco h) ++ "," ++ show(Paciente.idade h) ++ "," ++ Paciente.telefone h ++ "," ++ "\n"
    appendFile "dados/pacientes.txt" pacienteStr
    escreverPacientes t
    return ()

reescreverPacientes :: [Paciente.Paciente] -> IO()
reescreverPacientes pacientes = do
    writeFile "dados/pacientes.txt" ("")
    escreverPacientes pacientes
    return()


pegaOpcaoRetornaListaPaciente :: String -> String -> String -> [Paciente.Paciente] -> IO()
pegaOpcaoRetornaListaPaciente opcao cpf novoValor lista 
    | (opcao == "1") = reescreverPacientes(Paciente.atualizaNomePaciente cpf lista novoValor )
    | (opcao == "2") = reescreverPacientes(Paciente.atualizaSexoPaciente cpf lista novoValor )
    | (opcao == "3") = reescreverPacientes(Paciente.atualizaTelefonePaciente cpf lista novoValor )
    | (opcao == "4") = reescreverPacientes(Paciente.atualizaEnderecoPaciente cpf lista novoValor )
    | (opcao == "5") = reescreverPacientes(Paciente.atualizaIdadePaciente cpf lista (read novoValor) )
    | otherwise = return ()

escreverVacinas :: [Vacina.Vacina] -> IO()
escreverVacinas [] = return ()
escreverVacinas (h:t) = do   
    let vacinaStr = Vacina.nome h ++ "," ++ 
                show (Vacina.dataFabricacao h) ++ "," ++ 
                show (Vacina.dataValidade h) ++ "," ++ 
                Vacina.laboratorio h ++ "," ++ 
                show (Vacina.estoque h) ++ "," ++ 
                show (Vacina.quantidadeDosesNecessarias h) ++ "," ++ 
                Vacina.enfermidade h ++ "," ++ 
                show (Vacina.taxaEficiencia h) ++ "," ++ 
                Vacina.seloAprovacao h ++ "," ++ 
                Vacina.paisOrigem h ++ "\n"
    appendFile "dados/vacinas.txt" vacinaStr
    escreverVacinas t
    return ()

reescreverVacinas :: [Vacina.Vacina] -> IO()
reescreverVacinas vacinas = do
    writeFile "dados/vacinas.txt" ("")
    escreverVacinas vacinas
    return()

pegaOpcaoRetornaListaVacinas :: String -> String -> String -> [Vacina.Vacina] -> IO()
pegaOpcaoRetornaListaVacinas opcao nomeVacina novoValor lista 
    | (opcao == "1") = reescreverVacinas(Vacina.atualizaDataFabricacao nomeVacina lista novoValor)
    | (opcao == "2") = reescreverVacinas(Vacina.atualizaDataValidade nomeVacina lista novoValor)
    | (opcao == "3") = reescreverVacinas(Vacina.atualizarLaboratorio nomeVacina lista novoValor)
    | (opcao == "4") = reescreverVacinas(Vacina.atualizaEstoque nomeVacina lista ( read novoValor))
    | (opcao == "5") = reescreverVacinas(Vacina.atualizaDosesNecessarias nomeVacina lista ( read novoValor))
    | (opcao == "6") = reescreverVacinas(Vacina.atualizaEnfermidade nomeVacina lista novoValor)
    | (opcao == "7") = reescreverVacinas(Vacina.atualizaTaxaEficiencia nomeVacina lista (read novoValor))
    | (opcao == "8") = reescreverVacinas(Vacina.atualizaSeloAprovacao nomeVacina lista novoValor)
    | (opcao == "9") = reescreverVacinas(Vacina.atualizaPaisOrigem nomeVacina lista novoValor)
    | otherwise = return ()

