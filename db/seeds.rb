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
  school_id: School.first.id
)
usr3.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')

file = URI.open('https://images.pexels.com/photos/35065/homeless-man-color-poverty.jpg?auto=compress&cs=tinysrgb&dpr=2&h=250')
usr4 = User.create!(
  email: 'joao@def.com',
  password: '123456',
  name: 'João',
  role: 'student',
  school_id: School.first.id
)
usr4.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')

usr5 = User.create!(
  email: 'roberto@def.com',
  password: '123456',
  name: 'Roberto',
  role: 'student',
  school_id: 53_000_234
)

usr6 = User.create!(
  email: 'bianca@def.com',
  password: '123456',
  name: 'Bianca',
  role: 'student',
  school_id: 53_000_439
)

usr7 = User.create!(
  email: 'bruno@def.com',
  password: '123456',
  name: 'Bruno',
  role: 'student',
  school_id: 53_000_714
)

usr8 = User.create!(
  email: 'mateus@def.com',
  password: '123456',
  name: 'Mateus',
  role: 'student',
  school_id: 53_000_846
)

usr9 = User.create!(
  email: 'pedro@def.com',
  password: '123456',
  name: 'Pedro',
  role: 'student',
  school_id: 53_000_854
)

usr10 = User.create!(
  email: 'isabela@def.com',
  password: '123456',
  name: 'Isabela',
  role: 'student',
  school_id: School.first.id
)

usr11 = User.create!(
  email: 'milene@def.com',
  password: '123456',
  name: 'Milene',
  role: 'student',
  school_id: School.first.id
)

usr16 = User.create!(
  email: 'luiz@def.com',
  password: '123456',
  name: 'Luiz',
  role: 'student',
  school_id: School.first.id
)

file = URI.open('https://avatars1.githubusercontent.com/u/70971707?s=400&u=6bae063617f1726984e1ca0ea749e4f08af4c166&v=4')
usr12 = User.create!(
  email: 'sander@def.com',
  password: '123456',
  name: 'Sander',
  role: 'student',
  school_id: School.first.id
)
usr12.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')

file = URI.open('https://semanadeinovacao.enap.gov.br/images/Felipe-Leit%C3%A3o-Valadares-Roquete.jpg')
usr14 = User.create!(
  email: 'felipe@def.com',
  password: '123456',
  name: 'Felipe',
  role: 'student',
  school_id: School.first.id
)
usr14.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')

file = URI.open('https://avatars0.githubusercontent.com/u/24359915?s=400&u=30f08947de5902418cbcf706ad7fff982cfaa2ed&v=4')
usr13 = User.create!(
  email: 'alessandro@def.com',
  password: '123456',
  name: 'Alessandro',
  role: 'student',
  school_id: School.first.id
)
usr13.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')

file = URI.open('https://avatars1.githubusercontent.com/u/49009639?s=400&u=27c9a376465c41e73170e4f6f8841b1da2c54bf3&v=4')
usr15 = User.create!(
  email: 'ronaldo@def.com',
  password: '123456',
  name: 'Ronaldo',
  role: 'student',
  school_id: School.first.id
)
usr15.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')

aulas = Category.create!(name: 'Aulas', accept_problem: true)
info = Category.create!(name: 'Informática', accept_problem: true)
merenda = Category.create!(name: 'Merenda', accept_problem: true)
seguranca = Category.create!(name: 'Segurança', accept_problem: true)
manut = Category.create!(name: 'Manutenção', accept_problem: true)
limpeza = Category.create!(name: 'Limpeza', accept_problem: true)
livros = Category.create!(name: 'Livros', accept_problem: true)
ventilacao = Category.create!(name: 'Ventilação', accept_problem: true)
transporte = Category.create!(name: 'Transporte', accept_problem: true)
esportes = Category.create!(name: 'Esportes', accept_problem: true)
bullying = Category.create!(name: 'Bullying', accept_problem: true)
outros = Category.create!(name: 'Outros', accept_problem: true)

file = URI.open('https://www.gazetavg.com.br/wp-content/uploads/2020/03/janela-quebrada-gazeta-mar%C3%A7o-2020-1.jpeg')
rep1 = Report.create!(
  description: 'A janela da sala do sétimo ano está quebrada e pode causar acidente.',
  category_id: manut.id,
  school_id: School.first.id,
  user_id: usr1.id
)
rep1.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')

file = URI.open('http://3.bp.blogspot.com/-6xEiZfyOF7g/VbTTlQGAOfI/AAAAAAAAAqQ/ZgJOtGxR_Ms/s1600/tiolet3.jpg')
file1 = URI.open('http://2.bp.blogspot.com/-IsG_Z8RocNM/VbTYhnMi3eI/AAAAAAAAAqw/ZWd-KhtO_-c/s1600/tiolet6.jpeg')
file2 = URI.open('https://www.sbnoticias.com.br/tickers/imagens/7fa42ea0769d3bf6406a952c0b033f74.jpg')
file3 = URI.open('http://sbnoticias.com.br/tickers/midia/b8f71e535a16f5d0349699b616d8b91b.jpg')
rep2 = Report.create!(
  description: 'Os banheiros estão sujos e sempre falta papel higiênnico.',
  category_id: limpeza.id,
  school_id: School.first.id,
  user_id: usr1.id
)
rep2.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
rep2.photos.attach(io: file1, filename: 'nes.png', content_type: 'image/png')
rep2.photos.attach(io: file2, filename: 'nes.png', content_type: 'image/png')
rep2.photos.attach(io: file3, filename: 'nes.png', content_type: 'image/png')

file = URI.open('https://3.bp.blogspot.com/-ADarM8Erchk/WOQtAp6fpFI/AAAAAAAAIX4/Ai1-1FNbRBwm09OzUoO0WvuuoLvE6q5iwCLcB/s640/17523338_290181211403839_6191663590102813870_n.jpg')
file1 = URI.open('https://3.bp.blogspot.com/-RO5vmglZO50/Vikou3shvUI/AAAAAAAAAEg/Q7Lj8Tolv_k/s1600/Merenda%2Bescolar.jpg')
file2 = URI.open('https://4.bp.blogspot.com/-cFuYMNpoB_Q/WOQtoKNt2yI/AAAAAAAAIYE/5i4X2EfHDHIzLLvsldZWIVBinyUDcOiBgCLcB/s640/17796396_290181244737169_2632645363094477056_n%2B%25281%2529.jpg')
rep3 = Report.create!(
  description: 'A merenda está uma vergonha. Vejam as fotos',
  category_id: merenda.id,
  school_id: School.first.id,
  user_id: usr2.id
)
rep3.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
rep3.photos.attach(io: file1, filename: 'nes.png', content_type: 'image/png')
rep3.photos.attach(io: file2, filename: 'nes.png', content_type: 'image/png')

file = URI.open('https://conteudo.imguol.com.br/c/noticias/2014/04/22/sala-de-aula-lousa-escola-publica-1398183134814_615x300.jpg')
rep4 = Report.create!(
  description: 'Sem professor de inglês desde o início do ano. Quatro meses, zero aula.',
  category_id: aulas.id,
  school_id: School.first.id,
  user_id: usr4.id,
  solved: true
)
rep4.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')

# file = URI.open('')
rep5 = Report.create!(
  description: 'Tem uma turma que está pegando do pé dos alunos da oitava série. Tem aluno que parou de vir para a escola por causa disso.',
  category_id: bullying.id,
  school_id: School.first.id,
  user_id: usr1.id
)
# rep.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
# file = URI.open('')

# reports
rep6 = Report.create!(
  user_id: usr3.id,
  school_id: School.first.id,
  category_id: livros.id,
  description: 'Os livros de matemática e biologia foram entregues apenas hoje, 3 meses depois do começo das aulas.'
)

file = URI.open('https://thumbs.dreamstime.com/b/computadores-empilhados-36262458.jpg')
rep7 = Report.create!(
  user_id: usr4.id,
  school_id: School.first.id,
  category_id: info.id,
  description: 'Entregaram computadores novos no laboratório há dois meses, mas eles ainda não foram ligasos, estão amontoados no almoxarifado. E as turmas do segundo e terceiro anos estão sem poder realizar pesquisas. Absurdo!'
)
rep7.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')


file = URI.open('https://s2.glbimg.com/V4Ag3B3_ORzEIjxxokf3owgvuNY=/0x0:1032x581/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_59edd422c0c84a879bd37670ae4f538a/internal_photos/bs/2018/3/V/ce5kvRT4id1Zb89zKtmA/indice.jpg')
rep8 = Report.create!(
  user_id: usr1.id,
  school_id: School.first.id,
  category_id: ventilacao.id,
  solved: true,
  description: '42 graus e ventiladores estragados. Quem consegue assistir aula desse jeito?'
)
rep8.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')


rep9 = Report.create!(
  user_id: usr4.id,
  school_id: School.first.id,
  category_id: seguranca.id,
  description: 'Segunda semana seguida que as aulas são suspensas porque vieram dizer na escola que tinham imposto toque de recolher no bairro.'
)


rep10 = Report.create!(
  user_id: usr10.id,
  school_id: School.first.id,
  category_id: seguranca.id,
  description: 'Na porta da escola, toda quinta-feira, tem dois carinhas que ficam vendendo do branco pra galera...'
)


file = URI.open('https://http2.mlstatic.com/D_NQ_NP_696447-MLB31419835019_072019-O.jpg')
rep11 = Report.create!(
  user_id: usr11.id,
  school_id: School.first.id,
  category_id: 'A quadra de esporte ficou lindona. Mas cadê as bolas e a rede para a gente jogar?'
)
rep11.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')


rep12 = Report.create!(
  user_id: usr3.id,
  school_id: School.first.id,
  category_id: outros.id,
  solved: false,
  description: 'Tem um funcionário da escola que fica dando em cima das meninas, tá incomodando elas todo dia.'
)

file = URI.open('http://2.bp.blogspot.com/-0c6fqkfcyhY/UHxpZDgWwuI/AAAAAAAAAf8/KOUv-CsX_9M/s320/sala_de_aula_vazia.jpg')
rep13 = Report.create!(
  user_id: usr4.id,
  school_id: School.first.id,
  category_id: aulas.id,
  description: 'O professor de Física do 2 ano, turma B, está faltando dia sim, dia também. Quem consegue aprender algo assim?'
)
rep13.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')


rep14 = Report.create!(
  user_id: usr2.id,
  school_id: School.first.id,
  category_id: outros.id,
  solved: true,
  description: 'Porque a escola não abre aos sábados e domingos para o pessoal poder usar a quadra?'
)


rep15 = Report.create!(
  user_id: usr11.id,
  school_id: School.first.id,
  category_id: transporte.id,
  description: 'Tem empresa que não aceita o passe-escolar, tem dia que não consigo vir para a escola.'
)


file = URI.open('https://negociao.com.br/noticias/wp-content/uploads/2020/06/Alunos-do-Ensino-Fundamental-Anos-Finais-em-atividades-1024x768.jpg')
rep16 = Report.create!(
  user_id: usr5.id,
  school_id: 53_000_234,
  category_id: aulas.id,
  description: 'Aula online precisa ser planejada também. Não dá para ficar só lendo os exercícios do livro-texto.'
)
rep16.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')



#file = URI.open('')
rep17 = Report.create!(
  user_id: usr6.id,
  school_id: 53_000_439,
  category_id: livros.id,
  description: 'Podiam comprar livros do Harry Potter, por favor?'
)
#rep17.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')


#file = URI.open('')
rep18 = Report.create!(
  user_id: usr7.id,
  school_id: 53_000_714,
  category_id: ventilacao.id,
  description: 'Ninguém acredita, mas nossa sala é muito gelada. Não bate sol em nenhuma hora do dia e as janelas está emperradas, não fecham. Fica uma corrente de ar gelado que está deixado todo mundo resfriado.'
)
#rep18.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')


#file = URI.open('')
rep19 = Report.create!(
  user_id: usr8.id,
  school_id: 53_000_846,
  category_id: transporte.id,
  description: 'A escola atrasou o envio das informações dos alunos e estou sem o passe-escolar.'
)
#rep19.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')


file = URI.open('https://www.diariodepetropolis.com.br/Conteudo/Dados_DRPTR14/acervo/1/201701/fotos/0700_x_0525_20170120115311_POBJ0.jpg')
rep20 = Report.create!(
  user_id: usr9.id,
  school_id: 53_000_854,
  category_id: ventilacao.id,
  description: 'A sala é toda mofada, não tem circulação de ar.'
)
rep20.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')



#file = URI.open('')
rep21 = Report.create!(
  user_id: usr5.id,
  school_id: 53_000_234,
  category_id: outros.id,
  description: 'Porque a escola não permitiu que a gente de inscrevesse na Olimpíada de Matemática?'
)
#rep21.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')



#file = URI.open('')
rep22 = Report.create!(
  user_id: usr6.id,
  school_id: 53_000_439,
  category_id: esportes.id,
  description: 'Porque a escola não faz um acordo com o clube das Paineiras para que a gente possa usar a piscina deles?'
)
#rep22.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')



#file = URI.open('')
rep23 = Report.create!(
  user_id: usr7.id,
  school_id: 53_000_714,
  category_id: outros.id,
  description: 'O Diretor proibiu que a professora desse aulas de educação sexual e reprodutiva.'
)
#rep23.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')



file = URI.open('https://catunoticias.com.br/wp-content/uploads/2018/08/denúncia-ônibus-6-685x430.jpg')
rep24 = Report.create!(
  user_id: usr8.id,
  school_id: 53_000_846,
  category_id: transporte.id,
  description: 'O ônibus escolar está quebrado há dois meses.'
)
rep24.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')



#file = URI.open('')
rep25 = Report.create!(
  user_id: usr9.id,
  school_id: 53_000_854,
  category_id: seguranca.id,
  description: 'Tem aluno do terceiro ano que vem armado para a escola. Berro.'
)
#rep25.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')



file = URI.open('https://todosegundo.com.br/uploads/public/geral/image/caixa%202.jpg')
rep26 = Report.create!(
  user_id: usr5.id,
  school_id: 53_000_234,
  category_id: manut.id,
  description: 'Muita fiação exposta no pátio da escola. Perigoso.'
)
rep26.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')



#file = URI.open('')
rep27 = Report.create!(
  user_id: usr6.id,
  school_id: 53_000_439,
  category_id: bullying.id,
  description: 'Queria saber como eu posso denunciar uma menina que está pegando no meu pé.'
)
#rep27.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')



#file = URI.open('')
rep28 = Report.create!(
  user_id: usr7.id,
  school_id: 53_000_714,
  category_id: info.id,
  description: 'Porque a escola não começa a oferecer aulas de programação? Tem um curso legal de uma tal de LeWagon que eu vi na internet…
'
)
#rep28.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')


file = URI.open('http://4.bp.blogspot.com/_kl93PPYi1LU/S7CoToKvN3I/AAAAAAAAAwM/6bEqEWD6PH4/s320/DSC09219.JPG')
rep29 = Report.create!(
  user_id: usr8.id,
  school_id: 53_000_846,
  category_id: merenda.id,
  description: 'Se eu tivesse separado todos os fios de cabelo que encontrei na comida nesse ano, já tinha feito uma peruca para meu avô.'
)
rep29.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')




file = URI.open('http://s2.glbimg.com/ModKMZUNB5uHwfzJQy0zuxXialM=/s.glbimg.com/jo/g1/f/original/2013/04/16/85d39c05a69e817851a523d2fedc7cee.jpg')
rep30 = Report.create!(
  user_id: usr9.id,
  school_id: 53_000_854,
  category_id: limpeza.id,
  description: 'Cheio de lugar com água acumulada. A dengue agradece!'
)
rep30.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')




file = URI.open('https://s2.glbimg.com/aMLnjd3a5THzfFYwYHzB9mg4_c4=/0x0:854x480/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_59edd422c0c84a879bd37670ae4f538a/internal_photos/bs/2018/6/U/HY8XdORMKGWKhIhcfPCA/escola-sem-manutencao-13-08.jpeg')
rep31 = Report.create!(
  user_id: usr5.id,
  school_id: 53_000_234,
  category_id: manut.id,
  description: 'As salas do segundo andar precisam urgentemente de reforma, inclusive as carteiras. Antes que aconteça um acidente e alguém se machuque.'
)
rep31.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')


#file = URI.open('')
rep32 = Report.create!(
  user_id: usr6.id,
  school_id: 53_000_439,
  category_id: merenda.id,
  description: 'Todo dia a merendeira diz que a empresa terceirizada entregou menos comida do que o combinado...'
)
#rep32.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')


#file = URI.open('')
rep33 = Report.create!(
  user_id: usr7.id,
  school_id: 53_000_714,
  category_id: limpeza.id,
  description: 'Ontem vi dois ratos andando na quadra da escola. Nojento.'
)
#rep33.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')


#file = URI.open('')
rep34 = Report.create!(
  user_id: usr8.id,
  school_id: 53_000_846,
  category_id: esportes.id,
  description: 'Porque as aulas de Educação Física só oferecem futebol?'
)
#rep34.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')


#file = URI.open('')
rep35 = Report.create!(
  user_id: usr9.id,
  school_id: 53_000_854,
  category_id: bullying.id,
  description: 'Eu vou abandonar a escola, já falei com dois professores, com a coordenadora pedagógica e com o Diretor e ninguém consegue fazer os alunos do terceiro ano pararem de me importunar.'
)
#rep35.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')


#file = URI.open('')
rep36 = Report.create!(
  user_id: usr5.id,
  school_id: 53_000_234,
  category_id: livros.id,
  description: 'Precisamos de livros de história brasileira contemporânea aqui.'
)
#rep36.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')


file = URI.open('https://odia.ig.com.br/_midias/jpg/2018/02/27/1000x530/1_28579814_155532251923493_1963990787_o-5965259.jpg')
rep37 = Report.create!(
  user_id: usr6.id,
  school_id: 53_000_439,
  category_id: manut.id,
  description: 'Quando chove, as salas de informática e o laboratório alagam. Muitas goteiras no teto, infiltração, mofo.'
)
rep37.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')


file = URI.open('https://cdn.pixabay.com/photo/2014/04/17/21/03/basketball-326809_960_720.jpg')
rep38 = Report.create!(
  user_id: usr7.id,
  school_id: 53_000_714,
  category_id: esportes.id,
  description: 'Nosso time de basquete não pode participar do campeonato das escolas porque a tabela da nossa quadra está quebrada.'
)
rep38.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')


#file = URI.open('')
rep39 = Report.create!(
  user_id: usr8.id,
  school_id: 53_000_846,
  category_id: merenda.id,
  description: 'Hoje o almoço da escola completou duas semanas sem nenhuma carne servida! Parabéns!'
)
#rep39.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')


file = URI.open('https://www.jornalcruzeiro.com.br/wp-content/uploads/2019/04/Mato-alto-em-escola.jpg')
rep40 = Report.create!(
  user_id: usr9.id,
  school_id: 53_000_854,
  category_id: manut.id,
  description: 'A escola parece uma floresta, de tanto mato que tem. Aqui não é a Amazônia, nem o Pantanal: podem dar um jeito de cortar esse matagal?'
)
rep40.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')



file = URI.open('http://www.jatai.go.gov.br/wp-content/uploads/2018/07/montagem-pc-nilo-lottici-1-696x522.jpg')
rep41 = Report.create!(
  user_id: usr5.id,
  school_id: 53_000_234,
  category_id: info.id,
  description: 'Estamos sem acesso à internet no laboratório. Computadores são máquinas de escrever nessa escola…'
)
rep41.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')



file = URI.open('https://leianoticias.com.br/wp-content/uploads/2019/04/sala-suja-cvilla.jpeg')
rep42 = Report.create!(
  user_id: usr6.id,
  school_id: 53_000_439,
  category_id: limpeza.id,
  description: 'A equipe de limpeza está vindo dia sim, dia não. Olha só como está minha sala!'
)
rep42.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')


#file = URI.open('')
rep43 = Report.create!(
  user_id: usr7.id,
  school_id: 53_000_714,
  category_id: aulas.id,
  description: 'Duas professores oferecem aulas de reforço, à tarde, para os alunos que têm dificuldades na matéria. Porque não fazer isso para todas as matérias?'
)
#rep43.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')


#file = URI.open('')
rep44 = Report.create!(
  user_id: usr8.id,
  school_id: 53_000_846,
  category_id: seguranca.id,
  description: 'O vigia da escola está doente e não veio ninguém para substitui-lo.'
)
#rep44.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')



#file = URI.open('')
rep45 = Report.create!(
  user_id: usr9.id,
  school_id: 53_000_854,
  category_id: merenda.id,
  description: 'Estão me achando com cara de hot dog? Quinto dia seguido que só servem salsicha no almoço.'
)
#rep45.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')


#file = URI.open('')
rep46 = Report.create!(
  user_id: usr5.id,
  school_id: 53_000_234,
  category_id: info.id,
  description: 'Vi que a Secretaria de Educação está implantando internet rápida nas escolas. A nossa ainda não recebeu. Quando ela chegará aqui?'
)
#rep46.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')


#file = URI.open('')
rep47 = Report.create!(
  user_id: usr6.id,
  school_id: 53_000_439,
  category_id: livros.id,
  description: 'A nossa biblioteca não recebe livros de poesia, nem de literatura, desde o ano passado. Alguém poderia ver como melhorar nosso acervo…'
)
#rep47.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')



file = URI.open('https://cdn1.rondoniagora.com/uploads/noticias/2015/12/02/2voipev7gx2cw.jpg')
rep48 = Report.create!(
  user_id: usr7.id,
  school_id: 53_000_714,
  category_id: limpeza.id,
  description: 'A cozinha da escola é uma nojeira.'
)
rep48.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')



#file = URI.open('')
rep49 = Report.create!(
  user_id: usr8.id,
  school_id: 53_000_846,
  category_id: ventilacao.id,
  description: 'Não dá para ter aula com janela aberta, por causa do barulho da rua, nem de janela fechada, por causa do calor. E ninguém conserta o ventilador de teto…'
)
#rep49.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')


#file = URI.open('')
rep50 = Report.create!(
  user_id: usr9.id,
  school_id: 53_000_854,
  category_id: transporte.id,
  description: 'A linha que parava perto da escola, a 1158, foi alterada. Quase todos os alunos foram prejudicados, agora temos que andar 5km para chegar no ponto mais próximo…'
)
#rep50.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')

