class RepairsController < ApplicationController
  def index
    @repairs = Repair.all

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
    @repair.client_id = params.fetch("client_id")
    @repair.service_provider_id = params.fetch("service_provider_id")
    @repair.car_type = params.fetch("car_type")

    if @repair.valid?
      @repair.save

      redirect_to("/repairs/#{@repair.id}", :notice => "Repair updated successfully.")
    else
      render("repair_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @repair = Repair.find(params.fetch("id_to_remove"))

    @repair.destroy

    redirect_to("/repairs", :notice => "Repair deleted successfully.")
  end
end
