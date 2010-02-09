require "MaquinaDeInferencia"

describe MaquinaDeInferencia do

  before(:all) do
    @maquina = MaquinaDeInferencia.new
  end

  it "should be able to create new inference engine" do
    @maquina.class.should be MaquinaDeInferencia
  end

  it "deveria aceitar uma frase qualquer" do
    @maquina.executar("todo humano eh peludo").should == "Ok"
  end

  it "deveria aprender que existe 'humano' e 'peludo'" do
    @maquina.executar("todo humano eh peludo").should == "Ok"
    @maquina.conhece?("humano").should be_true
    @maquina.conhece?("peludo").should be_true
  end

  it "nao deveria aprender que existe 'mamifero'" do
    @maquina.executar("todo humano eh peludo").should == "Ok"
    @maquina.conhece?("mamifero").should be_false
  end

  it "deveria aprender que 'humano' eh filho de 'peludo'" do
    @maquina.executar("todo humano eh peludo").should == "Ok"
    @maquina.executar("todo humano eh peludo?").should == "Sim"
  end

  it "deveria aprender que 'humano' nao eh filho de 'mortal'" do
    @maquina.executar("todo humano eh peludo").should == "Ok"
    @maquina.executar("todo humano eh mortal?").should == "Eu nao sei"
  end

  it "deveria aprender que 'humano' eh filho de 'peludo'" do
    @maquina.executar("todo mamifero eh peludo").should == "Ok"
    @maquina.executar("todo humano eh mamifero").should == "Ok"
    @maquina.executar("todo humano eh peludo?").should == "Sim"
  end

    it "deveria aprender que 'mamifero' nao eh filho de 'humano'" do
    @maquina.executar("todo mamifero eh peludo").should == "Ok"
    @maquina.executar("todo humano eh mamifero").should == "Ok"
    @maquina.executar("todo mamifero eh humano?").should == "Eu nao sei"
  end

#  it "should be able interpret words 'all' and 'eh'" do
#    inference_engine = InferenceEngine.new
#    inference_engine.executar "todo humano eh peludo"
#    inference_engine.executar "todo mamifero eh peludo"
#    inference_engine.conhecimento.each {|set| puts set.nome}
#    inference_engine.conhecimento.first.elementos.include?"humano".should be_true
#    inference_engine.conhecimento.first.elementos.include?"mamifero".should be_true
#  end

#  it "should be able interpret words 'all' and 'eh'" do
#    inference_engine = InferenceEngine.new
#    inference_engine.executar "todo mamifero eh peludo"
#    inference_engine.executar "todo humano eh mamifero"
#    inference_engine.conhecimento.each {|set| puts set.nome}
#    inference_engine.conhecimento.first.elementos.include?"humano".should be_true
#    inference_engine.conhecimento.first.elementos.include?"mamifero".should be_true
#    resposta = inference_engine.executar "todo humano eh peludo?"
#    resposta.should be == "Sim"
#  end

#  it "should be able interpret words 'all' and 'eh'" do
#    inference_engine = InferenceEngine.new
#    inference_engine.executar "todo jeniffer eh bonita"
#    inference_engine.executar "todo desastrada eh jeniffer"
#    inference_engine.conhecimento.each {|set| puts set.nome}
#    inference_engine.conhecimento.first.elementos.include?"humano".should be_true
#    inference_engine.conhecimento.first.elementos.include?"mamifero".should be_true
#    resposta = inference_engine.executar "todo desastrada eh bonita?"
#    resposta.should be == "Sim"
#  end

end

