Rails.application.routes.draw do
  scope "(:locale)", locale: /ja|en/ do
    resources :books
  end

  get '/:locale' => 'books#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
