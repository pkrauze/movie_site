class MoviesController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create,:update,:destroy]
  load_and_authorize_resource
  expose :movie

  def index
    @movies = Movie.page(params[:page])
  end
  
  def from_genre
    if params[:genre_ids].present?
      @movies = Movie.includes(:genres).where(genres:{id: params[:genre_ids]})
    else
      @movies = Movie.all
    end
    respond_to do |format|
      format.js
    end
  end

  def show
    @order_item, @similar_movies = Movies::ShowMovie.new(movie, current_order).call
  end

  def new
  end

  def edit
  end

  def create
    respond_to do |format|
      if Movies::CreateMovie.new(movie_params).call
        format.html { redirect_to movie, notice: 'Movie was successfully created.' }
        format.json { render :show, status: :created, location: movie }
      else
        format.html { render :new, notice: 'Movie was not created' }
        format.json { render json: movie.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if Movies::UpdateMovie.new(params[:id],movie_params).call
        format.html { redirect_to root_path, notice: 'Movie was successfully updated.' }
        format.json { render :show, status: :ok, location: movie }
      else
        format.html { render :edit }
        format.json { render json: movie.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
   Movies::DeleteMovie.new(params[:id]).call
    respond_to do |format|
      format.html { redirect_to movies_url, notice: 'Movie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  private
    def movie_params
      params.require(:movie).permit(:title, :desc, :year, :time, :price, :director_id, genre_ids: [], images: [], covers: [])
    end
end
