require 'csv'

class PagesController < ApplicationController
  def new
  end

  def create
    params[:stock_name]

    CSV.open("assets/list.csv", 'w') do |writer|
      csv << [params[:stock_name]]
    end
    # p params[:stock_name]
    redirect_to "http://localhost:5631"
  end
end
