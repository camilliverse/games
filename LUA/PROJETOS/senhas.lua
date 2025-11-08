
--GERADOR DE SENHAS ALEATÓRIAS--    

math.randomseed(os.time()) -- Inicializa a semente para aleatoriedade baseada no tempo atual
function Gerarsenha(tamanho) -- Função para gerar uma senha aleatória
    local caracteristicas = { ---- Tabela com todos os caracteres possíveis
        maiusculas = "ABCDEFGHIJKLMNOPQRSTUVWXYZ", 
        minusculas = "abcdefghijklmnopqrstuvwxyz",
        numeros = "0123456789",
        simbolos = "!@#$%^&*()-_=+[]{};:,.<>/?"
    }
    local todosCaracteres = caracteristicas.maiusculas .. caracteristicas.minusculas .. caracteristicas.numeros .. caracteristicas.simbolos --Aqui ele está juntando todas as categorias de caracteres possíveis (letras maiúsculas, minúsculas, números e símbolos em uma única string)

    local senha = "" --Aqui ele inicializa a senha vazia, ou seja, começa com uma string sem nada dentro — ela vai ser preenchida aos poucos dentro do laço fornecido 

    for i = 1, tamanho do --Esse for vai repetir um bloco de código “tamanho” vezes, onde tamanho provavelmente é uma variável com o número de caracteres que você quer na senha ex: tamanho = 10
    
        local indice = math.random(1, #todosCaracteres) --math.random(a, b) → gera um número aleatório entre a e baseada em b. Aqui ele está gerando um índice aleatório entre 1 e o comprimento total da string todosCaracteres (representado por #todosCaracteres) 

        senha = senha .. todosCaracteres:sub(indice, indice) --Aqui ele está pegando o caractere na posição índice da string todosCaracteres usando o método sub, que extrai uma substring. Ele então concatena esse caractere à variável senha, construindo a senha caractere por caractere.
        
    end
    return senha
end