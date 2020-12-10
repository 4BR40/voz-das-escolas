# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'
School.destroy_all

filepath = Rails.root.join('lib', 'datasets', 'escolas.csv')
csv_options = { col_sep: ';', quote_char: '"', headers: :first_row, encoding: 'UTF-8' }
# csv = CSV.parse(csv_text, csv_options)
# puts csv

puts filepath
CSV.foreach(filepath, csv_options) do |row|
  School.create!(
    id: row['Código INEP'],
    name: row['Escola'],
    address: row['Endereço'],
    city: row['Município'],
    state: row['UF'],
    location: row['Localização'],
    lat: row['Latitude'],
    lng: row['Longitude']
  )
end

# Restrição de Atendimento;Escola;Código INEP;UF;Município;Localização;Localidade Diferenciada;Categoria Administrativa;Endereço;Telefone;Dependência Administrativa;Categoria Escola Privada;Conveniada Poder Público;Regulamentação pelo Conselho de Educação;Porte da Escola;Etapas e Modalidade de Ensino Oferecidas;Outras Ofertas Educacionais;Latitude;Longitude
