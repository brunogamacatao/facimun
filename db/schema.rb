# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130905121907) do

  create_table "delegados", :force => true do |t|
    t.string   "nome",                                               :null => false
    t.string   "data_de_nascimento",                                 :null => false
    t.string   "cidade",                                             :null => false
    t.string   "uf",                 :limit => 2,                    :null => false
    t.string   "instituicao",                                        :null => false
    t.string   "curso",                                              :null => false
    t.integer  "periodo",                                            :null => false
    t.string   "email",                                              :null => false
    t.string   "telefone",                                           :null => false
    t.boolean  "socio_anet",                      :default => false
    t.string   "codigo_anet"
    t.datetime "created_at",                                         :null => false
    t.datetime "updated_at",                                         :null => false
    t.string   "cpf"
    t.string   "endereco"
    t.string   "bairro"
    t.string   "cep"
    t.string   "complemento"
  end

  create_table "estados", :force => true do |t|
    t.string   "nome"
    t.string   "sigla"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "inscricoes", :force => true do |t|
    t.integer  "delegado_a_id"
    t.integer  "delegado_b_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "inscricoes", ["delegado_a_id"], :name => "index_inscricoes_on_delegado_a_id"
  add_index "inscricoes", ["delegado_b_id"], :name => "index_inscricoes_on_delegado_b_id"

  create_table "paises", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "preferencia_paises", :force => true do |t|
    t.integer  "inscricao_id"
    t.integer  "pais_id"
    t.integer  "preferencia"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "preferencia_paises", ["inscricao_id"], :name => "index_preferencia_paises_on_inscricao_id"
  add_index "preferencia_paises", ["pais_id"], :name => "index_preferencia_paises_on_pais_id"

  create_table "titulos", :force => true do |t|
    t.date     "data_de_vencimento"
    t.decimal  "valor"
    t.integer  "inscricao_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "titulos", ["inscricao_id"], :name => "index_titulos_on_inscricao_id"

end
