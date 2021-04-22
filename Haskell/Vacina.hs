module Vacina where
import Data.Time.Calendar

data Vacina = Vacina {nome:: String, dataFabricacao:: Day, dataValidade::Day, laboratorio:: String, estoque:: Int, 
quantidadeDosesNecessarias::Int, enfermidade:: String, taxaEficiencia:: Int, seloAprovacao::String, paisOrigem:: String} deriving(Show, Eq)

adicionaVacina:: String -> Day -> Day -> String -> Int -> Int -> String -> Int -> String -> String-> Vacina
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
todasAsVacinas (h:t) = "Nome: " ++ nome h ++ "Data de fabricação: " ++ show (dataFabricacao h) ++
        " " ++ "Data de validade: " ++ show (dataValidade h) ++ " " ++ "Laboratório: " ++ laboratorio h ++ " "
        ++ "Estoque: " ++ show (estoque h) ++ " Quantidade de doses necessarias: " ++ show (quantidadeDosesNecessarias h) ++ " " ++
        "Enfermidade: " ++ enfermidade h++ " "++ "Taxa de eficiência" ++ show (taxaEficiencia h) ++ 
        " "  ++ "Selo de aprovação: " ++ seloAprovacao h ++ "Pais de origem: "++ paisOrigem h ++ "\n" ++ todasAsVacinas t

pegaVacina :: String -> [Vacina] -> Maybe Vacina
pegaVacina _ [] = Nothing
pegaVacina nomeVacina (h:t)
    | nome h == nomeVacina = Just h
    | otherwise = pegaVacina nomeVacina t

vacinasPorLaboratorio :: String -> [Vacina] -> String
vacinasPorLaboratorio _ [] = ""
vacinasPorLaboratorio nomeLaboratorio (h:t)
    | laboratorio h == nomeLaboratorio = "Nome: " ++ nome h ++ "Data de fabricação: " ++ show (dataFabricacao h) ++
        " " ++ "Data de validade: " ++ show (dataValidade h) ++ " " ++ " "
        ++ "Estoque: " ++ show (estoque h) ++ " Quantidade de doses necessarias: " ++ show (quantidadeDosesNecessarias h) ++ " " ++
        "Enfermidade: " ++ enfermidade h++ " "++ "Taxa de eficiência" ++ show (taxaEficiencia h) ++ 
        " "  ++ "Selo de aprovação: " ++ seloAprovacao h ++ "Pais de origem: "++ paisOrigem h ++ "\n" ++ vacinasPorLaboratorio nomeLaboratorio t
    | otherwise = vacinasPorLaboratorio nomeLaboratorio t

vacinasPorEnfermidade :: String -> [Vacina] -> String
vacinasPorEnfermidade _ [] = ""
vacinasPorEnfermidade nomeEnfermidade (h:t)
    | laboratorio h == nomeEnfermidade = "Nome: " ++ nome h ++ "Data de fabricação: " ++ show (dataFabricacao h) ++
        " " ++ "Data de validade: " ++ show (dataValidade h) ++ " " ++ "Laboratório: " ++ laboratorio h ++ " "
        ++ "Estoque: " ++ show (estoque h) ++ " Quantidade de doses necessarias: " ++ show (quantidadeDosesNecessarias h) ++ " " ++ "Taxa de eficiência" ++ show (taxaEficiencia h) ++ 
        " "  ++ "Selo de aprovação: " ++ seloAprovacao h ++ "Pais de origem: "++ paisOrigem h ++ "\n" ++ vacinasPorEnfermidade nomeEnfermidade t
    | otherwise = vacinasPorEnfermidade nomeEnfermidade t

vacinasPorPaisDeOrigem :: String -> [Vacina] -> String
vacinasPorPaisDeOrigem _ [] = ""
vacinasPorPaisDeOrigem nomePaisDeOrigem (h:t)
    | laboratorio h == nomePaisDeOrigem = "Nome: " ++ nome h ++ "Data de fabricação: " ++ show (dataFabricacao h) ++
        " " ++ "Data de validade: " ++ show (dataValidade h) ++ " " ++ "Laboratório: " ++ laboratorio h ++ " "
        ++ "Estoque: " ++ show (estoque h) ++ " Quantidade de doses necessarias: " ++ show (quantidadeDosesNecessarias h) ++ " " ++
        "Enfermidade: " ++ enfermidade h++ " "++ "Taxa de eficiência" ++ show (taxaEficiencia h) ++ 
        " "  ++ "Selo de aprovação: " ++ seloAprovacao h ++ vacinasPorPaisDeOrigem nomePaisDeOrigem t
    | otherwise = vacinasPorPaisDeOrigem nomePaisDeOrigem t