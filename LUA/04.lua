
--CONTADOR ATÉ O NÚMERO INSERIDO--

io.write("Contar ate qual numero? ")
local limite = tonumber(io.read())

for i = 1, limite do --Cria um laço de repetição (loop) que começa em 1 e vai até limite. --A variável i muda de valor a cada volta do loop.
    print(i) --Mostra o número atual (i) na tela a cada repetição.
end --O end marca o fim do loop.