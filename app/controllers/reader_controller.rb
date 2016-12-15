require 'roo'
class ReaderController < ApplicationController
  def index
	  @myfiles = MyFile.all 
  end

  def read
	  @params = params
	  @file = MyFile.find(params[:reader_id])
	  @xlsx = Roo::Spreadsheet.open(root_url + @file.attachment_url, extention: "xlsx")	# optional metods 
	  
	  respond_to do |f|
		  f.html
		  f.json
	  end
  end

  def req
	  @id = params[:reader_id]
	  respond_to :html, :js
  end

  def my
	  @foo = "foo"
	  respond_to do |f|
		  f.html { redirect_to reader_index_url}
		  f.js
	  end
  end
end
