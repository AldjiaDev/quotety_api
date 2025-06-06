module MetaHelper
  def meta_title(title = nil)
    base_title = "Quotety - Des mots qui marquent"
    title.present? ? "#{title} — Quotety" : base_title
  end

  def meta_description(description = nil)
    description.presence || "Quotety vous propose les meilleures citations pour inspirer votre quotidien."
  end

  def canonical_url
    request.base_url + request.fullpath
  end

  def og_image_url(title = "Citations inspirantes")
    "/api/og?title=#{CGI.escape(title)}"
  end
end
