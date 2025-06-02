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
Q# Suppression des données existantes
Favorite.destroy_all
Quote.destroy_all
Author.destroy_all
Category.destroy_all
User.destroy_all

# Création des catégories
categories = %w[Amour Humour Sagesse Littérature Motivation Vie].map do |name|
  Category.create!(name: name)
end

# Création des auteurs
authors = [
  "Victor Hugo",
  "Albert Einstein",
  "Oscar Wilde",
  "Confucius",
  "Simone de Beauvoir",
  "Friedrich Nietzsche"
].map { |name| Author.create!(name: name) }

# Création de citations
quotes_data = [
  # Amour
  ["L'amour est la seule chose qui grandit quand on la partage.", "Victor Hugo", "Amour"],
  ["On ne voit bien qu’avec le cœur. L’essentiel est invisible pour les yeux.", "Antoine de Saint-Exupéry", "Amour"],
  ["Aimer, ce n'est pas se regarder l'un l'autre, c'est regarder ensemble dans la même direction.", "Antoine de Saint-Exupéry", "Amour"],
  ["L'amour ne meurt jamais de mort naturelle.", "Anaïs Nin", "Amour"],
  ["Aimer, c'est agir.", "Victor Hugo", "Amour"],

  # Humour
  ["L’humour est la politesse du désespoir.", "Chris Marker", "Humour"],
  ["Je suis capable du meilleur et du pire. Mais dans le pire, c’est moi le meilleur.", "Coluche", "Humour"],
  ["Il vaut mieux mobiliser son intelligence sur des conneries que sa connerie sur des choses intelligentes.", "Pierre Desproges", "Humour"],
  ["Le travail d’équipe est essentiel. En cas d’erreur, ça permet d’accuser quelqu’un d’autre.", "Auteur inconnu", "Humour"],

  # Sagesse
  ["Le bonheur n'est pas quelque chose de prêt à l'emploi. Il vient de vos propres actions.", "Dalaï Lama", "Sagesse"],
  ["Connais-toi toi-même.", "Socrate", "Sagesse"],
  ["La connaissance parle, mais la sagesse écoute.", "Jimi Hendrix", "Sagesse"],
  ["Le sage ne dit pas ce qu’il sait, le fou ne sait pas ce qu’il dit.", "Proverbe turc", "Sagesse"],
  ["Il faut apprendre à rester serein au milieu de l’activité et à être vibrant de vie au repos.", "Gandhi", "Sagesse"],

  # Littérature
  ["La littérature, c’est la preuve que la vie ne suffit pas.", "Fernando Pessoa", "Littérature"],
  ["Lire, c’est boire et manger. L’esprit qui ne lit pas maigrit comme le corps qui ne mange pas.", "Victor Hugo", "Littérature"],
  ["Un livre est une fenêtre par laquelle on s’évade.", "Julien Green", "Littérature"],
  ["La lecture est une amitié.", "Marcel Proust", "Littérature"],
  ["La poésie est cette musique que tout homme porte en soi.", "William Shakespeare", "Littérature"],

  # Motivation
  ["Ils ne savaient pas que c’était impossible, alors ils l’ont fait.", "Mark Twain", "Motivation"],
  ["Agis comme s’il était impossible d’échouer.", "Winston Churchill", "Motivation"],
  ["La seule chose qu’on est sûr de ne pas réussir est celle qu’on ne tente pas.", "Paul-Émile Victor", "Motivation"],
  ["La réussite appartient à tout le monde. C’est au travail d’équipe qu’en revient le mérite.", "Franck Piccard", "Motivation"],
  ["Fais de ta vie un rêve, et d’un rêve, une réalité.", "Antoine de Saint-Exupéry", "Motivation"],

  # Vie
  ["La vie, c’est comme une bicyclette, il faut avancer pour ne pas perdre l’équilibre.", "Albert Einstein", "Vie"],
  ["La vie est un mystère qu’il faut vivre, et non un problème à résoudre.", "Gandhi", "Vie"],
  ["Vivre est la chose la plus rare. La plupart des gens se contentent d’exister.", "Oscar Wilde", "Vie"],
  ["Cueille le jour présent sans te soucier du lendemain.", "Horace", "Vie"],
  ["La vie commence là où commence ta zone de confort.", "Neale Donald Walsch", "Vie"]
]

quotes_data.each do |content, author_name, category_name|
  author = Author.find_or_create_by!(name: author_name)
  category = Category.find_by!(name: category_name)
  Quote.create!(
    content: content,
    author: author,
    category: category
  )
end

# Création d’un utilisateur test
User.create!(
  username: "testuser",
  email: "test@example.com",
  password: "password",
  password_confirmation: "password"
)

puts "✅ Seeds terminés avec succès."
