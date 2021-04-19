import System.IO
import System.Process
import qualified Auxiliar
import qualified Paciente 
import qualified Vacina 


main :: IO()
main = do
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
        menuVacinasEntradas
    else if input == "2" then do
        menuPacientesEntradas
    else if input == "3" then do
        menuVacinacoesEntradas
    else do
        putStrLn "Opção inválida."
        menuEntradas

menuVacinas :: [Vacina.Vacina ] -> IO()
menuVacinas listaVacinas= do
    system "clear"
    putStrLn("Menu das Vacinas\n\n" ++
            "1. Cadastrar Vacina\n" ++ 
            "2. Listar vacinas em falta\n" ++
            "3. Listar vacinas em estoque\n" ++
            "4. Listar todas as vacinas do sistema\n" ++
            "5. Listar vacinas por atributo")
    



menuPacientes :: [Paciente.Paciente ] -> IO()
menuPacientes listaPacientes = do
    system "clear"
    putStrLn("Menu dos Pacientes\n\n" ++
            "1. Cadastrar paciente\n" ++
            "2. Atualizar paciente\n" ++
            "3. Listar pacientes")
   

menuVacinacoes :: IO()
menuVacinacoes = do
    system "clear"
    putStrLn("Menu de Vacinações\n\n" ++
            "1. Agendar Vacinação\n" ++
            "2. Data(s) e faixa etária da atual/próxima vacinação\n" ++
            "3. Listar próximos pacientes a serem vacinados")

menuVacinasEntradas :: IO()
menuVacinasEntradas = do
    menuVacinas
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

        Auxiliar.escreverVacina(Vacina.adicionaVacina nome dataFabricacao dataValidade laboratorio (read estoque) (read quantidadeDosesNecessarias) enfermidade (read taxaEficiencia) seloAprovacao paisOrigem)

        menuPrincipal
    else if entrada == "4" then do
        putStrLn (Vacina.todasAsVacinas listaVacinas)
        menuPrincipal
    else do 
        putStrLn "Opção inválida"
        menuPrincipal
    system "clear"
    menuPrincipal
    return()

menuPacientesEntradas :: IO()
menuPacientesEntradas = do
    menuPacientes
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
    return()

menuVacinacoesEntradas :: IO()
menuVacinacoesEntradas = do
    system "clear"
    menuVacinacoes
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