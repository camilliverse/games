
--PAR OU IMPAR-- 

io.write("digite um numero: ")
local n = tonumber(io.read())

if n % 2 == 0 then --verifica se o numero é par ou impar 
    print("O numero "..n.." e par.")
else
    print("O numero "..n.." e impar.")
end --O end marca o fim. 

--Se a condição não for verdadeira, o programa vai para o else e mostra “O número é ímpar.”
--% é o operador que retorna o resto da divisão. 