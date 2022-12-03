# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
band_1 = Band.create!(name: "Tragedy", year_formed: 2000, active: false)
band_2 = Band.create!(name: "Nine Shocks Terror", year_formed: 1996, active: false)
band_3 = Band.create!(name: "Pink Turns Blue", year_formed: 1985, active: true)

record_1 = Record.create!(title: "S/T", format_size: 12, release_year: 2000, color_vinyl: true)
record_2 = Record.create!(title: "Can We Call This Life?", format_size: 7, release_year: 2001, color_vinyl: false)
record_3 = Record.create!(title: "Vengeance", format_size: 12, release_year: 2000, color_vinyl: false)
record_4 = Record.create!(title: "Mobile Terror Unit", format_size: 7, release_year: 1996, color_vinyl: false)
record_5 = Record.create!(title: "Zen and the Art...", format_size: 12, release_year: 1996, color_vinyl: true)
record_6 = Record.create!(title: "If Two Worlds Kiss", format_size: 12, release_year: 1987, color_vinyl: true)
record_7 = Record.create!(title: "Meta", format_size: 12, release_year: 1988, color_vinyl: false)