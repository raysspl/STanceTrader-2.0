class PartsController < ApplicationController
  before_action :set_part, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @parts = Part.all.order("created_at DESC")
  end

  def show
  end

  def new
    @part = current_user.parts.build
  end

  def edit
  end

  def create
    @part = current_user.parts.build(part_params)
    if @part.save
      redirect_to @part, notice: 'Part was successfully created.' 
    else
     render action: 'new' 
    end
  end

  def update
    if @part.update(part_params)
      redirect_to @part, notice: 'Part was successfully updated.' 
    else
      render action: 'edit' 
    end
  end

  def destroy
    @part.destroy
    redirect_to parts_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_part
      @part = Part.find(params[:id])
    end

    def correct_user
      @part = current_user.parts.find_by(id: params[:id])
      redirect_to parts_path, notice: "Yooo, you not allowed to do that son!" if @part.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def part_params
      params.require(:part).permit(:description, :image)
    end
end
