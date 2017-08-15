class DirectorsController < ApplicationController
  
  expose :director
  expose :directors, ->{ Director.all.decorate }
  
  # GET /directors
  # GET /directors.json
  def index
  end

  # GET /directors/1
  # GET /directors/1.json
  def show
  end

  # GET /directors/new
  def new
  end

  # GET /directors/1/edit
  def edit
  end

  # POST /directors
  # POST /directors.json
  def create
    respond_to do |format|
      if director.save
        format.html { redirect_to director, notice: 'Director was successfully created.' }
        format.json { render :show, status: :created, location: director }
      else
        format.html { render :new }
        format.json { render json: director.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /directors/1
  # PATCH/PUT /directors/1.json
  def update
    respond_to do |format|
      if director.update(director_params)
        format.html { redirect_to director, notice: 'Director was successfully updated.' }
        format.json { render :show, status: :ok, location: director }
      else
        format.html { render :edit }
        format.json { render json: director.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /directors/1
  # DELETE /directors/1.json
  def destroy
    director.destroy
    respond_to do |format|
      format.html { redirect_to directors_url, notice: 'Director was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  private
  
  def director_params
    params.require(:director).permit(:firstname,:lastname,:year_of_birth)
  end
end
