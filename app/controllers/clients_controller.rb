class ClientsController < ApplicationController
  def index
    @clients = Client.page(params[:page]).per(10)

    render("client_templates/index.html.erb")
  end

  def show
    @client = Client.find(params.fetch("id_to_display"))

    render("client_templates/show.html.erb")
  end
end
