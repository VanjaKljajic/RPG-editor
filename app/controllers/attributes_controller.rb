class AttributesController < ApplicationController
  before_action :set_attribute, only: [:show, :edit, :update, :destroy]

  def index
    attribute = Type.find(params[:type_id])
    @attribute_type_name = attribute.name
    @attribute_type_id = attribute.id

    @attributes = Attribute.where(:type_id => params[:type_id])
    respond_to do |format|
      format.js
    end
  end

  def show
  end

  def new
    @attribute = Attribute.new
    attribute = Type.find(params[:type_id])

    @attribute_type_id = attribute.id
    respond_to do |format|
      format.js
    end
  end

  def edit
  end

  def create

    attribute_params[:type_id] = params[:type_id]
    @attribute = Attribute.new(attribute_params)
    respond_to do |format|
      if @attribute.save
        puts "kreiranjeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee2222222222222222222222222222e"
        format.js
        format.html { redirect_to @attribute, notice: 'Attribute was successfully created.' }
        format.json { render :show, status: :created, location: @attribute }
      else
        format.html { render :new }
        format.json { render json: @attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @attribute.update(attribute_params)
        format.html { redirect_to @attribute, notice: 'Attribute was successfully updated.' }
        format.json { render :show, status: :ok, location: @attribute }
      else
        format.html { render :edit }
        format.json { render json: @attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @attribute.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to attributes_url, notice: 'Attribute was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attribute
      @attribute = Attribute.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def attribute_params
      params.require(:attribute).permit(:name, :numerical, :value, :type_id, :icon)
    end


end
