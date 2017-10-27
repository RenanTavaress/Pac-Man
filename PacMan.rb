require_relative 'ui'

def leMapa(numero)
    arquivo = "mapa#{numero}.txt"
    texto = File.read(arquivo)
    mapa = texto.split "\n"
end

def moveFantasma(mapa, linha, coluna)
    posicao = [linha, coluna + 1]
    if posicaoValida? mapa, posicao
        mapa[linha] [coluna] = " "
        mapa[posicao[0]] [posicao[1]] = "F"
    end
end

def moveFantasmas(mapa)
    caracterDoFantasma = "F"
    mapa.each_with_index do |linhaAtual, linha|
        linhaAtual.chars.each_with_index do |caracterAtual, coluna|
            ehfantasma = caracterAtual == caracterDoFantasma
            if ehfantasma
                moveFantasma(mapa, linha, coluna)
            end
        end
    end
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
    valorAtual = mapa[posicao[0]] [posicao[1]]
    
    if estouroLinhas || estouroColunas
        return false
    end
    if valorAtual  == "X" || valorAtual == "F"
        return false
    end
    true
end

def joga(nome)
   mapa = leMapa(2)

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

    moveFantasmas(mapa)
   end
end

def iniciaPacMan
    nome = boasVindas

    joga(nome)
end