class VehiclesController < ApplicationController
  def new
    @application = Application.find(params[:application_id])
    @vehicle = @application.vehicles.build
  end

  def create
    @application = Application.find(params[:application_id])
    @vehicle = @application.vehicles.create(vehicle_params)

    if @vehicle.save!
      redirect_to @application, notice: "Vehicle was successfully created"
    end
  end

  def edit
    @application = Application.find(params[:application_id])
    @vehicle = @application.vehicles.find(params[:id])
  end

  def update
    @application = Application.find(params[:application_id])
    @vehicle = @application.vehicles.find(params[:id])

    respond_to do |format|
      if @vehicle.update(vehicle_params)
        format.html { redirect_to application_path(@application), notice: "House was successfully updated." }
      else
        format.html { render :edit, notice: @vehicle.errors.joins(', ') }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def vehicle_params
    params.require(:vehicle).permit(:number_plate, :seats, :name_of_driver, :phone, :mode)
  end
end
