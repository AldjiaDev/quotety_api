class OgImagesController < ApplicationController
  layout false

  def show
    @title = params[:title] || "Quotety"
    @description = params[:description] || "Des mots qui marquent, des citations qui inspirent."

    html = render_to_string template: "og_images/show"
    grover = Grover.new(html, format: 'png', width: 1200, height: 630)
    image = grover.to_png

    send_data image, type: 'image/png', disposition: 'inline'
  end
end
