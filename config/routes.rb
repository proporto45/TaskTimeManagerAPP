Yanit::Application.routes.draw do
  devise_for :users

#  devise_for :admins

 # devise_for :users

  # Netzke routes
  netzke

  # You can access components like: http://localhost:3000/components/IssueGrid
  match 'components/:component' => 'components#index', :as => "components"

  # Root points to the Application component
  root :to => 'components#home'
end
