Rails.application.routes.draw do
  resource :link, only: %i[new create]
end
