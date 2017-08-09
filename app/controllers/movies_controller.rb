class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]
  expose :movie
  expise :movies, ->{ Movie.all }

  # GET /movies
  # GET /movies.json
  def index
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
      if movie.save
        format.html { redirect_to movie, notice: 'Movie was successfully created.' }
        format.json { render :show, status: :created, location: movie }
      else
        format.html { render :new }
        format.json { render json: movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/1
  # PATCH/PUT /movies/1.json
  def update
    respond_to do |format|
      if movie.update(movie_params)
        format.html { redirect_to movie, notice: 'Movie was successfully updated.' }
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
    movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_url, notice: 'Movie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

end
