class ServiceProvidersController < ApplicationController
  def index
    @service_providers = ServiceProvider.all

    render("service_provider_templates/index.html.erb")
  end

  def show
    @service_provider = ServiceProvider.find(params.fetch("id_to_display"))

    render("service_provider_templates/show.html.erb")
  end
end
