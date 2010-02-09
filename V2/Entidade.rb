class Entidade

  def initialize nome
    @nome = nome
    @filhos = []
  end

  def eql? entidade_nome
    @nome == entidade_nome
  end

  def << entidade
    @filhos << entidade
  end

  def busca_profundidade nome_entidade
    return self if self.eql? nome_entidade
    @filhos.each do |filho|
      return filho.busca_profundidade nome_entidade
    end
    nil
  end

end

