class LinksController < ApplicationController
  before_action :ensure_signed_in

  def index
    @links = Link.all
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    @link.user_id = current_user.id
    if @link.save
      redirect_to @link
    else
      flash.now[:errors] = @link.errors.full_messages
      render :new
    end
  end

  def show
    @link = Link.find(params[:id])
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    if @link
      if @link.update_attributes(link_params)
        redirect_to @link
      else
      flash.now[:errors] = @link.errors.full_messages
      render :edit
      end
    else
      flash.now[:errors] = ["Update failed"]
      render :edit
    end
  end

  private
  def link_params
    params.require(:link).permit(:title, :url)
  end
end
