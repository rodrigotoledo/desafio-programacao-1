FactoryBot.define do
  factory :import_purchase_line do
    import_purchase
    purchaser_name "João Silva"
    item_description "R$10 off R$20 of food"
    item_price 10
    purchase_count 2
    merchant_address "Fake St"
    merchant_name "Bob's Pizza"
    result "initialized"
  end
end
