class MoviesController < ApplicationController
  expose :movie
  expose :movies, -> { Movie.all }
  expose :genres, -> { Genre.all }

  before_action :authenticate_user!, only: [:new,:create,:update,:destroy]
  
  # GET /movies
  # GET /movies.json
  def index
    @order_item = current_order.order_items.new
    @movies = Movie.all
    
    if params[:genre_ids].present?
      @movies = Movie.includes(:genres).where(genres:{id: params[:genre_ids]})
    end
  end

  # GET /movies/1
  # GET /movies/1.json
  def show
  end

  # GET /movies/new
  def new
  end

  # GET /movies/1/edit
  def edit
  end

  # POST /movies
  # POST /movies.json
  def create

    respond_to do |format|
      if Movies::CreateMovie.new(movie_params).call
        format.html { redirect_to root_path, notice: 'Movie was successfully created.' }
        format.json { render :show, status: :created, location: movie }
      else
        format.html { render :new, notice: 'Movie was not created' }
        format.json { render json: movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/1
  # PATCH/PUT /movies/1.json
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

  # DELETE /movies/1
  # DELETE /movies/1.json
  def destroy
   Movies::DeleteMovie.new(params[:id]).call
    respond_to do |format|
      format.html { redirect_to movies_url, notice: 'Movie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_params
      params.require(:movie).permit(:title, :desc, :year, :time, :cover, :price, :director_id, genre_ids: [])
    end
end
