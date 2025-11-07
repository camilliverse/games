
----CALCULADORA SIMPLES EM LUA----

io.write("Digite um numero: ") --Mostra a mensagem pedindo o primeiro número (sem pular linha).
local n1 =  tonumber(io.read())

io.write("Digite outro numero: ") --Mostra a mensagem pedindo o segundo número (sem pular linha).
local n2 = tonumber(io.read())

local soma = n1 + n2 --Realiza a soma dos dois números e guarda o resultado na variável 'soma'.
print(""..soma) --Mostra o resultado final na tela.

--io.read() lê o valor digitado.
--tonumber() transforma o texto digitado em número.
--O resultado é guardado na variável n1.
