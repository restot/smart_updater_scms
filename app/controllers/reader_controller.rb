require 'roo'
class ReaderController < ApplicationController
  def index
	  @myfiles = MyFile.all 
  end

  def read
	  @params = params
	  @file = MyFile.find(params[:format])
	  @xlsx = Roo::Spreadsheet.open("#{root_url}#{@file.attachment_url}", extention: "xlsx")	# optional metods
  end

  def my
	  respond_to do |f|
		  f.html { redirect_to reader_index_url}
		  f.js
	  end
  end
end
