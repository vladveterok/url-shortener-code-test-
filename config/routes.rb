Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    scope module: :v1, constraints: Constraints::ApiVersionConstraint.new(version: 'v1', default: true) do
      get 's/:slug', to: 'links#redirect_to_url', as: :short_link
      resource :link, only: %i[create]
    end
  end
end
