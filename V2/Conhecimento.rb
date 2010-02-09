require 'Entidade'

class Conhecimento

  def initialize
    @entidades = []
  end

  def << frase
    entidadePai = pega_entidade frase.first
    entidadeFilho = pega_entidade frase.last
    entidadePai << entidadeFilho
    @entidades << entidadePai
  end

  def eh_verdade? frase
    return false if (!self.contem? frase.first)
    entidade = busca frase.first
    puts "Frase: #{frase}"
    return true if (!entidade.busca_profundidade(frase.last).nil?)
    false
  end

  def contem? nome_entidade
    @entidades.each do |entidade|
      resultado = entidade.busca_profundidade nome_entidade
      return true if (!resultado.nil?)
    end
    false
  end

  private

    def pega_entidade nome_entidade
      return busca nome_entidade if (self.contem? nome_entidade)
      entidade = Entidade.new nome_entidade
      return entidade
    end

    def busca nome_entidade
      @entidades.each do |entidade|
        resultado = entidade.busca_profundidade nome_entidade
        return resultado if (!resultado.nil?)
      end
      nil
    end

end

