class LinkDecorator < MyDecorator
  def short_url(request)
    "#{request.protocol}#{request.host_with_port}/#{slug}"
  end

  def sanitized_link(request)
    sanitize_url = url.strip.downcase.gsub(Constants::PROTOCOL_REGEX, '')
    "#{request.protocol}#{sanitize_url}"
  end
end
