require 'csv'

class PagesController < ApplicationController
  def new
  end

  def create
    params[:stock_name]

    File.open("list.txt", 'w') do |writer|
      writer.write(params[:stock_name])
    end
    # p params[:stock_name]
    redirect_to "http://localhost:5631"
  end
end
