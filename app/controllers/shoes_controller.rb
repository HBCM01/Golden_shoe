class ShoesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :create]

  def index
    if params[:brand]
    @shoes = Shoe.where(:brand => params[:brand])
    elsif params[:category]
      @shoes = Shoe.where(:category => params[:category])
    elsif params[:query].present?
      @shoes = Shoe.shoe_search(params[:query])
    else
      @shoes = Shoe.includes(:user)
    end
  end

  def new
    @shoe = Shoe.new
  end

  def create
    @shoe = Shoe.new(shoe_params)
    @shoe.user = current_user
    if @shoe.user.admin == true
      @shoe.save
      redirect_to shoes_path
    else
      flash[:alert] = @shoe.errors.messages
      render :new
    end
  end

  def show
    @shoe = Shoe.find(params[:id])
  end

  def hovercard
    @shoe = Shoe.find(params[:id])

    render layout: false
  end

  private

  def shoe_params
    params.require(:shoe).permit(:name, :stock_level, :price, :material,
                                 :colour, :category, :department, :brand,
                                 :size, :description, photos: [])
  end
end
