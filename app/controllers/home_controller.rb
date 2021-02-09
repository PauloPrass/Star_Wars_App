class HomeController < ApplicationController
  def index
    if params[:filter] != nil
      @people = Person.where("name LIKE ?", "%#{params[:filter]}%")
    else
      @people = Person.all
    end
  end

  def show
    @person = Person.find(params[:id])
  end
end
