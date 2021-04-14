data Vacina = Vacina {nome:: String, dataFabricacao:: String, dataValidade::String, laboratorio:: String, estoque:: Int, 
quantidadeDosesNecessarias::Int, enfermidade:: String, taxaEficiencia:: Int, seloAprovacao::String, paisOrigem:: String} deriving(Show, Eq)

adicionaPaciente:: String -> String -> String -> String -> Int -> Int -> String -> Int -> String -> String-> Vacina
adicionaPaciente nome dataFabricacao dataValidade laboratorio estoque quantidadeDosesNecessarias enfermidade taxaEficiencia seloAprovacao paisOrigem = 
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