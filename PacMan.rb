require_relative 'ui'

def leMapa(numero)
    arquivo = "mapa#{numero}.txt"
    texto = File.read(arquivo)
    mapa = texto.split "\n"
end

def encontraJogador(mapa)
    letraDoHeroi = "H"
    mapa.each_with_index do |linhaAtual, linha|
        linhaAtual = mapa[linha]
        colunaDoHeroi = linhaAtual.index letraDoHeroi
        if colunaDoHeroi != nil
            return [linha, colunaDoHeroi]
        end   
    end
    #nao encontrei o jogador
end

def joga(nome)
   mapa = leMapa(1)

   while true
    desenha(mapa)
    direcao = pedeMovimento
    heroi = encontraJogador(mapa)
    mapa[heroi[0]] [heroi[1]] = " "
    case direcao
        when "W"
            heroi[0] -= 1
        when "S"
            heroi[0] += 1
        when "A"
            heroi[1] -= 1
        when "D"
            heroi[1] += 1
    end
    mapa[heroi[0]] [heroi[1]] = "H"
   end
end

def iniciaPacMan
    nome = boasVindas

    joga(nome)
end