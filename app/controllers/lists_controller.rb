class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def show
    #  @bookmark = Bookmark.new
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to root_path, notice: 'List was successfully created.'
    else
      render :new
    end
  end



  def update
    @list.update(list_params)
      redirect_to @list, notice: 'List was successfully updated.'
  end


  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
