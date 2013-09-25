#encoding: utf-8

Pais.delete_all
Pais.create([
  {nome: "SÍRIA"},
  {nome: "CHINA"},
  {nome: "RUSSIA"},
  {nome: "FRANÇA"},
  {nome: "ESTADOS UNIDOS"},
  {nome: "REINO UNIDO"},
  {nome: "AZERBAIJÃO"},
  {nome: "TOGO"},
  {nome: "GUATEMALA"},
  {nome: "MARROCOS"},
  {nome: "PAQUISTÃO"},
  {nome: "ARGENTINA"},
  {nome: "AUSTRALIA"},
  {nome: "LUXEMBURGO"},
  {nome: "REPUBLICA DA COREIA"},
  {nome: "RUANDA"}])
  
if Cargo.all.empty?
  Cargo.create([
    {nome: "Diretor de Aviação Comercial"},
    {nome: "Diretor de Aviação Agrícola"},
    {nome: "Diretor de Defesa e Segurança"},
    {nome: "Diretor de Responsabilidade Socioambiental"},
    {nome: "Diretor de Relações com Investidores"},
    {nome: "Diretor de Recursos Humanos"},
    {nome: "Representante da ANAC"},
    {nome: "Representante da FAB"},
    {nome: "Assessor de Relações Governamentais"}
  ])
end
  
if Estado.all.empty?
  Estado.create([
    {nome: "Acre", sigla: "AC"},
    {nome: "Alagoas", sigla: "AL"},
    {nome: "Amapá", sigla: "AP"},
    {nome: "Amazonas", sigla: "AM"},
    {nome: "Bahia", sigla: "BA"},
    {nome: "Ceará", sigla: "CE"},
    {nome: "Distrito Federal", sigla: "DF"},
    {nome: "Espírito Santo", sigla: "ES"},
    {nome: "Goiás", sigla: "GO"},
    {nome: "Maranhão", sigla: "MA"},
    {nome: "Mato Grosso", sigla: "MT"},
    {nome: "Mato Grosso do Sul", sigla: "MS"},
    {nome: "Minas Gerais", sigla: "MG"},
    {nome: "Pará", sigla: "PA"},
    {nome: "Paraíba", sigla: "PB"},
    {nome: "Paraná", sigla: "PR"},
    {nome: "Pernambuco", sigla: "PE"},
    {nome: "Piauí", sigla: "PI"},
    {nome: "Rio de Janeiro", sigla: "RJ"},
    {nome: "Rio Grande do Norte", sigla: "RN"},
    {nome: "Rio Grande do Sul", sigla: "RS"},
    {nome: "Rondônia", sigla: "RO"},
    {nome: "Roraima", sigla: "RR"},
    {nome: "Santa Catarina", sigla: "SC"},
    {nome: "São Paulo", sigla: "SP"},
    {nome: "Sergipe", sigla: "SE"},
    {nome: "Tocantins", sigla: "TO"}
  ])
end