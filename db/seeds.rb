Company.destroy_all
Job.destroy_all

COMPANIES = ["Pet Spa", "PETA", "Columbus Zoo", "Pet Walk", "CarPet Repair", "Goat Yoga", "Doggy Daycare", "Pets'R'Us", "Pet Savvy", "Dog Fit"]
JOBS = ["Pet Hair Stylist", "Zoologist", "Zookeeper", "Pet Spa Manger", "Dog Whisper", "Goat Yoga Instructor", "Trainer", "Dog Purchase Consultant", "Pet Clothing Designer", "Dog Walker"]
CITIES = ["Seattle", "Denver", "Portland", "Indianapolis", "Madison", "Orlando", "San Diego", "Austin", "Las Vegas", "Little Rock", "Boise", "Eugene", "Oakland"]
CATEGORIES = ["Animal Care", "Research Conservation", "Education", "Management", "Household Services", "Therapy", "Administration", "Engineering", "Marketing", "Finance"]

COMPANIES.each_with_index do |name, i|
  company = Company.create!(name: name)
  category = Category.create!(title: CATEGORIES[i])
  puts "Created #{company.name}"
  10.times do |num|
    company.jobs.create!(title: JOBS[num], description: "What a great position!", level_of_interest: num + rand(100), city: CITIES.sample, category: category)
    puts "  Created #{company.jobs[num].title}"
  end
end
