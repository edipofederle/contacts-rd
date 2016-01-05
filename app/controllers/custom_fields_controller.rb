class CustomFieldsController < ApplicationController

  before_action :set_custom_field, only: [:destroy]

  def index
    @fields = current_user.custom_fields
  end

  def new
    @custom_field = CustomField.new
  end

  def create
    @custom_field         = CustomField.new(custom_field_params)
    @custom_field.user_id = current_user.id

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
    params.require(:custom_field).permit(:name, :field_type, :combo_options, :user_id)
  end

 def set_custom_field
   @custom_field = current_user.custom_fields.find(params[:id])
 end

end
