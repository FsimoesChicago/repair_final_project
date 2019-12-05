class RepairsController < ApplicationController
  before_action :current_client_must_be_repair_client, :only => [:edit_form, :update_row, :destroy_row]

  def current_client_must_be_repair_client
    repair = Repair.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_client == repair.client
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @repairs = Repair.page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@repairs.where.not(:location_latitude => nil)) do |repair, marker|
      marker.lat repair.location_latitude
      marker.lng repair.location_longitude
      marker.infowindow "<h5><a href='/repairs/#{repair.id}'>#{repair.created_at}</a></h5><small>#{repair.location_formatted_address}</small>"
    end

    render("repair_templates/index.html.erb")
  end

  def show
    @repair = Repair.find(params.fetch("id_to_display"))

    render("repair_templates/show.html.erb")
  end

  def new_form
    @repair = Repair.new

    render("repair_templates/new_form.html.erb")
  end

  def create_row
    @repair = Repair.new

    @repair.location = params.fetch("location")
    @repair.repair_type = params.fetch("repair_type")
    @repair.price = params.fetch("price")
    @repair.client_id = params.fetch("client_id")
    @repair.service_provider_id = params.fetch("service_provider_id")
    @repair.car_type = params.fetch("car_type")

    if @repair.valid?
      @repair.save

      redirect_back(:fallback_location => "/repairs", :notice => "Repair created successfully.")
    else
      render("repair_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @repair = Repair.find(params.fetch("prefill_with_id"))

    render("repair_templates/edit_form.html.erb")
  end

  def update_row
    @repair = Repair.find(params.fetch("id_to_modify"))

    @repair.location = params.fetch("location")
    @repair.repair_type = params.fetch("repair_type")
    @repair.price = params.fetch("price")
    
    @repair.service_provider_id = params.fetch("service_provider_id")
    @repair.car_type = params.fetch("car_type")

    if @repair.valid?
      @repair.save

      redirect_to("/repairs/#{@repair.id}", :notice => "Repair updated successfully.")
    else
      render("repair_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_client
    @repair = Repair.find(params.fetch("id_to_remove"))

    @repair.destroy

    redirect_to("/clients/#{@repair.client_id}", notice: "Repair deleted successfully.")
  end

  def destroy_row_from_service_provider
    @repair = Repair.find(params.fetch("id_to_remove"))

    @repair.destroy

    redirect_to("/service_providers/#{@repair.service_provider_id}", notice: "Repair deleted successfully.")
  end

  def destroy_row
    @repair = Repair.find(params.fetch("id_to_remove"))

    @repair.destroy

    redirect_to("/repairs", :notice => "Repair deleted successfully.")
  end
end
