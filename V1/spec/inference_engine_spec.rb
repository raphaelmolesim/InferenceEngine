require "InferenceEngine"

describe InferenceEngine do
  it "should be able to create new inference engine" do
    inference_engine = InferenceEngine.new
    inference_engine.class.should be InferenceEngine
  end

  it "should be able interpret words 'all' and 'eh'" do
    inference_engine = InferenceEngine.new
    inference_engine.executar "todo humano eh peludo"
    inference_engine.conhecimento.each {|set| puts set.nome}
    inference_engine.conhecimento.first.elementos.include?"humano".should be_true
  end

  it "should be able interpret words 'all' and 'eh'" do
    inference_engine = InferenceEngine.new
    inference_engine.executar "todo humano eh peludo"
    inference_engine.executar "todo mamifero eh peludo"
    inference_engine.conhecimento.each {|set| puts set.nome}
    inference_engine.conhecimento.first.elementos.include?"humano".should be_true
    inference_engine.conhecimento.first.elementos.include?"mamifero".should be_true
  end

  it "should be able interpret words 'all' and 'eh'" do
    inference_engine = InferenceEngine.new
    inference_engine.executar "todo mamifero eh peludo"
    inference_engine.executar "todo humano eh mamifero"
    inference_engine.conhecimento.each {|set| puts set.nome}
    inference_engine.conhecimento.first.elementos.include?"humano".should be_true
    inference_engine.conhecimento.first.elementos.include?"mamifero".should be_true
    resposta = inference_engine.executar "todo humano eh peludo?"
    resposta.should be == "Sim"
  end

  it "should be able interpret words 'all' and 'eh'" do
    inference_engine = InferenceEngine.new
    inference_engine.executar "todo jeniffer eh bonita"
    inference_engine.executar "todo desastrada eh jeniffer"
    inference_engine.conhecimento.each {|set| puts set.nome}
    inference_engine.conhecimento.first.elementos.include?"humano".should be_true
    inference_engine.conhecimento.first.elementos.include?"mamifero".should be_true
    resposta = inference_engine.executar "todo desastrada eh bonita?"
    resposta.should be == "Sim"
  end

end

