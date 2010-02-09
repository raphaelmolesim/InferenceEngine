require 'Entidade'
require 'Conhecimento'

class MaquinaDeInferencia

  def initialize
    @conhecimento = Conhecimento.new
    @frase = []
    @modo_execucao = :afirmacao
  end

  def executar frase
    @frase = []
    frase = ativar_modo_execucao frase
    eval frase
  end

  def ativar_modo_execucao frase
    if (frase.include? "?")
      @modo_execucao = :pergunta
      return frase.slice 0, frase.size - 1
    end
    @modo_execucao = :afirmacao if (!frase.include? "?")
    frase
  end

  def conhece? entidade
    @conhecimento.contem? entidade
  end

  def todo nome_entidade
    compor_frase nome_entidade
    return aprender if (@modo_execucao == :afirmacao)
    perguntar
  end

  def aprender
    @conhecimento << @frase
    "Ok"
  end

  def perguntar
    return "Sim" if (@conhecimento.eh_verdade? @frase)
    "Eu nao sei"
  end

  def eh nome_entidade
    compor_frase nome_entidade
  end

  def method_missing(method_sym, *arguments, &block)
    method_sym.to_s
  end

  def compor_frase nome_entidade
    @frase << nome_entidade
  end
end

