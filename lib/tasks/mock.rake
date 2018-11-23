# rake db:mock

namespace :db do
  task mock: :environment do

    puts "Cadastrando o Administrador padrão..."

    Admin.create!(
      name: "Administrador geral",
      email: "admin@admin.com",
      password: "123456",
      password_confirmation: "123456",
      role: 0
    )

    puts "Adminstrador cadastrado com sucesso!"

############################################################

    puts "Cadastrando o Membro padrão..."

    Member.create!(
      email: "member@member.com",
      password: "123456",
      password_confirmation: "123456"
    )

    puts "Membro cadastrado com sucesso!"

############################################################

    puts "Cadastrando as CATEGORIAS..."

    categories = ["Animais e acessórios",
                  "Esportes",
                  "Para a sua casa",
                  "Eletrônicos e celulares",
                  "Música e hobbies",
                  "Bebês e crianças",
                  "Moda e beleza",
                  "Veículos e barcos",
                  "Imóveis",
                  "Empregos e negócios"]

    categories.each do |category|
      Category.friendly.find_or_create_by(description: category)
    end

    puts "CATEGORIAS cadastradas com sucesso!"

############################################################

    puts "Cadastrando ADMINISTRADORES..."

    10.times do
      Admin.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        password: "123456",
        password_confirmation: "123456",
        role: [0,0,1,1,1].sample
      )
    end

    puts "ADMINISTRADORES cadastrados com sucesso!"

############################################################

    puts "Cadastrando MEMBROS..."

    99.times do
      Member.create!(
        email: Faker::Internet.email,
        password: "123456",
        password_confirmation: "123456"
      )
    end

    puts "MEMBROS cadastrados com sucesso!"

############################################################

    puts "Cadastrando ANÚNCIOS..."

    5.times do
      Ad.create!(
        title: Faker::Lorem.sentence([2,3,4,5].sample),
        description: LeroleroGenerator.paragraph([1,2,3].sample),
        description_md: Faker::Lorem.sentence([1,2,3].sample),
        description_short: Faker::Lorem.sentence([2,3].sample),
        member: Member.first,
        category: Category.all.sample,
        price: "#{Random.rand(500)},#{Random.rand(99)}"
        # picture: File.new(Rails.root.join('public', 'images-for-ads', "#{Random.rand(9)}.jpg"), 'r')
      )
    end

    100.times do
      Ad.create!(
        title: Faker::Lorem.sentence([2,3,4,5].sample),
        description: LeroleroGenerator.paragraph([1,2,3].sample),
        description_md: Faker::Lorem.sentence([1,2,3].sample),
        description_short: Faker::Lorem.sentence([2,3].sample),
        member: Member.all.sample,
        category: Category.all.sample,
        price: "#{Random.rand(500)},#{Random.rand(99)}"
        # picture: File.new(Rails.root.join('public', 'images-for-ads', "#{Random.rand(9)}.jpg"), 'r')
      )
    end

    puts "ANÚNCIOS cadastrados com sucesso!"

############################################################

  end
end
