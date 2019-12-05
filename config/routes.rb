Rails.application.routes.draw do
  devise_for :service_providers
  # Routes for the Service provider resource:

  # READ
  get("/service_providers", { :controller => "service_providers", :action => "index" })
  get("/service_providers/:id_to_display", { :controller => "service_providers", :action => "show" })

  #------------------------------

  devise_for :clients
  # Routes for the Client resource:

  # READ
  get("/clients", { :controller => "clients", :action => "index" })
  get("/clients/:id_to_display", { :controller => "clients", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
