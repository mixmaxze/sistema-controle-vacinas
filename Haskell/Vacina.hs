module Vacina where
    
import Data.List

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
todasAsVacinas (h:t) = "Nome: " ++ nome h ++ ", Data de fabricação: " ++ dataFabricacao h ++
        ", Data de validade: " ++ dataValidade h ++ ", Laboratório: " ++ laboratorio h ++ 
        ", Estoque: " ++ show (estoque h) ++ ", Quantidade de doses necessarias: " ++ show (quantidadeDosesNecessarias h) ++ 
        ", Enfermidade: " ++ enfermidade h ++ ", Taxa de eficiência" ++ show (taxaEficiencia h) ++ 
        ", Selo de aprovação: " ++ seloAprovacao h ++ "\n" ++ todasAsVacinas t

pegaVacina :: String -> [Vacina] -> Maybe Vacina
pegaVacina _ [] = Nothing
pegaVacina nomeVacina (h:t)
    | nome h == nomeVacina = Just h
    | otherwise = pegaVacina nomeVacina t

pegaEstoque:: String -> [Vacina] -> Int
pegaEstoque _ [] = 0 
pegaEstoque nomeVacina (h:t)
    | nome h == nomeVacina = estoque h  
    | otherwise  = pegaEstoque nomeVacina t 

pegaquantidadeDosesNecessarias:: String -> [Vacina] -> Int
pegaquantidadeDosesNecessarias _ [] = 0 
pegaquantidadeDosesNecessarias nomeVacina (h:t)
    | nome h == nomeVacina = quantidadeDosesNecessarias h  
    | otherwise  = pegaquantidadeDosesNecessarias nomeVacina t 



vacinasPorLaboratorio :: String -> [Vacina] -> String
vacinasPorLaboratorio _ [] = ""
vacinasPorLaboratorio nomeLaboratorio (h:t)
    | laboratorio h == nomeLaboratorio = "Nome: " ++ nome h ++ ", Data de fabricação: " ++ show (dataFabricacao h) ++
        ", Data de validade: " ++ show (dataValidade h) ++ ", Estoque: " ++ show (estoque h) ++ ", Quantidade de doses necessarias: " ++ show (quantidadeDosesNecessarias h) ++ ", Enfermidade: " ++ enfermidade h++ " "++ "Taxa de eficiência" ++ show (taxaEficiencia h) ++ 
        ", Selo de aprovação: " ++ seloAprovacao h ++ ", Pais de origem: "++ paisOrigem h ++ "\n" ++ vacinasPorLaboratorio nomeLaboratorio t ++ "\n\n"
    | otherwise = vacinasPorLaboratorio nomeLaboratorio t

vacinasPorEnfermidade :: String -> [Vacina] -> String
vacinasPorEnfermidade _ [] = ""
vacinasPorEnfermidade nomeEnfermidade (h:t)
    | enfermidade h == show nomeEnfermidade = "Nome: " ++ nome h ++ ", Data de fabricação: " ++ show (dataFabricacao h) ++
        ", Data de validade: " ++ show (dataValidade h) ++ ", Laboratório: " ++ laboratorio h ++ ", Estoque: " ++ show (estoque h) ++ ", Quantidade de doses necessarias: " ++ show (quantidadeDosesNecessarias h) ++ " " ++ "Taxa de eficiência" ++ show (taxaEficiencia h) ++ 
        " "  ++ "Selo de aprovação: " ++ seloAprovacao h ++ ", Pais de origem: " ++ paisOrigem h ++ "\n" ++ vacinasPorEnfermidade nomeEnfermidade t ++ "\n\n"
    | otherwise = vacinasPorEnfermidade nomeEnfermidade t

vacinasPorPaisDeOrigem :: String -> [Vacina] -> String
vacinasPorPaisDeOrigem _ [] = ""
vacinasPorPaisDeOrigem nomePaisDeOrigem (h:t)
    | paisOrigem h == nomePaisDeOrigem = "Nome: " ++ nome h ++ "Data de fabricação: " ++ show (dataFabricacao h) ++
        " " ++ "Data de validade: " ++ show (dataValidade h) ++ " " ++ "Laboratório: " ++ laboratorio h ++ " "
        ++ "Estoque: " ++ show (estoque h) ++ " Quantidade de doses necessarias: " ++ show (quantidadeDosesNecessarias h) ++ " " ++
        "Enfermidade: " ++ enfermidade h++ " "++ "Taxa de eficiência" ++ show (taxaEficiencia h) ++ 
        " "  ++ "Selo de aprovação: " ++ seloAprovacao h ++ "\n" ++ vacinasPorPaisDeOrigem nomePaisDeOrigem t ++ "\n\n"
    | otherwise = vacinasPorPaisDeOrigem nomePaisDeOrigem t

vacinasEmFalta:: [Vacina] -> String
vacinasEmFalta [] = ""
vacinasEmFalta (h:t)
    | estoque h == 0 = "Nome: " ++ nome h ++
        ", " ++ "Estoque: " ++ show (estoque h) ++ 
        ", " ++  "Laboratório: " ++ laboratorio h ++ 
        ", " ++ "Enfermidade: " ++ enfermidade h ++ " " ++ 
        "\n" ++ vacinasEmFalta t
    | otherwise =  vacinasEmFalta t

vacinasEmEstoque:: [Vacina] -> String
vacinasEmEstoque [] = ""
vacinasEmEstoque (h:t)
    | estoque h /= 0 = "Nome: " ++ nome h ++
        ", " ++ "Data de validade: " ++ show (dataValidade h) ++
        ", " ++ "Estoque: " ++ show (estoque h) ++ 
        ", " ++ "Laboratório: " ++ laboratorio h ++ 
        ", " ++ "Enfermidade: " ++ enfermidade h++ " " ++ 
        "\n" ++ vacinasEmEstoque t
    | otherwise =  vacinasEmEstoque t 

atualizaDataFabricacao:: String -> [Vacina] -> String -> [Vacina]
atualizaDataFabricacao nomeVacina [] novoValor = []
atualizaDataFabricacao nomeVacina (h:t) novoValor 
    | nomeVacina == nome h = ((Vacina(nome h) (novoValor) (dataValidade h) (laboratorio h) (estoque h) (quantidadeDosesNecessarias h) (enfermidade h) (taxaEficiencia h) (seloAprovacao h) (paisOrigem h)) : t)
    | otherwise =  (h: atualizaDataFabricacao nomeVacina t novoValor)

atualizaDataValidade:: String -> [Vacina] -> String -> [Vacina]
atualizaDataValidade nomeVacina [] novoValor = []
atualizaDataValidade nomeVacina (h:t) novoValor 
    | nomeVacina == nome h = ((Vacina(nome h) (dataFabricacao h) (novoValor) (laboratorio h) (estoque h) (quantidadeDosesNecessarias h) (enfermidade h) (taxaEficiencia h) (seloAprovacao h) (paisOrigem h)) : t)
    | otherwise =  (h: atualizaDataValidade nomeVacina t novoValor)

atualizarLaboratorio:: String -> [Vacina] -> String -> [Vacina]
atualizarLaboratorio nomeVacina [] novoValor = []
atualizarLaboratorio nomeVacina (h:t) novoValor 
    | nomeVacina == nome h = ((Vacina(nome h) (dataFabricacao h) (dataValidade h) (novoValor) (estoque h) (quantidadeDosesNecessarias h) (enfermidade h) (taxaEficiencia h) (seloAprovacao h) (paisOrigem h)) : t)
    | otherwise =  (h: atualizarLaboratorio nomeVacina t novoValor)

atualizaEstoque:: String -> [Vacina] -> Int -> [Vacina]
atualizaEstoque nomeVacina [] novoValor = []
atualizaEstoque nomeVacina (h:t) novoValor 
    | nomeVacina == nome h = ((Vacina(nome h) (dataFabricacao h) (dataValidade h) (laboratorio h) (novoValor) (quantidadeDosesNecessarias h) (enfermidade h) (taxaEficiencia h) (seloAprovacao h) (paisOrigem h)) : t)
    | otherwise =  (h: atualizaEstoque nomeVacina t novoValor)

atualizaDosesNecessarias:: String -> [Vacina] -> Int -> [Vacina]
atualizaDosesNecessarias nomeVacina [] novoValor = []
atualizaDosesNecessarias nomeVacina (h:t) novoValor 
    | nomeVacina == nome h = ((Vacina(nome h) (dataFabricacao h) (dataValidade h) (laboratorio h) (estoque h) (novoValor) (enfermidade h) (taxaEficiencia h) (seloAprovacao h) (paisOrigem h)) : t)
    | otherwise =  (h: atualizaDosesNecessarias nomeVacina t novoValor)

atualizaEnfermidade:: String -> [Vacina] -> String -> [Vacina]
atualizaEnfermidade nomeVacina [] novoValor = []
atualizaEnfermidade nomeVacina (h:t) novoValor 
    | nomeVacina == nome h = ((Vacina(nome h) (dataFabricacao h) (dataValidade h) (laboratorio h) (estoque h) (quantidadeDosesNecessarias h) (show (novoValor)) (taxaEficiencia h) (seloAprovacao h) (paisOrigem h)) : t)
    | otherwise =  (h: atualizaEnfermidade nomeVacina t novoValor)

atualizaTaxaEficiencia:: String -> [Vacina] -> Int -> [Vacina]
atualizaTaxaEficiencia nomeVacina [] novoValor = []
atualizaTaxaEficiencia nomeVacina (h:t) novoValor 
    | nomeVacina == nome h = ((Vacina(nome h) (dataFabricacao h) (dataValidade h) (laboratorio h) (estoque h) (quantidadeDosesNecessarias h) (enfermidade h) (novoValor) (seloAprovacao h) (paisOrigem h)) : t)
    | otherwise =  (h: atualizaTaxaEficiencia nomeVacina t novoValor)

atualizaSeloAprovacao:: String -> [Vacina] -> String -> [Vacina]
atualizaSeloAprovacao nomeVacina [] novoValor = []
atualizaSeloAprovacao nomeVacina (h:t) novoValor 
    | nomeVacina == nome h = ((Vacina(nome h) (dataFabricacao h) (dataValidade h) (laboratorio h) (estoque h) (quantidadeDosesNecessarias h) (enfermidade h) (taxaEficiencia h) (novoValor) (paisOrigem h)) : t)
    | otherwise =  (h: atualizaSeloAprovacao nomeVacina t novoValor)

atualizaPaisOrigem:: String -> [Vacina] -> String -> [Vacina]
atualizaPaisOrigem nomeVacina [] novoValor = []
atualizaPaisOrigem nomeVacina (h:t) novoValor 
    | nomeVacina == nome h = ((Vacina(nome h) (dataFabricacao h) (dataValidade h) (laboratorio h) (estoque h) (quantidadeDosesNecessarias h) (enfermidade h) (taxaEficiencia h) (seloAprovacao h) (novoValor)) : t)
    | otherwise =  (h: atualizaPaisOrigem nomeVacina t novoValor)