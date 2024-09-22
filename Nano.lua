local commands = {}
local variables = {}

-- Função para criar um arquivo HTML
function criarArquivoHTML()
    local file = io.open("index.html", "w")
    file:write("<!DOCTYPE html>\n<html>\n<head>\n<title>Página HTML</title>\n</head>\n<body>\n<p>Seu arquivo HTML foi criado.</p>\n</body>\n</html>")
    file:close()
    print("Arquivo HTML criado com sucesso!")
end

-- Função para criar um arquivo CSS
function criarArquivoCSS()
    local file = io.open("index.css", "w")
    file:write("")
    file:close()
    print("Arquivo CSS criado com sucesso!")
end

-- Funções para alterar a cor de fundo
local function mudarCor(cor)
    local file = io.open("index.css", "w")
    file:write("body { background-color: " .. cor .. "; }")
    file:close()
    print("Cor do fundo alterada para " .. cor)
end

-- Funções auxiliares
local function ramo()
    print(math.random(1, 230))
end

local function ane()
    print(os.date("*t").year)
end

local function date()
    local data_hora_atual = os.date("*t")
    print(string.format("Dia: %d\nMês: %d\nAno: %d\nHora: %d\nMinuto: %d\nSegundo: %d", 
                        data_hora_atual.day, data_hora_atual.month, data_hora_atual.year, 
                        data_hora_atual.hour, data_hora_atual.min, data_hora_atual.sec))
end

-- Funções de manipulação de variáveis
local function definirVariavel(input)
    local nome, valor = input:match("var%s+(%w+)%s*=%s*(.+)")
    if nome and valor then
        variables[nome] = valor
    else
        print("Erro: Formato inválido. Use 'var nome=valor'.")
    end
end

local function mostrarVariavel(input)
    local nome = input:match("tex%((%w+)%)")
    if nome and variables[nome] then
        print(variables[nome])
    else
        print("Erro: Variável não encontrada ou formato inválido.")
    end
end

local function executarFor(input)
    local repeticoes, codigo = input:match("for%s*%((%d+)%)%s*{(.+)}")
    if repeticoes and codigo then
        repeticoes = tonumber(repeticoes)
        for i = 1, repeticoes do
            local comando = codigo:gsub("%s+", "")
            if comando:match("tex%((%w+)%)") then
                mostrarVariavel(comando)
            else
                print("Comando desconhecido: " .. comando)
            end
        end
    else
        print("Erro: Formato inválido. Use 'for(número) { código }'.")
    end
end

-- Mapeamento de comandos
local comandosMapeados = {
    ["/*"] = criarArquivoHTML,
    ["//"] = criarArquivoCSS,
    ["color f = azul"] = function() mudarCor("blue") end,
    ["color f = verde"] = function() mudarCor("green") end,
    ["color f = preto"] = function() mudarCor("black") end,
    ["new date = ano"] = ane,
    ["new date = date"] = date,
    ["radow()"] = ramo,
}

-- Loop principal
while true do
    local input = io.read()
    if input == "sair" then
        print("Saindo do programa.")
        break
    elseif input:sub(1, 3) == "var" then
        definirVariavel(input)
    elseif input:sub(1, 3) == "tex" then
        mostrarVariavel(input)
    elseif input:sub(1, 3) == "for" then
        executarFor(input)
    else
        local comandoFuncao = comandosMapeados[input]
        if comandoFuncao then
            comandoFuncao()
        else
            print("Comando desconhecido: " .. input)
        end
    end
end
