require_relative 'ui'

def leMapa(numero)
    arquivo = "mapa#{numero}.txt"
    texto = File.read(arquivo)
    mapa = texto.split "\n"
end

def moveFantasma(mapa, linha, coluna)
    mapa[linha] [coluna] = " "
    linha += 0
    coluna += 1
    mapa[linha] [coluna] = "F"
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
    heroi = heroi.dup
    system('cls')
    movimentos = {
        "W" => [-1, 0],
        "S" => [+1, 0],
        "A" => [0, -1],
        "D" => [0, +1]
    }
    
    movimento = movimentos[direcao]
    heroi[0] += movimento[0]
    heroi[1] += movimento[1]
    heroi
end

def posicaoValida?(mapa, posicao)
    linhas = mapa.size
    colunas = mapa[0].size
    estouroLinhas = posicao[0] < 0 || posicao[0] >= linhas
    estouroColunas = posicao[1] < 0 || posicao[1] >= colunas
    
    if estouroLinhas || estouroColunas
        return false
    end
    if mapa[posicao[0]] [posicao[1]] == "X"
        return false
    end
    true
end

def joga(nome)
   mapa = leMapa(1)

   while true
        desenha(mapa)
        direcao = pedeMovimento
        heroi = encontraJogador(mapa)
        novaPosicao = calculaNovaPosicao(heroi, direcao)
        if !posicaoValida?(mapa, novaPosicao)
            next
        end
    mapa[heroi[0]] [heroi[1]] = " "
    mapa[novaPosicao[0]] [novaPosicao[1]] = "H"
   end
end

def iniciaPacMan
    nome = boasVindas

    joga(nome)
end