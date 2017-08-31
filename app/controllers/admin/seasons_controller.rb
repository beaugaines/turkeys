class Admin::SeasonsController < Admin::ApplicationController
  def index
    @seasons = Season.all
  end

  def new
    @season = Season.new
    @options = ["Fall #{Date.today.year}", "Winter #{Date.today.year}"]
  end

  def create
    @season = Season.new(season_params)
    if @season.save
      redirect_to admin_root_path, notice: 'Season created'
    else
      flash[:alert] = 'Season failed to save, please try again'
      render :new
    end
  end

  def show
  end

  def edit
  end

  private
  def season_params
    params.require(:season).permit(:name, :turkeys, :start_date, pick_up_dates: [])
  end
end
