require 'Entidade'

describe Entidade do

  it "deveria saber busca em profundidade que humano eh peludo" do
    entidade1 = Entidade.new "peludo"
    entidade2 = Entidade.new "humano"
    entidade1 << entidade2
    entidade1.busca_profundidade("humano").should be == entidade2
  end

  it "deveria saber busca em profundidade que humano nao eh mortal" do
    entidade1 = Entidade.new "peludo"
    entidade2 = Entidade.new "humano"
    entidade1 << entidade2
    entidade1.busca_profundidade("mortal").should be == nil
  end

end

