require 'roo'
class ReaderController < ApplicationController
  def index
	  @myfiles = MyFile.all 
	  @statuses = Status.all
	  
  end

  def show
    if params[:id] == "second_list" 
	  @data= SecondList.take(150)
	  @cols = SecondList.column_names
    else
	  file = MyFile.find(params[:id])
	  @data= "Vendor#{file.vendor_id.to_s}".constantize.take(150)
	  @cols = "Vendor#{file.vendor_id.to_s}".constantize.column_names
    end
  end

  def read
   
    if params[:reader_id] == "second_list"
      @file = MyFile.find_by(main: true)
       model="SecondList".constantize
      query = execute_statement("DELETE FROM second_lists")
	 query1 = execute_statement("delete from sqlite_sequence where name='second_lists'")
     
    else
      @file = MyFile.find(params[:reader_id])
      model="Vendor#{@file.vendor_id.to_s}".constantize
      query = execute_statement("DELETE FROM vendor#{@file.vendor_id.to_s}s")
	  query1 = execute_statement("delete from sqlite_sequence where name='#{model.to_s.downcase}s'")
    end
    
	  @status = Status.find_by(model_id: @file.vendor_id.to_s)
	  @status.update(status: "loading...", time_start: Time.now)
	  @xlsx = Roo::Spreadsheet.open(root_url + @file.attachment_url, extention: "xlsx")	# optional metods
          
          
	#Vendor1.destroy_all
	 
         sheet = (params[:reader_id] == 'second_list')? @xlsx.sheet(1) : @xlsx.sheet(0)
          sheet.each do |row|
                   @hash = Hash.new 
	 	   i=0

	           row.each do |cell|
		   
		   @hash["col_#{i.to_s}"] = cell
		   i += 1

		 end
        	@ie = model.create(@hash)
	        @ie.save

	 end
	  @status.update(status: "finish", time_end: Time.now)
	#@e = Vendor1.all
	#@cols = Vendor1.column_names
	 	  respond_to do |f|
		  f.html
		  f.json 
	  	end

  end
 
  def req
    if params[:flag] == "second_list"
      @flag = "second_list"
    end
          @id = params[:reader_id]
	  @name = MyFile.find(params[:reader_id])
	  respond_to :html, :js
    
  end

  def my
	  @foo = "foo"
	  respond_to do |f|
		  f.html { redirect_to reader_index_url}
		  f.js
	  end
  end

  def execute_statement(sql)
        results = ActiveRecord::Base.connection.execute(sql)
        if results.present?
            return results
        else
            return nil
        end
    end

end
