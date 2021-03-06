# frozen_string_literal: true

class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy, :summary]
  before_action :set_application, only: [:show, :new, :edit, :update, :create, :summary]

  # GET /contacts
  # GET /contacts.json
  def index
    # respond_to do |format|
    #   format.html
    #   format.csv { send_data @contacts.to_csv, filename: "requests-#{Date.today}.csv" }
    # end
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    @contact = @application.contacts.create(contact_params)
    @contact.user = current_user
    respond_to do |format|
      if @contact.save!
        format.html { redirect_to application_path(@application), notice: "Contact was successfully created." }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end

  end

  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to application_contact_path(@application, @contact), notice: "Contact was successfully created." }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  def summary

  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_contact
    @contact = Contact.find(params[:id])
  end

  def set_application
    @application = Application.find(params[:application_id])
  end

  def scope_access(contacts)
    if current_user.admin?
      contacts
    elsif current_user.district_admin?
      contacts
    elsif current_user.panchayat_admin?
      contacts.where(panchayat: current_user.panchayat)
    end
  end

  # Only allow a list of trusted parameters through.
  def contact_params
    params.require(:contact).permit(:name, :phone, :gender, :age, :house_name,
      :aarogya_setu_downloaded,
      :doctor_certificate,
      :doctor_name
    )
  end
end
