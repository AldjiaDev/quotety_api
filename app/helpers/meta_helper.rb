module MetaHelper
  def meta_title(title = nil)
    base = "Quotety – Des mots qui marquent"

    if title.present?
      "#{title} sur Quotety – Des mots qui marquent"
    else
      base
    end
  end

  def meta_description(description = nil)
    description.presence || "Quotety vous propose les meilleures citations pour inspirer votre quotidien."
  end

  def canonical_url
    request.original_url.split("?").first # Nettoie les paramètres inutiles
  end

  def og_image_url(title = "Citations inspirantes")
    "/api/og?title=#{CGI.escape(title)}"
  end
end
