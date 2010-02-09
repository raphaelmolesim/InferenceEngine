class Set

  attr_accessor :nome, :elementos, :pais

  def initialize
    @elementos = []
    @pais = []
  end

  def eql? set
    return set == nome if (set.class == String)
    set.nome == self.nome
  end

  def << set
    elementos << set
    set.pais << self
    pais.each {|set_pai| set.pais << set_pai}
  end
end

