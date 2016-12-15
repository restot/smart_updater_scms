require 'roo'
class ReaderController < ApplicationController
  def index
	  @myfiles = MyFile.all 
  end

  def read
	  @file = MyFile.find(params[:reader_id])
	  @xlsx = Roo::Spreadsheet.open(root_url + @file.attachment_url, extention: "xlsx")	# optional metods
	
	Vendor1.destroy_all
	 @xlsx.sheet(0).each do |row|
                   @hash = Hash.new 
	 	   i=0
		 row.each do |cell|
		   
		   @hash["col_#{i.to_s}"] = cell
		   i += 1
		 end
        	@ie = Vendor1.create(@hash)
	        @ie.save

	 end
	@e = Vendor1.all
	@cols = Vendor1.column_names
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
