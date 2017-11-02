FactoryBot.define do
  factory :import_purchase do
    association :user, :factory => :user
    status :initialized
    import_file { File.new("#{Rails.root}/spec/factories/example_input.tab") }
  end
end
