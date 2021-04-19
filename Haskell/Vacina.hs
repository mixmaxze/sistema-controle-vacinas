module Vacina where

data Vacina = Vacina {nome:: String, dataFabricacao:: String, dataValidade::String, laboratorio:: String, estoque:: Int, 
quantidadeDosesNecessarias::Int, enfermidade:: String, taxaEficiencia:: Int, seloAprovacao::String, paisOrigem:: String} deriving(Show, Eq)

adicionaVacina:: String -> String -> String -> String -> Int -> Int -> String -> Int -> String -> String-> Vacina
adicionaVacina nome dataFabricacao dataValidade laboratorio estoque quantidadeDosesNecessarias enfermidade taxaEficiencia seloAprovacao paisOrigem = 
    (Vacina {nome = nome,
    dataFabricacao = dataFabricacao,
    dataValidade = dataValidade,
    laboratorio = laboratorio,
    estoque = estoque,
    quantidadeDosesNecessarias = quantidadeDosesNecessarias,
    enfermidade = enfermidade,
    taxaEficiencia = taxaEficiencia,
    seloAprovacao = seloAprovacao,
    paisOrigem = paisOrigem
    })

todasAsVacinas:: [Vacina] -> String
todasAsVacinas [] = ""
todasAsVacinas (h:t) = "Nome: " ++ nome h ++ "Data de fabricação: " ++ dataFabricacao h ++
        " " ++ "Data de validade: " ++ dataValidade h ++ " " ++ "Laboratório: " ++ laboratorio h ++ " "
        ++ "Estoque: " ++ show (estoque h) ++ " Quantidade de doses necessarias: " ++ show (quantidadeDosesNecessarias h) ++ " " ++
        "Enfermidade: " ++ enfermidade h++ " "++ "Taxa de eficiência" ++ show (taxaEficiencia h) ++ 
        " "  ++ "Selo de aprovação: " ++ seloAprovacao h ++ "Pais de origem: "++ paisOrigem h ++ "\n" ++ todasAsVacinas t