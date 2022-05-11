class ContactsController < ApplicationController
  def index
    render json: Contact.all
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.notify(@contact).deliver_now
      render json: { "message": "We will contact you soon" }
    else
      render json: @contact.errors.messages
    end
  end

  private

  def contact_params
    params.permit(:name, :phone, :email, :company, :question, :files)
  end
end