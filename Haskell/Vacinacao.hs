module Vacinacao where

data Vacinacao = Vacinacao {nomeVacina :: String, local :: String, dataPrimeiraDose :: String, dataSegundaDose :: String, horarioInicio :: String, horarioFim :: String, faixaEtariaInicio :: Int, faixaEtariaFim :: Int} deriving(Show, Eq)

adicionaVacinacao :: String -> String -> String -> String -> String -> String -> Int -> Int -> Vacinacao
adicionaVacinacao nomeVacina local dataPrimeiraDose dataSegundaDose horarioInicio horarioFim faixaEtariaInicio faixaEtariaFim =
     (Vacinacao {
         nomeVacina = nomeVacina,
         local = local,
         dataPrimeiraDose = dataPrimeiraDose,
         dataSegundaDose = dataSegundaDose,
         horarioInicio = horarioInicio,
         horarioFim = horarioFim,
         faixaEtariaInicio = faixaEtariaInicio,
         faixaEtariaFim = faixaEtariaFim
     })


calculaProjecaoVacinacao :: Int -> Int -> Int
calculaProjecaoVacinacao mediaVacinacaoDiaria totalPacientes 
                | mediaVacinacaoDiaria > totalPacientes = 1
                | mod (totalPacientes)  (mediaVacinacaoDiaria) /= 0 = div (totalPacientes) (mediaVacinacaoDiaria) + 1 
                | otherwise = div (totalPacientes) (mediaVacinacaoDiaria) 


