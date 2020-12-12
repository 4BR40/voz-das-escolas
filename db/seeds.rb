require "open-uri"
User.destroy_all
Category.destroy_all

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

file = URI.open('https://images.pexels.com/photos/1484576/pexels-photo-1484576.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=200')
usr2 = User.create!(
  email: 'ze@def.com',
  password: '123456',
  name: 'Zé',
  role: 'student'
)
usr2.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')

file = URI.open('https://images.pexels.com/photos/718978/pexels-photo-718978.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=200')
usr3 = User.create!(
  email: 'maria@def.com',
  password: '123456',
  name: 'Maria',
  role: 'student'
)
usr3.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')

file = URI.open('https://images.pexels.com/photos/35065/homeless-man-color-poverty.jpg?auto=compress&cs=tinysrgb&dpr=2&h=250')
usr4 = User.create!(
  email: 'joao@def.com',
  password: '123456',
  name: 'João',
  role: 'student'
)
usr4.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')

infra = Category.create!(name: 'Infraestrutura', accept_problem: true)
manut = Category.create!(name: 'Manutenção', accept_problem: true)
merenda = Category.create!(name: 'Merenda', accept_problem: true)
violencia = Category.create!(name: 'Violência', accept_problem: true)
ensino = Category.create!(name: 'Ensino', accept_problem: true)
aulas = Category.create!(name: 'Aulas', accept_problem: true)

file = URI.open('https://www.gazetavg.com.br/wp-content/uploads/2020/03/janela-quebrada-gazeta-mar%C3%A7o-2020-1.jpeg')
rep = Report.create!(
  description: 'A janela da sala do setimo ano A está quebrada e pode causar acidente.',
  category_id: infra.id,
  school_id: School.last,
  user_id: usr1 
)
rep.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')

rep = Report.create!(
  description: '',
  category_id: ,
  school_id: ,
  user_id:
)
rep = Report.create!(
  description: '',
  category_id: ,
  school_id: ,
  user_id:
)
rep = Report.create!(
  description: '',
  category_id: ,
  school_id: ,
  user_id:
)
rep = Report.create!(
  description: '',
  category_id: ,
  school_id: ,
  user_id:
)