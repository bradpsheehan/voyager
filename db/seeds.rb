# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

employer = Employer.where(name: "HVAC Systems").first_or_create(logo_url: nil, name: "HVAC Systems", account_attributes: {email: 'bradpsheehan@gmail.com', password: 'Test123'})

Job.where(title: "HVAC Tech").first_or_create(title: "HVAC Tech", description: "We are looking for reliable, professional, motivat...", qualifications: ["Motivated individual", "Must be well groomed and have a neat appearance", "Friendly and personable", "Valid drivers license & a clean driving record", "Must agree to a background check and drug test", "If an apprentice must be enrolled in school to forward your career"], experiences: ["Overall years of work experience", "HVAC", "Refrigeration", "Mechanical"], benefits: ["Competitive Wages", "Paid vacations and 9 holidays", "Medical, dental benefits", "Short Term/Long Term Disability and others available", "401(k) Plan with available company match", "Great working environment"], created_at: "2018-05-29 00:37:16", updated_at: "2018-05-29 01:10:03", employer_id: employer.id)
