class ContactsController < ApplicationController

  before_action :set_contact, only: [:show, :edit, :update]

  def index
    @contacts = Contact.all
  end

  def new
    @contact       = Contact.new
    @custom_fields =  CustomField.all.select(:name, :field_type)
  end

  def create
    @contact = Contact.new(contact_params)
    
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
    @custom_fields =  CustomField.all.select(:name, :field_type)
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
    @contact = Contact.find(params[:id])
    @custom_fields =  CustomField.where(contact_id: @contact.id)
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email).tap do |whitelist|
      whitelist[:contact_fields] = params[:contact][:contact_fields]
    end
  end

 def set_contact
   @contact = Contact.find(params[:id])
 end

 def set_custom_fields
   @custom_fields =  CustomField.all.select(:name, :field_type)
 end

end
