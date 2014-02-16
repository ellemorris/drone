require 'csv'

class PagesController < ApplicationController
  def new
  end

  def create
    file = "my_file.csv"
    File.open(file, "w") do |writer|
      parsed_start_date = params[:start_date].split("-").join
      parsed_start_date += ","
      parsed_end_date =  params[:end_date].split("-").join
      parsed_end_date += ","

      writer << parsed_start_date
      writer << parsed_end_date
      params[:stock_name].each do |key, val|
        writer << val += ","
      end
    end
    
    redirect_to "http://localhost:6777"
  end
end
