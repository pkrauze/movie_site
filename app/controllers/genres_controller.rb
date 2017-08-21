class GenresController < ApplicationController
  expose :genre
  expose :genres,-> {Genre.all}

  # GET /genres
  # GET /genres.json
  def index
  end

  # GET /genres/1
  # GET /genres/1.json
  def show
  end

  # GET /genres/new
  def new
  end

  # GET /genres/1/edit
  def edit
  end

  # POST /genres
  # POST /genres.json
  def create
    respond_to do |format|
      if genre.save
        format.html { redirect_to genre, notice: 'Genre was successfully created.' }
        format.json { render :show, status: :created, location: genre }
      else
        format.html { render :new }
        format.json { render json: genre.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /genres/1
  # PATCH/PUT /genres/1.json
  def update
    respond_to do |format|
      if genre.update(genre_params)
        format.html { redirect_to genre, notice: 'Genre was successfully updated.' }
        format.json { render :show, status: :ok, location: genre }
      else
        format.html { render :edit }
        format.json { render json: genre.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /genres/1
  # DELETE /genres/1.json
  def destroy
    genre.destroy
    respond_to do |format|
      format.html { redirect_to genres_url, notice: 'Genre was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  
    def genre_params
      params.require(:genre).permit(:name)
    end
end
