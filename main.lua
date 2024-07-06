local commands = {}

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

-- Função para alterar a cor de fundo para azul
function azul()
    local file = io.open("index.css", "w") 
    file:write("body { background-color: blue; }") 
    file:close()
    print("Cor do fundo alterada para Azul")
end

-- Função para mudar a cor do fundo para verde
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
    print("Cor do fundo alterada para preto") 
end
  


-- Loop para verificar a entrada do usuário e armazenar os comandos
while true do
    local input = io.read()
    if input == "sair" then
        print("Saindo do programa.")
        break
    elseif input == "#" then
        for _, command in ipairs(commands) do
            if command == "/*" then
                criarArquivoHTML()
            elseif command == "//" then
                criarArquivoCSS()
            elseif command == "color f = azul" then
                azul()
            elseif command == "color f = verde" then
                verde()
              elseif command == "color f = preto" then
                preto()
            elseif command == "text" then
              print(" erro not is 'text' is Tex ")
                
            elseif string.sub(command, 1, 4) == "tex(" or "TEX("then
                local texto = string.match(command, "%((.+)%)")
                if texto then
                    print(texto) -- Exibe o texto entre parênteses
                end
            end
        end
    else
        table.insert(commands, input) 
    end
end
