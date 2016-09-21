
class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy]

  # GET /boards
  # GET /boards.json
  def index

    @boards = Board.all

    
      if params[:countr].present?      
        @boards = @boards.joins(:city).where("cities.country_id": params[:countr].to_i)
      end
       
     
     @country_arreglo = Country.all.map{|c| [c.name,c.id]}

  end

  # GET /boards/1
  # GET /boards/1.json
  def show
    if params[:categoria].present?

      @categoria = params[:categoria].to_i
      if params[:categoria].to_i==0
     @posts = @board.posts 
      else
      @posts = @board.posts.where(category_id: params[:categoria].to_i)
      end
       
     else
       @posts = @board.posts 
     end

    @category = Category.all

    @categoria_arreglo = Category.all.map{|c| [c.name,c.id]}
    @categoria_arreglo.push(["Todos",0])
    @board = Board.find(params[:id])
   
  end

  # GET /boards/new
  def new
    @board = Board.new
  end

  def categories
    


  end

  def get_address
 @address = Geocoder.address([params[:latitude], params[:longitude]])
 render json: @address
 end


  def map
    @users = User.all
    @markers = Gmaps4rails.build_markers(@users) do |
    user, marker|
     marker.lat user.latitude
     marker.lng user.longitude
    end
    

  end



  def guardar_map

    if params[:param1].present?

      current_user.latitude = params[:param1]

      current_user.longitude = params[:param2]
      current_user.save

    end

    respond_to do |format|

      format.js
    end



  end

  # GET /boards/1/edit
  def edit
  end

  # POST /boards
  # POST /boards.json
  def create
    @board = Board.new(board_params)

    respond_to do |format|
      if @board.save
        format.html { redirect_to @board, notice: 'Board was successfully created.' }
        format.json { render :show, status: :created, location: @board }
      else
        format.html { render :new }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /boards/1
  # PATCH/PUT /boards/1.json
  def update
    respond_to do |format|
      if @board.update(board_params)
        format.html { redirect_to @board, notice: 'Board was successfully updated.' }
        format.json { render :show, status: :ok, location: @board }
      else
        format.html { render :edit }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boards/1
  # DELETE /boards/1.json
  def destroy
    @board.destroy
    respond_to do |format|
      format.html { redirect_to boards_url, notice: 'Board was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_board
      @board = Board.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def board_params
      params.fetch(:board, {})
    end
end
