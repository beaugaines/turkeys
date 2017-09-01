class WelcomeController < ApplicationController
  def index
    @season = Season.active
  end
end
