module Api
  module V1
    class LinksController < Api::V1::ApiController
      def create
        link = GenerateLinkService.new(params: link_params, request: request).call
        if link.valid?
          render json: { short_url: link.short_url(request), url: link.url }, status: :created
        else
          render json: { error: I18n.t('url.messages.unprocessable') }, status: :unprocessable_entity
        end
      end

      def redirect_to_url
        @link = LoadLinkService.new(params: params[:slug]).call
        redirect_to @link.sanitized_link(request)
      end

      private

      def link_params
        params.permit(:url)
      end
    end
  end
end
