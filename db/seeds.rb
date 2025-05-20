# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Vider les anciennes données
Quote.destroy_all
Author.destroy_all
Category.destroy_all

# AUTEURS
einstein = Author.create!(
  name: "Albert Einstein",
  slug: "albert-einstein",
  bio: "Physicien théoricien connu pour sa théorie de la relativité."
)

mandela = Author.create!(
  name: "Nelson Mandela",
  slug: "nelson-mandela",
  bio: "Homme d'État sud-africain, militant contre l'apartheid."
)

marie_curie = Author.create!(
  name: "Marie Curie",
  slug: "marie-curie",
  bio: "Scientifique pionnière dans l'étude de la radioactivité."
)

# CATÉGORIES
life = Category.create!(name: "Vie", slug: "vie")
education = Category.create!(name: "Éducation", slug: "education")
perseverance = Category.create!(name: "Persévérance", slug: "perseverance")

# CITATIONS
Quote.create!(
  content: "La vie, c'est comme une bicyclette, il faut avancer pour ne pas perdre l'équilibre.",
  author: einstein,
  category: life
)

Quote.create!(
  content: "L'éducation est l'arme la plus puissante pour changer le monde.",
  author: mandela,
  category: education
)

Quote.create!(
  content: "Dans la vie, rien n’est à craindre, tout est à comprendre.",
  author: marie_curie,
  category: life
)

Quote.create!(
  content: "Cela semble toujours impossible jusqu’à ce que ce soit fait.",
  author: mandela,
  category: perseverance
)
