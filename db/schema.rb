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

ActiveRecord::Schema.define(:version => 20130923121412) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "comites", :force => true do |t|
    t.string   "nome"
    t.integer  "vagas"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

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

  create_table "inscricao_genericas", :force => true do |t|
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "inscrevivel_id"
    t.string   "inscrevivel_type"
  end

  create_table "inscricoes", :force => true do |t|
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "delegado_id"
    t.integer  "comite_id"
  end

  add_index "inscricoes", ["comite_id"], :name => "index_inscricoes_on_comite_id"
  add_index "inscricoes", ["delegado_id"], :name => "index_inscricoes_on_delegado_id"

  create_table "inscricoes_ciclo_direito_publico", :force => true do |t|
    t.string   "nome"
    t.string   "cpf"
    t.string   "data_de_nascimento"
    t.string   "email"
    t.string   "telefone"
    t.string   "endereco"
    t.string   "bairro"
    t.string   "cep"
    t.string   "cidade"
    t.string   "uf"
    t.string   "complemento"
    t.string   "instituicao"
    t.string   "curso"
    t.integer  "periodo"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.boolean  "aluno_facisa"
    t.integer  "matricula"
  end

  create_table "inscricoes_genericas", :force => true do |t|
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "inscrevivel_id"
    t.string   "inscrevivel_type"
  end

  create_table "pagamentos", :force => true do |t|
    t.decimal  "valor"
    t.integer  "titulo_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "pagamentos", ["titulo_id"], :name => "index_pagamentos_on_titulo_id"

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
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.integer  "inscricao_generica_id"
    t.boolean  "pago",                  :default => false
  end

end
