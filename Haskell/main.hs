import System.IO
import System.Process
import qualified Auxiliar
import qualified Paciente 
import qualified Vacina 


main :: IO()
main = do
    Auxiliar.criaArquivos 
    system "clear"
    letreiro
    menuEntradas

menuPrincipal :: IO()
menuPrincipal = do
    putStrLn("Informe qual controle deseja acessar:\n\n" ++
            "1. Controle de Vacinas\n" ++
            "2. Controle de Pacientes\n" ++
            "3. Controle de Vacinações")

menuEntradas :: IO()
menuEntradas = do
    menuPrincipal

    input <- getLine
    if input == "1" then do
        listaVacinas <- carregaVacinas
        menuVacinasEntradas listaVacinas
    else if input == "2" then do
        listaPacientes <- carregaPacientes
        menuPacientesEntradas listaPacientes
    else if input == "3" then do
        menuVacinacoesEntradas
    else do
        putStrLn "Opção inválida."
        menuEntradas
   

menuVacinasEntradas :: [Vacina.Vacina ] -> IO()
menuVacinasEntradas listaVacinas = do
    listaVacinas <- carregaVacinas
   
    system "clear"

    putStrLn("Menu das Vacinas\n\n" ++
            "1. Cadastrar Vacina\n" ++ 
            "2. Listar vacinas em falta\n" ++
            "3. Listar vacinas em estoque\n" ++
            "4. Listar todas as vacinas do sistema\n" ++
            "5. Listar vacinas por atributo")
    entrada <- getLine 
    system "clear"
    if entrada == "1" then do 
        putStrLn "Cadastrando uma Vacina" 
        putStrLn "Insina o nome da vacina"
        nome <- getLine
        putStrLn "Insira a data de fabricação da vacina"
        dataFabricacao <- getLine
        putStrLn "Insira a data de validade da vacina"
        dataValidade <- getLine
        putStrLn "Insira o laboratorio que forneceu a vacina"
        laboratorio <- getLine 
        putStrLn "Insira a quantidade de vacinas fornecidas"
        estoque <- getLine
        putStrLn "Insira a quantidade de doses necessarias da vacina"
        quantidadeDosesNecessarias <- getLine 
        putStrLn "Insira a doença associada"
        enfermidade <- getLine 
        putStrLn "Insira a taxa de eficiência da vacina"
        taxaEficiencia <- getLine
        putStrLn "Insira o selo de aprovação da vacina"
        seloAprovacao <- getLine 
        putStrLn "Insira o pais de origem da vacina"
        paisOrigem <- getLine

        Auxiliar.escreverVacina(Vacina.adicionaVacina nome (read dataFabricacao) (read dataValidade) laboratorio (read estoque) (read quantidadeDosesNecessarias) enfermidade (read taxaEficiencia) seloAprovacao paisOrigem)

        menuPrincipal

    else if entrada == "2" then do
        return() -- LISTAR VACINAS EM FALTA

    else if entrada == "3" then do
        return() -- LISTAR VACINAS EM ESTOQUE

    else if entrada == "4" then do
        putStrLn (Vacina.todasAsVacinas listaVacinas)
        menuPrincipal

    else if entrada == "5" then do
        return() -- LISTAR VACINAS POR ATRIBUTO 1. lab, 2. enfermidade, 3. pais de origem

    else do
        putStrLn "Opção inválida"
        menuPrincipal
    system "clear"
    menuPrincipal
    return()

menuPacientesEntradas ::  [Paciente.Paciente ] -> IO()
menuPacientesEntradas listaPacientes = do

    putStrLn("Menu dos Pacientes\n\n" ++
            "1. Cadastrar paciente\n" ++
            "2. Atualizar paciente\n" ++
            "3. Listar pacientes")

    entrada <- getLine 
    system "clear"
    if entrada == "1" then do 
        putStrLn "Cadastrando um Paciente" 
        putStrLn "Insina o nome do paciente"
        nome <- getLine
        putStrLn "Insira o sexo do paciente"
        sexo <- getLine
        putStrLn "Insira o cpf do paciente"
        cpf <- getLine
        putStrLn "Insira o cep do paciente"
        cep <- getLine
        putStrLn "Insira o bairro do paciente"
        bairro <- getLine 
        putStrLn "Insira a rua do paciente"
        rua <- getLine
        putStrLn "Insira o numero da residência do paciente "
        num_residencia <- getLine 
        putStrLn "Insira a data de nascimento do paciente"
        dataNascimento <- getLine 
        putStrLn "Insira o telefone do paciente"
        telefone <- getLine

        Auxiliar.escreverPaciente(Paciente.adicionaPaciente nome (read sexo) (read cpf) (read cep) bairro rua (read num_residencia) dataNascimento telefone)

        menuPrincipal
    else do 
        putStrLn "Opção inválida"
        menuPrincipal
    system "clear"
    menuPrincipal

menuVacinacoes :: IO()
menuVacinacoes = do
    system "clear"
    putStrLn("Menu de Vacinações\n\n" ++
            "1. Agendar Vacinação\n" ++
            "2. Data(s) e faixa etária da atual/próxima vacinação\n" ++
            "3. Listar próximos pacientes a serem vacinados")
    return()

menuVacinacoesEntradas :: IO()
menuVacinacoesEntradas = do
    system "clear"
    menuVacinacoes
    entrada <- getLine

    if entrada == "1" then do
        menuAgendacaoVacinas

    else if entrada == "2" then do
        return() -- pegar data e faixa etaria da vacinacao mais proxima
    
    else if entrada == "3" then do
        return() -- listas proximos pacientes a serem vacinados

    else do
        putStrLn("Opção inválida")
        return()

    return()

menuAgendacaoVacinas :: IO()
menuAgendacaoVacinas = do
    system "clear"

    putStrLn("Agendando Vacinação")

    putStrLn("Insira a data da primeira dose:")
    dataPrimeiraDose <- getLine
    putStrLn("Insira a data da segunda dose (caso seja necessário):")
    dataSegundaDose <- getLine
    putStrLn("Insira o nome da vacina:")
    nomeVacina <- getLine
    putStrLn("Digite a faixa etária")
    putStrLn("Começa com a idade:")
    idadeUm <- getLine
    putStrLn("E (se necessário) vai até a idade:")
    idadeDois <- getLine

    return()


letreiro :: IO()
letreiro = do
    putStrLn("\n"++
        "                  Sistema de\n"++
        "                   Controle\n"++
        "       ___        de Vacinas\n"++
        "___    | |___________________________\n"++
        "| |____| |                           |___\n"++
        "| |____| |       |       |       |   |___|------------\n"++
        "|_|    | |___|___|___|___|___|___|___|\n"++
        "       |_|\n\n")

carregaVacinas:: IO[Vacina.Vacina ]
carregaVacinas = Auxiliar.iniciaVacina 

carregaPacientes:: IO[Paciente.Paciente  ]
carregaPacientes = Auxiliar.iniciaPaciente  