Rails.application.routes.draw do
  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  delete "/logout" => "sessions#destroy"

  namespace :client do
    get '/students/:id' => 'students#show'
    get '/students/:id/edit' => 'students#edit'
    patch 'students/:id' => 'students#update'

    get '/experiences/new' => 'experiences#new'
    post '/experiences' => 'experiences#create'
    # get '/experiences/:id/edit' => 'experiences#edit'
    patch '/experiences/:id' => 'experiences#update'
    delete '/experiences/:id' => 'experiences#destroy'

    get '/educations/new' => 'educations#new'
    post '/educations' => 'educations#create'
    # get '/educations/:id/edit' => 'educations#edit'
    patch '/educations/:id' => 'educations#update'
    delete '/educations/:id' => 'educations#destroy'

    get '/skills/new' => 'skills#new'
    post '/skills' => 'skills#create'
    # get '/skills/:id/edit' => 'skills#edit'
    patch '/skills/:id' => 'skills#update'
    delete '/skills/:id' => 'skills#destroy'
  end
end
