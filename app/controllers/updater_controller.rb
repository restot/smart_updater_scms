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
    @data= "Vendor#{@file.vendor_id.to_s}".constantize.take(150)
    @cols = "Vendor#{@file.vendor_id.to_s}".constantize.column_names
  end

  def set_rows
    @file = MyFile.find(params[:updater_id])
    @data= "Vendor#{@file.vendor_id.to_s}".constantize.take(150)
    @cols = "Vendor#{@file.vendor_id.to_s}".constantize.column_names
  end
  
  def show
    @file = MyFile.find_by(main: true)
    @data= "Vendor#{@file.vendor_id.to_s}".constantize.take(150)
    @cols = "Vendor#{@file.vendor_id.to_s}".constantize.column_names
  end

  def update
    i = MyFile.find(params[:id])
    if i.main == "t" then
	  respond_to do |f|
	  if i.update(main_template: (params.permit(:item_code, :price, :currency, :available, :params_start, :params_end)).to_json) then
	f.html {redirect_to updater_url(i), notice: "Updating succesful!" }
	  else
		  f.html { redirect_to updater_url(i), notice: "Filed..." }
	  end
	  end
    else
	  respond_to do |f|
	  if i.update(main_template: (params.permit(:item_code, :price, :currency, :available)).to_json) then
	f.html {redirect_to updater_set_cols_url(i), notice: "Updating succesful!" }
	  else
		  f.html { redirect_to updater_set_cols_url(i), notice: "Filed..." }
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
end
