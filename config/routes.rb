Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
  #
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      post 'generate_rfc' => 'rfc_generator#generate_rfc'
    end
  end
end
