require "open-uri"
User.destroy_all

require 'csv'
School.destroy_all

filepath = Rails.root.join('lib', 'datasets', 'escolas.csv')
csv_options = { col_sep: ';', quote_char: '"', headers: :first_row, encoding: 'UTF-8' }

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

file = URI.open('https://images.pexels.com/photos/1239288/pexels-photo-1239288.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=200')
usr1 = User.create!(
  email: 'ana@def.com',
  password: '123456',
  name: 'Ana',
  role: 'student'
)
usr1.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
