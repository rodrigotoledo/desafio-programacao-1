FactoryBot.define do
  sequence :email do |n|
    "admin#{n}@desafio_programacao.com.br"
  end
end

FactoryBot.define do
  factory :user, :class => 'User' do
    email
    password 'asdqwe123'
    password_confirmation 'asdqwe123'
  end
end