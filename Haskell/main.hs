import System.IO (hGetLine)
import System.Process
import qualified Vacina
import qualified Paciente
import qualified Vacinacao
import qualified Auxiliar

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
            "3. Controle de Vacinações\n" ++ 
            "0. Sair do Programa")
    input <- getLine

    if input == "1" then
        menuVacinasEntradas
    else if input == "2" then
        menuPacientesEntradas
    else if input == "3" then
        menuVacinacoesEntradas
    else if input == "0" then
        return ()
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
            "5. Listar vacinas por atributo\n" ++
            "6. Doses disponiveis para aplicação\n" ++ 
            "0. Sair do Programa")


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
        putStrLn "Vacinas cadastradas: \n"
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
            putStrLn "Nome da enfermidade: \n"
            nomeEnfermidade <-getLine
            putStrLn(Vacina.vacinasPorEnfermidade nomeEnfermidade listaVacinas)
            retornoMenu
            menuVacinasEntradas
        else if atributo == "2" then do
            putStrLn "Nome do laboratorio: \n"
            nomeLaboratorio <-getLine
            putStrLn(Vacina.vacinasPorLaboratorio nomeLaboratorio listaVacinas)
            retornoMenu
            menuVacinasEntradas
        else if atributo == "3" then do
            putStrLn "Nome do pais de origem: \n"
            nomePais <- getLine
            putStrLn (Vacina.vacinasPorPaisDeOrigem nomePais listaVacinas)
            retornoMenu
            menuVacinasEntradas
        else
            menuVacinasEntradas
        retornoMenu

    else if entrada == "6" then do
        putStrLn "Nome da Vacina: \n"
        nomeVacina <- getLine
        system "clear"
        putStrLn "Quantidade de doses disponiveis para aplicação: "
        print (show (div (Vacina.pegaEstoque nomeVacina listaVacinas) (Vacina.pegaquantidadeDosesNecessarias nomeVacina listaVacinas)))
        retornoMenu
        menuVacinasEntradas
    
    else if entrada == "0" then do
        return ()
    
    else do
        putStrLn "Opção inválida."
        menuPrincipal

menuPacientes :: [Paciente.Paciente ] -> IO()
menuPacientes listaPacientes = do
    system "clear"
    putStrLn("Menu dos Pacientes\n\n" ++
            "1. Cadastrar paciente\n" ++
            "2. Atualizar paciente\n" ++
            "3. Listar pacientes\n" ++
            "4. Ver situação\n" ++
            "0. Sair do Programa")

menuPacientesEntradas :: IO()
menuPacientesEntradas = do
    listaPacientes <- carregaPacientes
    listaVacinacao <- carregaVacinacao
    listaVacinas <- carregaVacinas
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
        putStrLn "Insira o endereco do paciente:"
        endereco <- getLine
        putStrLn "Insira a idade do paciente:"
        idade <- getLine
        putStrLn "Insira o telefone do paciente:"
        telefone <- getLine

        Auxiliar.escreverPaciente(Paciente.adicionaPaciente nome sexo cpf  endereco (read idade) telefone)
        putStrLn "Paciente cadastrado"
        menuPacientesEntradas

    else if entrada == "2" then do
        --atualizar paciente
        retornoMenu
        menuPacientesEntradas

    else if entrada == "3" then do
        putStrLn "Pacientes cadastrados: \n"
        putStrLn (Paciente.todosOsPacientes listaPacientes)
        retornoMenu
        menuPacientesEntradas
    else if entrada == "4" then do

        putStrLn "Cpf do paciente desejado:\n"
        cpfPaciente <- getLine
        let aux = Paciente.pegaIdadePaciente cpfPaciente listaPacientes
        
        if aux == 0 then do

            putStrLn "Não existe um Paciente com esse cpf cadastrado"
            retornoMenu
            menuPacientesEntradas
        
        else do

            putStrLn "Situação paciente: \n"
            putStrLn(Vacinacao.checaSituacao aux listaVacinacao)
        
    
        retornoMenu
        menuPacientesEntradas
    

    else if entrada == "0" then do
        return ()

    else do
        putStrLn "Opção inválida."
        menuPrincipal

menuVacinacoes :: IO()
menuVacinacoes = do
    system "clear"
    putStrLn("Menu de Vacinações\n\n" ++
            "1. Agendar Vacinação\n" ++
            "2. Listar pacientes a serem vacinados por uma determinada vacina\n" ++ 
            "3. Calcular projeção de conclusão de uma vacinação\n" ++ 
            "0. Sair do Programa\n")
    return()

menuVacinacoesEntradas :: IO()
menuVacinacoesEntradas = do
    listaPacientes <- carregaPacientes
    listaVacinacoes <- carregaVacinacao
    menuVacinacoes
    textoMenuAnterior
    entrada <- getLine
    system "clear"

    if entrada == "1" then
        menuAgendacaoVacinas
    else if (entrada == "2") then do
        putStrLn "Nome da vacina:\n"
        nomeVacina <- getLine 
        let faixaEtaria = Vacinacao.pegaFaixaEtatariaVacinacao nomeVacina listaVacinacoes 
        putStrLn (Paciente.pegaPacientesHabilitados faixaEtaria listaPacientes)

        retornoMenu
        menuVacinacoesEntradas 
    else if entrada == "3" then do
        putStrLn "Média de vacinação diária:\n"
        mediaVacinacaoDiaria <- getLine
        let num_pacientes = Paciente.contaPaciente listaPacientes
        let dias_Projecao = Vacinacao.calculaProjecaoVacinacao (read mediaVacinacaoDiaria) (num_pacientes)
        putStrLn (show (dias_Projecao) ++ " Dia(s).")
        retornoMenu
        menuVacinacoesEntradas
   
    else if entrada == "0" then do 
        return ()
   
    else do
        putStrLn("Opção inválida.")
        menuPrincipal

menuAgendacaoVacinas :: IO()
menuAgendacaoVacinas = do
    listaVacinacoes <- Auxiliar.iniciaVacinacao
    system "clear"

    putStrLn"Agendando Vacinação\n\n"
    putStrLn"Insira o nome da vacina:"
    nomeVacina <- getLine
    putStrLn"Insira o local:"
    local <- getLine
    putStrLn"Insira a data da primeira dose:"
    dataPrimeiraDose <- getLine
    putStrLn"Insira a data da segunda dose (caso necessário):"
    dataSegundaDose <- getLine
    putStrLn"Insira o horário de início (horas:minutos):"
    horarioInicio <- getLine
    putStrLn"Insira o horário de término (horas:minutos:"
    horarioFim <- getLine
    putStrLn"\nInforme a faixa etária:"
    idadeMinima <- getLine

    Auxiliar.escreverVacinacao(Vacinacao.adicionaVacinacao nomeVacina local dataPrimeiraDose dataSegundaDose horarioInicio horarioFim (read idadeMinima))
    putStrLn"Vacinação agendada."

    retornoMenu
    menuVacinacoesEntradas

letreiro :: IO()
letreiro =
    putStrLn("\n"++
    "                  Sistema de\n"++
    "                   Controle\n"++
    "       ___        de Vacinas\n"++
    "___    | |___________________________\n"++
    "| |____| |                           |___\n"++
    "| |____| |       |       |       |   |___|------------\n"++
    "|_|    | |___|___|___|___|___|___|___|\n"++
    "       |_|\n\n")

carregaVacinas:: IO[Vacina.Vacina]
carregaVacinas = Auxiliar.iniciaVacina

carregaPacientes:: IO[Paciente.Paciente]
carregaPacientes = Auxiliar.iniciaPaciente

carregaVacinacao :: IO[Vacinacao.Vacinacao ]
carregaVacinacao = Auxiliar.iniciaVacinacao 

retornoMenu :: IO()
retornoMenu = do
    textoMenuAnterior
    getLine
    system "clear"
    return ()

textoMenuAnterior :: IO()
textoMenuAnterior = putStrLn"\nPressione ENTER para acessar o menu anterior."
