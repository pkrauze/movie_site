class MoviesController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create,:update,:destroy]
  before_action :set_movie
  load_and_authorize_resource

  expose :movies, -> { set_movies }

  def index
  end
  
  def from_genre
    respond_to do |format|
      format.js
    end
  end

  def show
    @order_item, @similar_movies = Movies::ShowMovie.new(@movie, current_order).call
  end

  def new
    @movie = Movie.new
    @movie.build_director
  end

  def edit
  end

  def create
    respond_to do |format|
      if Movies::CreateMovie.new(movie_params).call
        format.html { redirect_to @movie, notice: 'Movie was successfully created.' }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new, notice: 'Movie was not created' }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if Movies::UpdateMovie.new(params[:id],movie_params).call
        format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
        format.json { render :show, status: :ok, location: @movie }
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
      params.require(:movie).permit(:title, :desc, :year, :time, :price, :director_id, genre_ids: [], images: [], covers: [], director_attributes: [:id, :firstname,:lastname, :year_of_birth])
    end

    def set_movie
      @movie = Movie.find_by_slug(params[:id])
    end

    def set_movies
      @search = Movie.includes(:genres).search(params[:q])
    	movies = @search.result.page(params[:page])
      movies = Movie.includes(:genres).where(genres:{id: params[:genre_ids]}).page(params[:page]) if params[:genre_ids].present?
      movies
    end
end
