require "#{Rails.root}/spec/support/seed_factory_helpers"

(1..5).each do |n|
  link = FactoryGirl::build(:link)
  create_seed(Link, n, link)
end

