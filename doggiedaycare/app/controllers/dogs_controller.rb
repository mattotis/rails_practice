class DogsController < ApplicationController
  def index
    @dogs = Dog.all
  end

  def show
    @dog = Dog.find(params[:id])
  end

  def new
    @dog = Dog.new
  end

  def create
    @dog = Dog.new(dog_params)
    if @dog.save
      redirect_to dogs_url, alert: "Dog saved!"
    else
      flash.now[:notice] = "Couldn't save dog :["
      render :new
    end
  end

  def edit
    @dog = Dog.find(params[:id])
  end

  def update
    @dog = Dog.find(params[:id])
    if @dog.update(dog_params)
      flash[:alert] = 'Dog updated!'
        redirect_to @dog
    else
        flash.now[:notice] = "Could not update your dog."
        render :edit
    end
  end

  def destroy
    @dog = Dog.find(params[:id])
    if @dog.destroy
      redirect_to dogs_url, alert: "Successfully deleted!"
    else
      redirect_to dogs_url, notice: "Could not delete dog."
    end
  end

private

  def dog_params
    params.require(:dog).permit(:name, :breed, :age, :owner_id)
  end
end