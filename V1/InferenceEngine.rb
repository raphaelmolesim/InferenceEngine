require 'Set'

class InferenceEngine

  attr_accessor :conhecimento, :modo

  def initialize
    @conhecimento = []
  end

  def todo(set)
    return set if (@modo == :pergunta)
    "Ok"
  end

  def eh(set)
    set
  end

  def executar(frase)
    if (frase.include?"?")
      @modo = :pergunta
      frase = frase[0..frase.size-2]
    else
      @modo = :afirmacao
    end
    puts frase
    eval frase
  end

  def method_missing(method_sym, *arguments, &block)
    set1 = getSet method_sym.to_s
    return set1 if (arguments.size == 0)
    set2 = arguments.first
    if (@modo == :afirmacao)
      set2 << set1
      return set2
    elsif (@modo == :pergunta)
      if (set1.pais.include?set2)
        return "Sim"
      else
        return "Nao"
      end
    end
  end

  def getSet set_name
    return find_set_by_nome set_name if(include_set? set_name)
    new_set = Set.new
    new_set.nome = set_name
    @conhecimento << new_set
    new_set
  end

  def include_set? nome
    @conhecimento.each do |set|
      return true if set.nome == nome
    end
    false
  end

  def find_set_by_nome nome
    @conhecimento.each do |set|
      return set if set.nome == nome
    end
  end

end

