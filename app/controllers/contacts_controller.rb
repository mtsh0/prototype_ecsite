class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
  end

  def index
    @contacts = Contact.all.order_reverse
  end

  def show
    @contact = Contact.find_by(params[:id])
  end

  private

  def contact_params
    params.require(:contact).permit(:user_id, :type, :title, :description, :image)
  end
end
