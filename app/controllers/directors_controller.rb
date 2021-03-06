class DirectorsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create,:update,:destroy]
  load_and_authorize_resource
  expose :directors, ->{ Director.all }

  def index
  end

  def show
    binding.pry
  end

  def new
    @director = Director.new
  end

  def edit
  end

  def create
    respond_to do |format|
      if @director.save
        format.html { redirect_to director, notice: 'Director was successfully created.' }
        format.json { render :show, status: :created, location: director }
      else
        format.html { render :new }
        format.json { render json: director.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @director.update(director_params)
        format.html { redirect_to director, notice: 'Director was successfully updated.' }
        format.json { render :show, status: :ok, location: director }
      else
        format.html { render :edit }
        format.json { render json: director.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @director.destroy
    respond_to do |format|
      format.html { redirect_to directors_url, notice: 'Director was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  private
  
  def director_params
    params.require(:director).permit(:firstname,:lastname,:year_of_birth, images: [])
  end

  def set_director
    @director = Director.find_by_slug(params[:id])
  end
end
