FactoryBot.define do
  sequence :string, aliases: [:first_name, :last_name, :password] do |n|
    "string#{n}"
  end

  sequence(:email) { |n| "ego#{n}@nafig.net" }

  sequence(:avatar) { |n| "morda#{n}.jpg" }

  sequence :type, %i[Developer Admin Manager].cycle

  sequence(:name) { |n| "Task#{n}" }

  sequence(:expired_at) { |n| "#{Date.today + n}" }
end
