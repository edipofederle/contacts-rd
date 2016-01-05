class CustomFieldsController < ApplicationController

  before_action :set_custom_field, only: [:destroy]

  def index
    @fields = CustomField.all
  end


  def new
    @custom_field = CustomField.new
  end

  def create
    @custom_field = CustomField.new(custom_field_params)
    
    respond_to do |format|
      if @custom_field.save
        format.html { redirect_to :custom_fields, notice: 'Custom Field was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    @custom_field.remove

    respond_to do |format|
      format.html { redirect_to contacts_url, notice: 'Contact was successfully destroyed.' }
    end
  end

  private
  def custom_field_params
    params.require(:custom_field).permit(:name, :field_type, :combo_options)
  end

 def set_custom_field
   @custom_field = CustomField.find(params[:id])
 end

end
