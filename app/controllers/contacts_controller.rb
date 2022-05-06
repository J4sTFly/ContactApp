class ContactsController < ApplicationController

  protect_from_forgery

  def index
    render json: Contact.all, status: :ok
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.notify(@contact).deliver_now
      render json: { "message": "We will contact you soon" }, status: :created
    else
      render json: @contact.errors.messages
    end
  end

  def show
    render Contact.find_by(id: params[:id])
  end

  def update
    @contact = Contact.find_by(id: params[:id])
    @contact.update(contact_params)
    if @contact.save
      render json: { "message": "Updated successfully" }, status: :ok
    else
      render @contact.errors.messages
    end
  end

  def destroy
    if Contact.delete(params[:id])
      render json: { "message": "Removed successfully" }, status: :ok
    else
      render json: Contact.errors.messages
    end
  end

  private
  def contact_params
    params.permit(:name, :phone, :email, :company, :question, :files)
  end
  # name:params[:name], email: params[:email], phone: params[:phone], company: params[:company], files: params[:files]
end