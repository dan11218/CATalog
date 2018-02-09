class CatsController < ApplicationController

  def new
    @cat = Cat.new
  end

  def index
    @cats = Cat.all.order('name')
  end

  def edit
    @cat = Cat.find(params[:id])
  end

  def show
    @cat = Cat.find(params[:id])
  end

  def create
    @cat = Cat.new(cat_params)
    if @cat.save
      redirect_to cat_path(@cat)
    else
      render :new
    end
  end

  def update
    cat = Cat.find(params[:id])
    if cat.update(cat_params)
      redirect_to cat
    else
      render 'edit'
    end
  end

  def destroy
    Cat.find(params[:id]).destroy

    redirect_to cats_path
  end

end

private
  def cat_params
    params.require(:cat).permit(:name, :breed)
  end
