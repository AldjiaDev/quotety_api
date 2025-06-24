SitemapGenerator::Sitemap.default_host = "https://quotety.aldjia.dev"

SitemapGenerator::Sitemap.create do
  # Pages principales
  add root_path, changefreq: 'daily', priority: 1.0
  add quotes_path, changefreq: 'daily', priority: 0.9
  add authors_path, changefreq: 'weekly', priority: 0.8
  add about_path, changefreq: 'monthly', priority: 0.5

  # Pages catégories (si tu as une action `quotes_web#category`)
  Category.find_each do |category|
    add category_quotes_path(category: category.slug), changefreq: 'weekly', priority: 0.7
  end

  # Pages de citations individuelles
  Quote.find_each do |quote|
    add quote_path(quote), lastmod: quote.updated_at, changefreq: 'monthly', priority: 0.6
  end

  # Pages d’auteurs
  Author.find_each do |author|
    add author_quotes_path(author), lastmod: author.updated_at, changefreq: 'monthly', priority: 0.6
  end
end
