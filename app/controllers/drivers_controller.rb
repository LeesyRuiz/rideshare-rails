class DriversController < ApplicationController
  def index
    @drivers = Driver.all.order(:id)
  end

  def new
    @driver = Driver.new
    # @random_driver = Driver.sample
  end

  def create
    # Driver.create(driver_params)
    # redirect_to drivers_path
    @driver = Driver.new(driver_params)

    if @driver.save
      redirect_to drivers_path, notice: 'Issue was successfully created.'
    else
      # We know the validations didn't pass
      render :new
    end
  end

  def show
    @driver = Driver.find(params[:id])
  end


  def edit
    @driver = Driver.find(params[:id])
    session.delete(:return_to)
    session[:return_to] ||= request.referer
    @back_url = session[:return_to]
  end

  def update
    driver = Driver.find(params[:id])
    driver.update_attributes(driver_params)
    driver.save
    # redirect_to animal_path(animal)
    redirect_to session[:return_to]


  end

  def destroy
    driver = Driver.find(params[:id])
    driver.destroy
    redirect_to drivers_path
  end
  #### PRIVATE
  private
  def driver_params
    params.require(:driver).permit(:name, :vin)
  end


end
