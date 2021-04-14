

data Paciente = Paciente {nome:: String, sexo:: Char, cpf::Int, cep:: Int, bairro:: String, 
rua::String, num_residencia:: Int, dataNascimento:: String, telefone::String} deriving(Show, Eq)

adicionaPaciente:: String -> Char -> Int -> Int -> String -> String -> Int -> String -> String -> Paciente
adicionaPaciente nome sexo cpf cep bairro rua num_residencia dataNascimento telefone = 
    (Paciente {nome = nome,
    sexo = sexo,
    cpf = cpf,
    cep = cep,
    bairro = bairro,
    rua = rua,
    num_residencia = num_residencia,
    dataNascimento = dataNascimento,
    telefone = telefone
    })
