class RidersController < ApplicationController
  before_action :set_rider, only: [:show, :edit, :update, :destroy]


  def index
    @riders = Rider.all
  end

  def show
    @rider = Rider.find(params[:id])
  end

  # GET /riders/new
  def new
    @rider = Rider.new
  end

  # GET /riders/1/edit
  def edit
      @rider = Rider.new
  end

  def create
      @rider = Rider.create(rider_params)
      if @rider.save
        redirect_to riders_path
      end
  end





  # PATCH/PUT /riders/1
  # PATCH/PUT /riders/1.json
  def update
    respond_to do |format|
      if @rider.update(rider_params)
        format.html { redirect_to @rider, notice: 'Rider was successfully updated.' }
        format.json { render :show, status: :ok, location: @rider }
      else
        format.html { render :edit }

      end
    end
  end

  # DELETE /riders/1
  # DELETE /riders/1.json
  def destroy
    @rider.destroy
    respond_to do |format|
      format.html { redirect_to riders_url, notice: 'Rider was successfully destroyed.' }

    end
  end

  private


  private

    def rider_params
      params.require(:rider).permit(:name , :phone_num)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_rider
      # @rider = Rider.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rider_params
      params.fetch(:rider, {})
    end
end



# class RidersController < ApplicationController
#   def index
#     @riders = Rider.all
#   end
#
#   def show
#
#   end
#
#   def new
#     @rider = Rider.new
#     render 'new'
#   end
#
#   def create
#     @rider = Rider.new(params.require(:name).permit(:name))
#     if @rider.save
#       redirect_to(riders_path)
#     else
#   render('new')
#     end
#   end
#
#
#   def edit
#
#   end
#
#   def update
#
#   end
#
#   def destroy
#
#   end
#
#
#
# end
