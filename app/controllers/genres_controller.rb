class GenresController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create,:update,:destroy]
  before_action :set_genre
  load_and_authorize_resource
  expose :genres,-> {Genre.all}

  def index
  end

  def show
  end

  def new
    @genre = Genre.new
  end

  def edit
  end

  def create
    respond_to do |format|
      if @genre.save
        format.html { redirect_to @genre, notice: 'Genre was successfully created.' }
        format.json { render :show, status: :created, location: @genre }
      else
        format.html { render :new }
        format.json { render json: @genre.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @genre.update(genre_params)
        format.html { redirect_to @genre, notice: 'Genre was successfully updated.' }
        format.json { render :show, status: :ok, location: @genre }
      else
        format.html { render :edit }
        format.json { render json: genre.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @genre.destroy
    respond_to do |format|
      format.html { redirect_to genres_url, notice: 'Genre was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def genre_params
      params.require(:genre).permit(:name, images: [])
    end

    def set_genre
      @genre = Genre.find_by_slug(params[:id])
    end
end
