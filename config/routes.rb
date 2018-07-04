Rails.application.routes.draw do
  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  delete "/logout" => "sessions#destroy"

  namespace :client do
    get '/resumes/:id' => 'resumes#show'
    get '/resumes/:id/edit' => 'resumes#edit'
    patch 'resumes/:id' => 'resumes#update'
  end
end
