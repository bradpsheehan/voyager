Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'applicants#new'

  post '/applicants' => 'applicants#create'

  post '/applications' => 'job_applications#create'

  get '/application_portal' => 'application_portal#index'

end
