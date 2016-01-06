class ContactsController < ApplicationController

  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  def index
    @contacts = current_user.contacts
  end

  def new
    @contact       = Contact.new
    set_custom_fields
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.user_id = current_user.id
    respond_to do |format|
      if @contact.save
        format.html { redirect_to @contact, notice: 'Contact was successfully created.' }
      else
        set_custom_fields
        format.html { render :new }
      end
    end
  end

  def edit
    set_custom_fields
  end

  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to @contact, notice: 'Contact was successfully updated.' }
      else
        set_custom_fields
        format.html { render :edit }
      end
    end
  end

  def show
    set_custom_fields
  end

  def destroy
    @contact.destroy

    respond_to do |format|
      format.html { redirect_to contacts_url, notice: 'Contact was successfully destroyed.' }
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :user_id).tap do |whitelist|
      whitelist[:contact_fields] = params[:contact][:contact_fields]
    end
  end

 def set_contact
   @contact = current_user.contacts.find(params[:id])
 end

 def set_custom_fields
   @custom_fields =  current_user.custom_fields
 end

end
