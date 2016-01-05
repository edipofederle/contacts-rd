class CustomFieldsController < ApplicationController

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

  private
  def custom_field_params
    params.require(:custom_field).permit(:name, :field_type, :combo_options)
  end

end
