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

def calculaNovaPosicao(heroi, direcao)
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
    heroi
end

def joga(nome)
   mapa = leMapa(1)

   while true
    desenha(mapa)
    direcao = pedeMovimento
    heroi = encontraJogador(mapa)
    mapa[heroi[0]] [heroi[1]] = " "
    novaPosicao = calculaNovaPosicao(heroi, direcaos)
    mapa[novaPosicao[0]] [novaPosicao[1]] = "H"
   end
end

def iniciaPacMan
    nome = boasVindas

    joga(nome)
end