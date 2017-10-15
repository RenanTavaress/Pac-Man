require_relative 'ui'

def leMapa(numero)
    arquivo = "mapa#{numero}.txt"
    texto = File.read arquivo
    mapa = texto.split "\n"
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