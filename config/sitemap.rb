SitemapGenerator::Sitemap.default_host = "https://quotety.aldjia.dev"

SitemapGenerator::Sitemap.create do
  add root_path, changefreq: 'daily'
  add quotes_path
  add authors_path
  add about_path

  Quote.find_each do |quote|
    add quote_path(quote), lastmod: quote.updated_at
  end
end
