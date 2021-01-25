class GenerateLinkService
  def initialize(params:, request:)
    @params = params
    @request = request
    @link = LinkDecorator.decorate(Link.new(params))
  end

  def call
    generate_slug
    save_link
    @link
  end

  private

  def generate_slug
    @link.slug = rand(36**8).to_s(36)
  end

  def save_link
    FileManager.new.save(@link)
  end
end
