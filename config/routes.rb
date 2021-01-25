Rails.application.routes.draw do
  get ':slug', to: 'api/v1/links#redirect_to_url', as: :short_link
  namespace :api, defaults: { format: :json } do
    scope module: :v1, constraints: Constraints::ApiVersionConstraint.new(version: 'v1', default: true) do
      resource :link, only: %i[create]
    end
  end
end
