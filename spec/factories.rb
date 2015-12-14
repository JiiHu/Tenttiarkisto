FactoryGirl.define do
  factory :user do
    organization "penis"
    email "asd@asd.asd"
    password "salasana"
    password_confirmation "salasana"
  end

  factory :course do
    name "Laskennan mallit"
    identifier "lama"
  end

  factory :exam do
    language "Finnish"
    description "välikoe 1"
    author "lama ope"
  end

  factory :subject do
    name "tkt"
  end
end