FactoryBot.define do
  factory :user, :class => 'User' do
    name
    email
    password 'asdqwe123'
    password_confirmation 'asdqwe123'
  end
end