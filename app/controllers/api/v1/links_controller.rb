module Api
  module V1
    class LinksController < Api::V1::ApiController
      def create
        link = GenerateLinkService.new(params: link_params).call
        return render json: { short_url: link.short_url, url: link.url }, status: :created if @link.valid?

        render json: { error: I18n.t('url.messages.unprocessable') }, status: :unprocessable_entity unless @link.valid?
      end

      def redirect_to_url
        @link = FileManager.new.load.find { |link| link.slug == params[:slug] }
        redirect_to @link.url
      end

      private

      def link_params
        params.permit(:url)
      end
    end
  end
end
