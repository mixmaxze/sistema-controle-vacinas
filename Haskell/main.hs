import System.IO
import System.Process
import Data.Time

main :: IO()
main = do
    system "cls"
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
        putStrLn("Opção inválida.")
        menuEntradas

menuVacinas :: IO()
menuVacinas = do
    system "cls"
    putStrLn("Menu das Vacinas\n\n" ++
            "1. Cadastrar Vacina\n" ++ 
            "2. Listar vacinas em falta\n" ++
            "3. Listar vacinas em estoque\n" ++
            "4. Listar todas as vacinas do sistema\n" ++
            "5. Listar vacinas por atributo")

menuPacientes :: IO()
menuPacientes = do
    system "cls"
    putStrLn("Menu dos Pacientes\n\n" ++
            "1. Cadastrar paciente\n" ++
            "2. Atualizar paciente\n" ++
            "3. Listar pacientes")

menuVacinacoes :: IO()
menuVacinacoes = do
    system "cls"
    putStrLn("Menu de Vacinações\n\n" ++
            "1. Agendar Vacinação\n" ++
            "2. Data(s) e faixa etária da atual/próxima vacinação\n" ++
            "3. Listar próximos pacientes a serem vacinados")

menuVacinasEntradas :: IO()
menuVacinasEntradas = do
    system "cls"
    menuVacinas
    return()

menuPacientesEntradas :: IO()
menuPacientesEntradas = do
    system "cls"
    menuPacientes
    return()

menuVacinacoesEntradas :: IO()
menuVacinacoesEntradas = do
    system "cls"
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