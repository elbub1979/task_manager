FactoryBot.define do
  sequence :string, aliases: [:first_name, :last_name, :password, :name, :avatar, :description, :state] do |n|
    "string#{n}"
  end

  sequence(:email) { |n| "ego#{n}@nafig.net" }

  sequence(:expired_at) { |n| Date.today + n }
end
