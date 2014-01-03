class PartsController < ApplicationController
  before_action :set_part, only: [:show, :edit, :update, :destroy]

  def index
    @parts = Part.all
  end

  def show
  end

  def new
    @part = Part.new
  end

  def edit
  end

  def create
    @part = Part.new(part_params)
      if @part.save
        redirect_to @part, notice: 'Part was successfully created.' 
      else
        render action: 'new' 
      end
    end

    def update
      if @part.update(part_params)
        redirect_to @part, notice: 'Part was successfully updated.' }
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

    # Never trust parameters from the scary internet, only allow the white list through.
    def part_params
      params.require(:part).permit(:description)
    end
end
