FactoryBot.define do
  factory :company do
    name "ESPN"
  end

  factory :job do
    title "Joe Black"
    description "So much fun!"
    level_of_interest 80
    city "Denver"
    company
    category
  end

  # factory :admin, class: Director do 
  #   name "Ilana"
  # end

end


# Factory bot- replace the line below with... 
# company = Company.create!(name: "ESPN")

# ...with this...
# company = create(:company)


# to make multiple object you can do:
#this will make three companies 
# company = create(:company, 3)

# If you want to make soething unique add the the sequence method
# factory :job do
#     title "Joe Black"
#     description "So much fun!"
#     level_of_interest 80
#     city "Denver"
#     sequence(:company) {|n| "Title #{n}" }
#     category
#   end
  