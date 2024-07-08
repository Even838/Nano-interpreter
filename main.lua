
local commands = {}

-- Função para criar um arquivo HTML
function criarArquivoHTML()
    local file = io.open("index.html", "w")
    file:write("<!DOCTYPE html>\n<html>\n<head>\n<title>Página HTML</title>\n</head>\n<body>\n<p>Seu arquivo HTML foi criado.</p>\n</body>\n</html>")
    file:close()
    print("Arquivo HTML criado com sucesso!")
end

function ramo(n)
  n = math.random(1, 230)
  print(n)
end

function n()
  inn = tonumber(io.read())
  
  
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

function dia()
   local data_hora_atual = os.date("*t")
   print("Dia: " .. data_hora_atual.day)
   
end

function mes()
   local data_hora_atual = os.date("*t")
   print("Mês: " .. data_hora_atual.month)
   
end

function hora()
  local data_hora_atual = os.date("*t")
  print("Hora: ".. data_hora_atual.hour)
end

function minuto()
  local data_hora_atual = os.date("*t")
  print("Minuto: " .. data_hora_atual.min)
end

function segundo()
  
  local data_hora_atual = os.date("*t")
  print("Segundo: " .. data_hora_atual.sec)
end

function inp()
  local inpu = io.read()
end
  function tex_inp(inpu)
    print(inpu)
  end
 

function inp_nun()
  local inp = tonumber(io.read())
  
  
end

function criarArquivoCSS()
    local file = io.open("index.css", "w")
    file:write("")
    file:close()
    print("Arquivo CSS criado com sucesso!")
end

-- Função para alterar a cor de fundo para azul
function azul()
    local file = io.open("index.css", "w")file:write("body { background-color: blue; }") 
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



function n()
  print("ㅤ")
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
              elseif command == "new date = ano" then
                ane()
                elseif command == "new date = hora" then
                hora()
                elseif command == "new date = dia" then
                  dia()
                elseif command == "new date = mês" then
                  mes()
                elseif command == "new date = minuto" then
                minuto()
                 elseif command == "new date = date" then
                date() 
              elseif command == "/n" then
                n()
             elseif command == "radow()" then
                ramo()
             elseif command  == "create_input(n)" then
               n()
              elseif command == "new date = segundos" then
                segundo() 
            elseif command == "text" then
              print(" erro not is 'text' is Tex ")
            elseif command == "create_input" then
              inp()
              
              
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
