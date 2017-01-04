class UpdaterController < ApplicationController

  def index
    @myfiles = MyFile.all 
  end

  def sequence
  end

  def main
	  MyFile.where(main: true).update(main: false)
	  i =  MyFile.find(params[:updater_id])
          i.update(main: true)
          i.update(main_template: nil)
	  respond_to do |f|
		  f.html { redirect_to updater_index_url }
	  end
  end

  def set_cols
    @file = MyFile.find(params[:updater_id])
    @data= "Vendor#{@file.vendor_id.to_s}".constantize.take(50)
    @cols = "Vendor#{@file.vendor_id.to_s}".constantize.column_names
  end

  def set_rows
    @file = MyFile.find(params[:updater_id])
    @data= "Vendor#{@file.vendor_id.to_s}".constantize.take(50)
    @cols = "Vendor#{@file.vendor_id.to_s}".constantize.column_names
    load File.expand_path('../ruls.rb',__FILE__)
    # require_relative 'ruls' 
    #puts params[:updater_id]
    
   # puts "##{__LINE__} "  +  Ruls.item_code(@file.skip_rows)
  end
  
  def show
    @file = MyFile.find(params[:id])
    @data= "Vendor#{@file.vendor_id.to_s}".constantize.take(50)
    @cols = "Vendor#{@file.vendor_id.to_s}".constantize.column_names
  end

  def update
    i = MyFile.find(params[:id])
    if params[:flag] == nil
      if i.main == "t" then
        respond_to do |f|
	  if i.update(main_template: (params.permit(:item_code, :price, :currency, :available, :params_start, :params_end)).to_json) then
	    f.html {redirect_to updater_url(i), notice: "Updating main template  succesful!" }
	  else
	    f.html { redirect_to updater_url(i), notice: "Filed...[main template]" }
	  end
	end
      else
        respond_to do |f|
	  if i.update(main_template: (params.permit(:item_code, :price, :currency, :available)).to_json) then
	    f.html {redirect_to updater_set_cols_url(i), notice: "Updating template succesful!" }
	  else
	    f.html { redirect_to updater_set_cols_url(i), notice: "Filed...[template]" }
	  end
	end
      end
    end

    if params[:flag] == "skip_rows"
      i = MyFile.find(params[:id])
      respond_to do |f|
	if i.update(skip_rows: (params.permit(:item_code, :price, :currency, :available)).to_json) then
	  f.html {redirect_to updater_set_rows_url(i), notice: "Updating skip rows succesful!" }
	else
	  f.html { redirect_to updater_set_rows_url(i), notice: "Filed...[skip rows]" }
	end
      end      
    end
  end

  def visible
    file = MyFile.find(params[:updater_id])
    val = "Vendor#{file.vendor_id.to_s}".constantize.find(params[:id])
    bool = (val.visible == "t")? true : false;
    val.update(visible: !bool )
  end

  def preview
    @file = MyFile.find(params[:updater_id])
    @data= "Vendor#{@file.vendor_id.to_s}".constantize.take(50)
    @cols = "Vendor#{@file.vendor_id.to_s}".constantize.column_names
  end
  
end
