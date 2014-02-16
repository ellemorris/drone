require 'csv'

class PagesController < ApplicationController
  def new
  end

  def create
    file = "my_file.csv"
    File.open(file, "w") do |writer|
      writer << params[:start_date] += ","
      writer << params[:end_date] += ","
      params[:stock_name].each do |key, val|
        writer << val += ","
      end
    end
    
    redirect_to "http://localhost:5631"
  end
end
