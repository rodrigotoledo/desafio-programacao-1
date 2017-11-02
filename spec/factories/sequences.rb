FactoryBot.define do
  sequence :email do |n|
    "admin#{n}@desafio_programacao.com.br"
  end
  sequence :name do |n|
    "Usuario #{n}"
  end
end