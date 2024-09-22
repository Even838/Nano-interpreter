local commands = {}
local variables = {}

-- Função para criar um arquivo HTML
function criarArquivoHTML()
    local file = io.open("index.html", "w")
    file:write("<!DOCTYPE html>\n<html>\n<head>\n<title>Página HTML</title>\n</head>\n<body>\n<p>Seu arquivo HTML foi criado.</p>\n</body>\n</html>")
    file:close()
    print("Arquivo HTML criado com sucesso!")
end

function ramo()
    local n = math.random(1, 230)
    print(n)
end

function ane()
    local data_hora_atual = os.date("*t")
    print(data_hora_atual.year)
end

function date()
    local data_hora_atual = os.date("*t")
    print("Dia: " .. data_hora_atual.day)
    print("Mês: " .. data_hora_atual.month)
    print("Ano: " .. data_hora_atual.year)
    print("Hora: " .. data_hora_atual.hour)
    print("Minuto: " .. data_hora_atual.min)
    print("Segundo: " .. data_hora_atual.sec)
end

function criarArquivoCSS()
    local file = io.open("index.css", "w")
    file:write("")
    file:close()
    print("Arquivo CSS criado com sucesso!")
end

function azul()
    local file = io.open("index.css", "w")
    file:write("body { background-color: blue; }")
    file:close()
    print("Cor do fundo alterada para Azul")
end

function verde()
    local file = io.open("index.css", "w")
    file:write("body { background-color: green; }")
    file:close()
    print("Cor do fundo alterada para Verde")
end

function preto()
    local file = io.open("index.css", "w")
    file:write("body { background-color: black; }")
    file:close()
    print("Cor do fundo alterada para Preto")
end

function definirVariavel(input)
    local nome, valor = input:match("var%s+(%w+)%s*=%s*(.+)")
    if nome and valor then
        variables[nome] = valor
        
    else
        print("Erro: Formato inválido. Use 'var nome=valor'.")
    end
end

function mostrarVariavel(input)
    local nome = input:match("tex%((%w+)%)")
    if nome and variables[nome] then
        print(variables[nome])
    else
        print("Erro: Variável não encontrada ou formato inválido.")
    end
end

function executarFor(input)
    local repeticoes, codigo = input:match("for%s*%((%d+)%)%s*{(.+)}")
    if repeticoes and codigo then
        repeticoes = tonumber(repeticoes)
        for i = 1, repeticoes do
            -- Remove espaços desnecessários e imprime o código a ser repetido
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

-- Loop para verificar a entrada do usuário e armazenar os comandos
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
        table.insert(commands, input)
        -- Adicionando comandos já existentes
        if input == "/*" then
            criarArquivoHTML()
        elseif input == "//" then
            criarArquivoCSS()
        elseif input == "color f = azul" then
            azul()
        elseif input == "color f = verde" then
            verde()
        elseif input == "color f = preto" then
            preto()
        elseif input == "new date = ano" then
            ane()
        elseif input == "new date = date" then
            date()
        elseif input == "radow()" then
            ramo()
        end
    end
end
