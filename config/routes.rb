Rails.application.routes.draw do
  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  delete "/logout" => "sessions#destroy"

  namespace :client do
    get '/students/:id' => 'students#show'
    get '/students/:id/edit' => 'students#edit'
    patch 'students/:id' => 'students#update'

    post '/experiences' => 'experiences#create'
    patch '/experiences/:id' => 'experiences#update'
    delete '/experiences/:id' => 'experiences#destroy'

    post '/educations' => 'educations#create'
    patch '/educations/:id' => 'educations#update'
    delete '/educations/:id' => 'educations#destroy'

    post '/skills' => 'skills#create'
    patch '/skills/:id' => 'skills#update'
    delete '/skills/:id' => 'skills#destroy'
  end
end
