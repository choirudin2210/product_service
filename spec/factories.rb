FactoryBot.define do
  
  factory :user do
    name {"Joe"}
    email {"joe@gmail.com"}
  end

  factory :product do
    name {"Joe"}
    price {1000}
    category {"random"}
  end

end