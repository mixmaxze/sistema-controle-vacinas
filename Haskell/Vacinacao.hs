module Vacinacao where

data Vacinacao = Vacinacao {nomeVacina :: String, local :: String, dataPrimeiraDose :: String, dataSegundaDose :: String, horarioInicio :: String, horarioFim :: String, faixaEtaria :: Int } deriving(Show, Eq)

adicionaVacinacao :: String -> String -> String -> String -> String -> String -> Int -> Vacinacao
adicionaVacinacao nomeVacina local dataPrimeiraDose dataSegundaDose horarioInicio horarioFim faixaEtaria =
     (Vacinacao {
         nomeVacina = nomeVacina,
         local = local,
         dataPrimeiraDose = dataPrimeiraDose,
         dataSegundaDose = dataSegundaDose,
         horarioInicio = horarioInicio,
         horarioFim = horarioFim,
         faixaEtaria = faixaEtaria
    
     })


calculaProjecaoVacinacao :: Int -> Int -> Int
calculaProjecaoVacinacao mediaVacinacaoDiaria totalPacientes 
                | mediaVacinacaoDiaria > totalPacientes = 1
                | mod (totalPacientes)  (mediaVacinacaoDiaria) /= 0 = div (totalPacientes) (mediaVacinacaoDiaria) + 1 
                | otherwise = div (totalPacientes) (mediaVacinacaoDiaria) 

checaSituacao :: Int -> [Vacinacao]-> String
checaSituacao _ [] = ""
checaSituacao idade (h:t)
                    | idade >= faixaEtaria h && dataSegundaDose h == "" = "O paciente em questão tem sua vacinação da vacina " ++ nomeVacina h ++ " programada para:\n" ++ 
                                            "Primeira e Única Dose: " ++ dataPrimeiraDose h ++ "\n" ++
                                            "Das " ++ horarioInicio h ++ " às " ++ horarioFim h ++ "\n" ++ 
                                             checaSituacao idade t ++ "\n"
                    | idade >= faixaEtaria h && dataSegundaDose h /= "" = "O paciente em questão tem sua vacinação da vacina " ++ nomeVacina h ++ " programada para:\n" ++ 
                                            "Primeira Dose: " ++ dataPrimeiraDose h ++ "\n" ++
                                            "Segunda Dose: " ++ dataSegundaDose h ++ "\n" ++ 
                                            "Das " ++ horarioInicio h ++ " às " ++ horarioFim h ++ "\n" ++ 
                                            checaSituacao idade t ++ "\n"
                    | otherwise = "Paciente não possui expectativa de vacinação para a vacina " ++ nomeVacina h ++  "ainda. \n" ++ checaSituacao idade t


pegaFaixaEtatariaVacinacao :: String -> [Vacinacao] -> Int
pegaFaixaEtatariaVacinacao _ [] = 0
pegaFaixaEtatariaVacinacao nomeDaVacina (h:t)
                        | nomeDaVacina == nomeVacina h = faixaEtaria h
                        | otherwise = pegaFaixaEtatariaVacinacao nomeDaVacina t