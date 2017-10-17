def boasVindas
    puts "bem vindo ao jogo do Pac Man"
    puts "qual é seu nome?"
    nome = gets.strip
    puts "começaremos o jogo pra voce #{nome}"
    puts "\n\n\n\n\n"
    nome
end

def desenha(mapa)
    puts mapa
end

def pedeMovimento
    puts "Para onde deseja ir?"
    movimento = gets.strip
    puts "\n\n\n\n"
    movimento
end