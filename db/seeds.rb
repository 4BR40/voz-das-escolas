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

# users
file = URI.open('https://images.pexels.com/photos/1239288/pexels-photo-1239288.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=200')
usr1 = User.create!(
  email: 'ana@def.com',
  password: '123456',
  name: 'Ana',
  role: 'student',
  school_id: 53_068_238
)
usr1.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')

file = URI.open('https://images.pexels.com/photos/35065/homeless-man-color-poverty.jpg?auto=compress&cs=tinysrgb&dpr=2&h=250')
usr4 = User.create!(
  email: 'joao@def.com',
  password: '123456',
  name: 'João',
  role: 'student',
  school_id: 53_000_200
)
usr4.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')

file = URI.open('https://images.pexels.com/photos/1484576/pexels-photo-1484576.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=200')
usr2 = User.create!(
  email: 'ze@def.com',
  password: '123456',
  name: 'Zé',
  role: 'student',
  school_id: 53_000_200
)
usr2.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')

file = URI.open('https://images.pexels.com/photos/718978/pexels-photo-718978.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=200')
usr3 = User.create!(
  email: 'maria@def.com',
  password: '123456',
  name: 'Maria',
  role: 'student',
  school_id: 53_068_238
)
usr3.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')

# categories
Category.create!(name: 'Merenda escolar', accept_problem: true)
Category.create!(name: 'Infraestrutura', accept_problem: true)
Category.create!(name: 'Violência', accept_problem: true)

# reports
Report.create!(
  user_id: 2,
  school_id: 53_000_200,
  category_id: 1,
  description: 'Mussum Ipsum, cacilds vidis litro abertis. Casamentiss faiz malandris se pirulitá. Quem num gosta di mé,
                boa gentis num é. Admodum accumsan disputationi eu sit. Vide electram sadipscing et per. Nullam volutpat
                risus nec leo commodo, ut interdum diam laoreet. Sed non consequat odio.'
)

Report.create!(
  user_id: 2,
  school_id: 53_000_200,
  category_id: 2,
  description: 'Casamentiss faiz malandris se pirulitá. Quem num gosta di mé,
                boa gentis num é. Admodum accumsan disputationi eu sit. Vide electram sadipscing et per. Nullam volutpat
                risus nec leo commodo, ut interdum diam laoreet. Sed non consequat odio.'
)

Report.create!(
  user_id: 2,
  school_id: 53_000_200,
  category_id: 3,
  description: 'Quem num gosta di mé,
                boa gentis num é. Admodum accumsan disputationi eu sit. Vide electram sadipscing et per. Nullam volutpat
                risus nec leo commodo, ut interdum diam laoreet. Sed non consequat odio.'
)

Report.create!(
  user_id: 3,
  school_id: 53_000_200,
  category_id: 1,
  description: 'Casamentiss faiz malandris se pirulitá. Quem num gosta di mé,
                boa gentis num é. Admodum accumsan disputationi eu sit. Vide electram sadipscing et per. Nullam volutpat
                risus nec leo commodo, ut interdum diam laoreet. Sed non consequat odio.'
)

Report.create!(
  user_id: 3,
  school_id: 53_000_200,
  category_id: 2,
  description: 'Vide electram sadipscing et per. Nullam volutpat
                risus nec leo commodo, ut interdum diam laoreet. Sed non consequat odio.'
)

Report.create!(
  user_id: 1,
  school_id: 53_068_238,
  category_id: 1,
  description: 'Admodum accumsan disputationi eu sit. Vide electram sadipscing et per. Nullam volutpat
                risus nec leo commodo, ut interdum diam laoreet. Sed non consequat odio.'
)

Report.create!(
  user_id: 1,
  school_id: 53_068_238,
  category_id: 2,
  description: 'Vide electram sadipscing et per. Nullam volutpat nec leo commodo, ut interdum diam laoreet.
                risus nec leo commodo, ut interdum diam laoreet. Sed non consequat odio.'
)

Report.create!(
  user_id: 1,
  school_id: 53_068_238,
  category_id: 3,
  description: 'Nullam volutpat nec leo commodo, ut interdum diam laoreet. Vide electram sadipscing et per.
                risus nec leo commodo, ut interdum diam laoreet. Sed non consequat odio.'
)

Report.create!(
  user_id: 4,
  school_id: 53_068_238,
  category_id: 2,
  description: 'Quem num gosta di mé,
                boa gentis num é. Admodum accumsan disputationi eu sit. Vide electram sadipscing et per. Nullam volutpat
                risus nec leo commodo, ut interdum diam laoreet. Sed non consequat odio.'
)

Report.create!(
  user_id: 4,
  school_id: 53_068_238,
  category_id: 1,
  description: 'Nullam volutpatrisus nec leo commodo, ut interdum diam laoreet. Sed non consequat odio.'
)
