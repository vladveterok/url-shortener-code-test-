class Link
  include ActiveModel::Model

  attr_accessor :url, :slug

  validates! :url, presence: true, length: {
    minimum: 3,
    maximum: 2048,
    too_short: 'Too short!',
    too_long: 'Too long!'
  }
end
