class LinkDecorator < MyDecorator
  def short_url
    Rails.application.routes.url_helpers.short_link_url(slug: slug)
  end

  def sanitized_link(request:)
    sanitize_url = url.strip.downcase.gsub(Constants::PROTOCOL_REGEX, '')
    "#{request.protocol}#{sanitize_url}"
  end
end
