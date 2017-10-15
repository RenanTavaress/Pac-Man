require_relative 'ui'

def leMapa(numero)
    arquivo = "mapa#{numero}.txt"
    texto = File.read arquivo
    mapa = texto.split "\n"
end

def encontraJogador
    for linha = 0..(mapa.size-1)
        if mapa[linha].include? "H"
            for coluna = 0..(mapa[linha].size-1)
                if mapa[linha] [coluna] == "H"
                    #encontrei o jogador
                end
            end
        end
    end
    #nao encontrei o jogador
end

def joga(nome)
   mapa = leMapa(1)

   while true
    desenha(mapa)
    direcao = pedeMovimento
   end
end

def iniciaPacMan
    nome = boasVindas

    joga(nome)
end