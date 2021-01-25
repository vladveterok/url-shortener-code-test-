class LoadLinkService
  def initialize(params:)
    @params = params
  end

  def call
    LinkDecorator.decorate(link_required)
  end

  private

  def link_required
    FileManager.new.load.find { |link| link.slug == @params }
  end
end
