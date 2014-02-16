require 'csv'

class PagesController < ApplicationController
  def new
  end

  def create
    params[:stock_name]


  file = "my_file.csv"
    File.open(file, "w") do |csv|
      csv << params[:stock_name]
    end
    # p params[:stock_name]
    redirect_to "http://localhost:6777"
  end
end
