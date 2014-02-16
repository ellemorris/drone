require 'csv'

class PagesController < ApplicationController
  def new
  end

  def create
    params[:stock_name]


  file = "my_file.csv"
    File.open(file, "w") do |csv|
      csv << params[:stock_name]
      csv << ","
      csv << params[:start_date]
      csv << ","
      csv << params[:end_date]
      csv << ","
    end
    # p params[:stock_name]
    redirect_to "http://localhost:6777"
  end
end
