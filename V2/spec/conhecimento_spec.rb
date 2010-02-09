require 'Conhecimento'
require 'Entidade'

describe Conhecimento do

  before(:all) do
    @conhecimento = Conhecimento.new
  end

  it "deveria ser possivel criar um conhecimento" do
    @conhecimento.class.should be == Conhecimento
  end

  it "deveria conhecer uma frase adicionada" do
    frase = ["mortal", "humano"]
    @conhecimento << frase
    @conhecimento.eh_verdade?(frase).should be_true
  end

end

