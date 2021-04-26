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


