namespace :dev do
  desc 'Configura o ambiente de desenvolvimento'
  task setup: :environment do
    types = %w[Amigo Comercial Conhecido]
    types.each do |type|
      Type.create!(
        description: type
      )
    end
    100.times do |_c|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 65.years.ago, to: 18.years.ago),
        type_id: Type.all.sample.id
      )
    end
  end
end
