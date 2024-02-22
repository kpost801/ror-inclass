class FlowersController < ApplicationController
  before_action :set_flower, only: %i[ show edit update destroy ]

  # GET /flowers
  def index
    @flowers = Flower.all
  end

  # GET /flowers/1
  def show
  end

  # GET /flowers/new
  def new
    @flower = Flower.new
  end

  # GET /flowers/1/edit
  def edit
  end

  # POST /flowers
  def create
    @flower = Flower.new(flower_params)

    if @flower.save
      redirect_to @flower, notice: "Flower was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /flowers/1
  def update
    if @flower.update(flower_params)
      redirect_to @flower, notice: "Flower was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /flowers/1
  def destroy
    @flower.destroy!
    redirect_to flowers_url, notice: "Flower was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flower
      @flower = Flower.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def flower_params
      params.require(:flower).permit(:sepal_length, :sepal_width, :petal_length, :petal_width)
    end
end
