class MakesController < ActionController::Base
  def index
    @makes = Make.all
  end

  def show
    @make = Make.find(params[:id])
  end
end