class LinkDecorator < MyDecorator
  def short_url
    Rails.application.routes.url_helpers.api_short_link_url(slug: slug)
  end
end
