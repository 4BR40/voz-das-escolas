require "open-uri"
require 'csv'
Report.destroy_all
User.destroy_all
School.destroy_all
Category.destroy_all

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

# users
file = URI.open('https://images.pexels.com/photos/1239288/pexels-photo-1239288.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=200')
usr1 = User.create!(
  email: 'ana@def.com',
  password: '123456',
  name: 'Ana',
  role: 'student',
  school_id: School.first.id
)
usr1.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')

file = URI.open('https://images.pexels.com/photos/1484576/pexels-photo-1484576.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=200')
usr2 = User.create!(
  email: 'ze@def.com',
  password: '123456',
  name: 'Zé',
  role: 'student',
  school_id: School.first.id
)
usr2.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')

file = URI.open('https://images.pexels.com/photos/718978/pexels-photo-718978.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=200')
usr3 = User.create!(
  email: 'maria@def.com',
  password: '123456',
  name: 'Maria',
  role: 'student',
  school_id: School.last.id
)
usr3.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')

file = URI.open('https://images.pexels.com/photos/35065/homeless-man-color-poverty.jpg?auto=compress&cs=tinysrgb&dpr=2&h=250')
usr4 = User.create!(
  email: 'joao@def.com',
  password: '123456',
  name: 'João',
  role: 'student',
  school_id: School.last.id
)
usr4.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')

aulas = Category.create!(name: 'Aulas', accept_problem: true)
bullying = Category.create!(name: 'Bullying', accept_problem: true)
esportes = Category.create!(name: 'Esportes', accept_problem: true)
info = Category.create!(name: 'Informática', accept_problem: true)
limpeza = Category.create!(name: 'Limpeza', accept_problem: true)
livros = Category.create!(name: 'Livros', accept_problem: true)
manut = Category.create!(name: 'Manutenção', accept_problem: true)
merenda = Category.create!(name: 'Merenda', accept_problem: true)
seguranca = Category.create!(name: 'Segurança', accept_problem: true)
transporte = Category.create!(name: 'Transporte', accept_problem: true)
ventilacao = Category.create!(name: 'Ventilação', accept_problem: true)
outros = Category.create!(name: 'Outros', accept_problem: true)

file = URI.open('https://www.gazetavg.com.br/wp-content/uploads/2020/03/janela-quebrada-gazeta-mar%C3%A7o-2020-1.jpeg')
rep = Report.create!(
  description: 'A janela da sala do setimo ano A está quebrada e pode causar acidente.',
  category_id: manut.id,
  school_id: School.first.id,
  user_id: usr1.id
)
rep.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')

file = URI.open('http://3.bp.blogspot.com/-6xEiZfyOF7g/VbTTlQGAOfI/AAAAAAAAAqQ/ZgJOtGxR_Ms/s1600/tiolet3.jpg')
file1 = URI.open('http://2.bp.blogspot.com/-IsG_Z8RocNM/VbTYhnMi3eI/AAAAAAAAAqw/ZWd-KhtO_-c/s1600/tiolet6.jpeg')
file2 = URI.open('https://www.sbnoticias.com.br/tickers/imagens/7fa42ea0769d3bf6406a952c0b033f74.jpg')
file3 = URI.open('http://sbnoticias.com.br/tickers/midia/b8f71e535a16f5d0349699b616d8b91b.jpg')
rep = Report.create!(
  description: 'Os banheiros estão sujos e sempre falta papel higiênnico.',
  category_id: limpeza.id,
  school_id: School.first.id,
  user_id: usr1.id
)
rep.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
rep.photos.attach(io: file1, filename: 'nes.png', content_type: 'image/png')
rep.photos.attach(io: file2, filename: 'nes.png', content_type: 'image/png')
rep.photos.attach(io: file3, filename: 'nes.png', content_type: 'image/png')

file = URI.open('https://3.bp.blogspot.com/-ADarM8Erchk/WOQtAp6fpFI/AAAAAAAAIX4/Ai1-1FNbRBwm09OzUoO0WvuuoLvE6q5iwCLcB/s640/17523338_290181211403839_6191663590102813870_n.jpg')
file1 = URI.open('https://3.bp.blogspot.com/-RO5vmglZO50/Vikou3shvUI/AAAAAAAAAEg/Q7Lj8Tolv_k/s1600/Merenda%2Bescolar.jpg')
file2 = URI.open('https://4.bp.blogspot.com/-cFuYMNpoB_Q/WOQtoKNt2yI/AAAAAAAAIYE/5i4X2EfHDHIzLLvsldZWIVBinyUDcOiBgCLcB/s640/17796396_290181244737169_2632645363094477056_n%2B%25281%2529.jpg')
rep = Report.create!(
  description: 'A merenda está uma vergonha. Vejam as fotos',
  category_id: merenda.id,
  school_id: School.first.id,
  user_id: usr2.id
)
rep.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
rep.photos.attach(io: file1, filename: 'nes.png', content_type: 'image/png')
rep.photos.attach(io: file2, filename: 'nes.png', content_type: 'image/png')

# file = URI.open('')
# file = URI.open('')
rep1 = Report.create!(
  description: 'Mussum Ipsum, cacilds vidis litro abertis. Casamentiss faiz malandris se pirulitá. Quem num gosta di mé,
                boa gentis num é. Admodum accumsan disputationi eu sit. Vide electram sadipscing et per. Nullam volutpat
                risus nec leo commodo, ut interdum diam laoreet. Sed non consequat odio.',
  category_id: aulas.id,
  school_id: School.last.id,
  user_id: usr4.id,
  solved: true
)
# rep.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')

# file = URI.open('')
rep2 = Report.create!(
  description: 'Casamentiss faiz malandris se pirulitá. Quem num gosta di mé,
                boa gentis num é. Admodum accumsan disputationi eu sit. Vide electram sadipscing et per. Nullam volutpat
                risus nec leo commodo, ut interdum diam laoreet. Sed non consequat odio.',
  category_id: bullying.id,
  school_id: School.first.id,
  user_id: usr1.id
)
# rep.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
# file = URI.open('')

# reports
Report.create!(
  user_id: usr3.id,
  school_id: School.last.id,
  category_id: livros.id,
  description: 'Mussum Ipsum, cacilds vidis litro abertis. Casamentiss faiz malandris se pirulitá. Quem num gosta di mé,
                boa gentis num é. Admodum accumsan disputationi eu sit. Vide electram sadipscing et per. Nullam volutpat
                risus nec leo commodo, ut interdum diam laoreet. Sed non consequat odio.'
)
Report.create!(
  user_id: usr4.id,
  school_id: School.last.id,
  category_id: info.id,
  description: 'Casamentiss faiz malandris se pirulitá. Quem num gosta di mé,
                boa gentis num é. Admodum accumsan disputationi eu sit. Vide electram sadipscing et per. Nullam volutpat
                risus nec leo commodo, ut interdum diam laoreet. Sed non consequat odio.'
)
Report.create!(
  user_id: usr1.id,
  school_id: School.first.id,
  category_id: ventilacao.id,
  solved: true,
  description: 'Quem num gosta di mé,
                boa gentis num é. Admodum accumsan disputationi eu sit. Vide electram sadipscing et per. Nullam volutpat
                risus nec leo commodo, ut interdum diam laoreet. Sed non consequat odio.'
)
Report.create!(
  user_id: usr4.id,
  school_id: School.last.id,
  category_id: seguranca.id,
  description: 'Casamentiss faiz malandris se pirulitá. Quem num gosta di mé,
                boa gentis num é. Admodum accumsan disputationi eu sit. Vide electram sadipscing et per. Nullam volutpat
                risus nec leo commodo, ut interdum diam laoreet. Sed non consequat odio.'
)
Report.create!(
  user_id: usr1.id,
  school_id: School.first.id,
  category_id: seguranca.id,
  description: 'Vide electram sadipscing et per. Nullam volutpat
                risus nec leo commodo, ut interdum diam laoreet. Sed non consequat odio.'
)
Report.create!(
  user_id: usr2.id,
  school_id: School.first.id,
  category_id: esportes.id,
  description: 'Admodum accumsan disputationi eu sit. Vide electram sadipscing et per. Nullam volutpat
                risus nec leo commodo, ut interdum diam laoreet. Sed non consequat odio.'
)
Report.create!(
  user_id: usr3.id,
  school_id: School.last.id,
  category_id: outros.id,
  solved: true,
  description: 'Vide electram sadipscing et per. Nullam volutpat nec leo commodo, ut interdum diam laoreet.
                risus nec leo commodo, ut interdum diam laoreet. Sed non consequat odio.'
)
Report.create!(
  user_id: usr2.id,
  school_id: School.first.id,
  category_id: aulas.id,
  description: 'Nullam volutpat nec leo commodo, ut interdum diam laoreet. Vide electram sadipscing et per.
                risus nec leo commodo, ut interdum diam laoreet. Sed non consequat odio.'
)
Report.create!(
  user_id: usr4.id,
  school_id: School.last.id,
  category_id: outros.id,
  solved: true,
  description: 'Quem num gosta di mé,
                boa gentis num é. Admodum accumsan disputationi eu sit. Vide electram sadipscing et per. Nullam volutpat
                risus nec leo commodo, ut interdum diam laoreet. Sed non consequat odio.'
)
Report.create!(
  user_id: usr2.id,
  school_id: School.first.id,
  category_id: transporte.id,
  description: 'Nullam volutpatrisus nec leo commodo, ut interdum diam laoreet. Sed non consequat odio.'
)
