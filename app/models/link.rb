class Link
  include ActiveModel::Model

  attr_accessor :url, :slug

  validates! :url, presence: true, length: {
    minimum: Constants::URL_LENGTH.min,
    maximum: Constants::URL_LENGTH.max,
    too_short: I18n.t('url.messages.too_short'),
    too_long: I18n.t('url.messages.too_long')
  }

  def short_url
    Rails.application.routes.url_helpers.api_short_link_url(slug: slug)
  end
end
