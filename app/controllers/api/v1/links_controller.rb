module Api
  module V1
    class LinksController < Api::V1::ApiController
      def create
        @link = Link.new(link_params)
        return render json: { error: 'Some error' }, status: :unprocessable_entity unless @link.valid?

        @link.slug = rand(36**8).to_s(36)
        render json: @link.short_url, status: :created
      end

      def redirect_to_url; end

      private

      def link_params
        params.permit(:url)
      end
    end
  end
end
