Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "repairs#index"
  # Routes for the Repair resource:

  # CREATE
  get("/repairs/new", { :controller => "repairs", :action => "new_form" })
  post("/create_repair", { :controller => "repairs", :action => "create_row" })

  # READ
  get("/repairs", { :controller => "repairs", :action => "index" })
  get("/repairs/:id_to_display", { :controller => "repairs", :action => "show" })

  # UPDATE
  get("/repairs/:prefill_with_id/edit", { :controller => "repairs", :action => "edit_form" })
  post("/update_repair/:id_to_modify", { :controller => "repairs", :action => "update_row" })

  # DELETE
  get("/delete_repair/:id_to_remove", { :controller => "repairs", :action => "destroy_row" })

  #------------------------------

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
