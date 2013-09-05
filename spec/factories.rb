#encoding: utf-8
require 'date'

FactoryGirl.define do
  factory :delegado_a, class: Delegado do
    nome               "Fulano de Tal da Silva"
    data_de_nascimento Date.new(1982, 2, 15)
    cpf                "000.000.000-00"
    email              "fulano@email.com"
    telefone           "(83)1234-4321"
    endereco           "Endereço"
    bairro             "Bairro"
    cep                "58402-030"
    complemento        ""
    cidade             "Campina Grande"
    uf                 "PB"
    socio_anet         false
    instituicao        "FACISA"
    curso              "Sistemas de Informação"
    periodo            5
  end
  
  factory :delegado_b, class: Delegado do
    nome               "Fulana de Tal da Silva"
    data_de_nascimento Date.new(1978, 10, 21)
    cpf                "111.111.111-11"
    email              "fulana@email.com"
    telefone           "(83)4321-1234"
    endereco           "Endereço"
    bairro             "Bairro"
    cep                "58402-000"
    complemento        ""
    cidade             "Campina Grande"
    uf                 "PB"
    socio_anet         true
    codigo_anet        "1234-5"
    instituicao        "FACISA"
    curso              "Direito"
    periodo            9
  end
  
  factory :inscricao, class: Inscricao do
    delegado_a
    delegado_b
  end
  
  factory :titulo, class: Titulo do
    inscricao
    data_de_vencimento 3.days.from_now.to_date
    valor              128.5
  end
end