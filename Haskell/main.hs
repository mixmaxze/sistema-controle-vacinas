import System.IO
import System.Process
import qualified Auxiliar
import qualified Paciente 
import qualified Vacina

main :: IO()
main = do
    Auxiliar.criaArquivos 
    system "clear"
    menuPrincipal

menuPrincipal :: IO()
menuPrincipal = do
    system "clear"
    letreiro
    putStrLn("Informe qual controle deseja acessar:\n\n" ++
            "1. Controle de Vacinas\n" ++
            "2. Controle de Pacientes\n" ++
            "3. Controle de Vacinações")
    input <- getLine

    if input == "1" then do 
        menuVacinasEntradas
    else if input == "2" then do
        menuPacientesEntradas
    else if input == "3" then do
        menuVacinacoesEntradas
    else do
        putStrLn "Opção inválida."
        menuPrincipal

menuVacinas :: [Vacina.Vacina ] -> IO()
menuVacinas listaVacinas = do
    system "clear"

    putStrLn("Menu das Vacinas\n\n" ++
            "1. Cadastrar Vacina\n" ++ 
            "2. Listar vacinas em falta\n" ++
            "3. Listar vacinas em estoque\n" ++
            "4. Listar todas as vacinas do sistema\n" ++
            "5. Listar vacinas por atributo")

menuVacinasEntradas :: IO()
menuVacinasEntradas = do
    listaVacinas <- carregaVacinas
    menuVacinas listaVacinas
    textoMenuAnterior
    entrada <- getLine
    system "clear"

    if entrada == "1" then do 
        putStrLn "Cadastrando uma vacina" 
        putStrLn "Insina o nome da vacina:"
        nome <- getLine
        putStrLn "Insira a data de fabricação da vacina:"
        dataFabricacao <- getLine
        putStrLn "Insira a data de validade da vacina:"
        dataValidade <- getLine
        putStrLn "Insira o laboratorio que forneceu a vacina:"
        laboratorio <- getLine 
        putStrLn "Insira a quantidade de vacinas fornecidas:"
        estoque <- getLine
        putStrLn "Insira a quantidade de doses necessarias da vacina:"
        quantidadeDosesNecessarias <- getLine 
        putStrLn "Insira a doença associada:"
        enfermidade <- getLine 
        putStrLn "Insira a taxa de eficiência da vacina:"
        taxaEficiencia <- getLine
        putStrLn "Insira o selo de aprovação da vacina:"
        seloAprovacao <- getLine 
        putStrLn "Insira o pais de origem da vacina:"
        paisOrigem <- getLine

        Auxiliar.escreverVacina(Vacina.adicionaVacina nome dataFabricacao dataValidade laboratorio (read estoque) (read quantidadeDosesNecessarias) enfermidade (read taxaEficiencia) seloAprovacao paisOrigem)
        putStrLn "Vacina cadastrada"

        retornoMenu
        menuVacinasEntradas

    else if entrada == "2" then do
        putStrLn "Vacinas em falta: \n"
        putStrLn (Vacina.vacinasEmFalta listaVacinas)
        retornoMenu
        menuVacinasEntradas
    
    else if entrada == "3" then do
        putStrLn "Vacinas disponiveis: \n"
        putStrLn (Vacina.vacinasEmEstoque listaVacinas)
        retornoMenu
        menuVacinasEntradas

    else if entrada == "4" then do
        putStrLn(Vacina.todasAsVacinas listaVacinas)
        retornoMenu
        menuVacinasEntradas

    else if entrada == "5" then do
        putStrLn("Listar por \n\n" ++
            "1. Enfermidade\n" ++ 
            "2. Laboratorio\n" ++
            "3. Pais de Origem\n")
        atributo <- getLine 
        system "clear"
        if atributo == "1" then do
            putStrLn ("Nome da enfermidade: \n")
            nomeEnfermidade <-getLine
            putStrLn(Vacina.vacinasPorEnfermidade nomeEnfermidade listaVacinas)
            retornoMenu
            menuVacinasEntradas
        else if atributo == "2" then do
            putStrLn ("Nome do laboratorio: \n")
            nomeLaboratorio <-getLine
            putStrLn(Vacina.vacinasPorLaboratorio nomeLaboratorio listaVacinas)
            retornoMenu
            menuVacinasEntradas
        else if atributo == "3" then do
            putStrLn ("Nome do pais de origem: \n")
            nomePais <- getLine 
            putStrLn (Vacina.vacinasPorPaisDeOrigem nomePais listaVacinas)
            retornoMenu
            menuVacinasEntradas
        else do 
            menuVacinasEntradas    
        retornoMenu
         -- LISTAR VACINAS POR ATRIBUTO 1. lab, 2. enfermidade, 3. pais de origem
        
    else do
        putStrLn "Opção inválida."
        menuPrincipal

menuPacientes :: [Paciente.Paciente ] -> IO()
menuPacientes listaPacientes = do
    system "clear"
    putStrLn("Menu dos Pacientes\n\n" ++
            "1. Cadastrar paciente\n" ++
            "2. Atualizar paciente\n" ++
            "3. Listar pacientes")

menuPacientesEntradas :: IO()
menuPacientesEntradas = do
    listaPacientes <- carregaPacientes
    menuPacientes listaPacientes
    textoMenuAnterior
    entrada <- getLine 
    system "clear"
    if entrada == "1" then do 
        putStrLn "Cadastrando um Paciente\n" 
        putStrLn "Insina o nome do paciente:"
        nome <- getLine
        putStrLn "Insira o sexo do paciente:"
        sexo <- getLine
        putStrLn "Insira o CPF do paciente"
        cpf <- getLine
        putStrLn "Insira o CEP do paciente:"
        cep <- getLine
        putStrLn "Insira o bairro do paciente"
        bairro <- getLine 
        putStrLn "Insira a rua do paciente:"
        rua <- getLine
        putStrLn "Insira o numero da residência do paciente "
        num_residencia <- getLine 
        putStrLn "Insira a data de nascimento do paciente:"
        dataNascimento <- getLine
        putStrLn "Insira o telefone do paciente:"
        telefone <- getLine

        Auxiliar.escreverPaciente(Paciente.adicionaPaciente nome (read sexo) (read cpf) (read cep) bairro rua (read num_residencia) dataNascimento telefone)
        putStrLn "Paciente cadastrado"
        menuPacientesEntradas

    else if entrada == "2" then do
        --atualizar paciente
        retornoMenu
        menuPacientesEntradas
    
    else if entrada == "3" then do
        putStrLn (Paciente.todosOsPacientes listaPacientes)
        retornoMenu
        menuPacientesEntradas

    else do 
        putStrLn "Opção inválida."
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
    menuVacinacoes
    textoMenuAnterior
    entrada <- getLine
    system "clear"

    if entrada == "1" then do
        menuAgendacaoVacinas
    else if entrada == "2" then do
        retornoMenu
        menuVacinacoesEntradas -- pegar data e faixa etaria da vacinacao mais proxima
    else if entrada == "3" then do
        retornoMenu
        menuVacinacoesEntradas -- listas proximos pacientes a serem vacinados
    else do
        putStrLn("Opção inválida.")
        menuPrincipal

menuAgendacaoVacinas :: IO()
menuAgendacaoVacinas = do
    system "clear"

    putStrLn("Agendando Vacinação\n\n")

    putStrLn("Insira a data da primeira dose:")
    dataPrimeiraDose <- getLine
    putStrLn("Insira a data da segunda dose (caso seja necessário):")
    dataSegundaDose <- getLine
    putStrLn("Insira o nome da vacina:")
    nomeVacina <- getLine
    putStrLn("\nInforme a faixa etária")
    putStrLn("Começa com a idade:")
    idadeUm <- getLine
    putStrLn("E (se necessário) vai até a idade:")
    idadeDois <- getLine

    retornoMenu
    menuVacinacoesEntradas

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

retornoMenu :: IO()
retornoMenu = do
    textoMenuAnterior
    getLine
    system "clear"
    return ()

textoMenuAnterior :: IO()
textoMenuAnterior = putStrLn("\n\nOu pressione ENTER para acessar o menu anterior.")
