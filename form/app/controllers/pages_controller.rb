require 'csv'

class PagesController < ApplicationController
  def new
  end

  def create
    file = "my_file.csv"
    File.open(file, "w") do |csv|
      csv << params[:stock_name]
    end

    redirect_to "http://localhost:6777"
  end
end
