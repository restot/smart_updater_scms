class UpdaterController < ApplicationController
  def index
	  @myfiles = MyFile.all
  end

  def sequence
  end

  def main
	  MyFile.where(main: true).update(main: false)
	MyFile.find(params[:updater_id]).update(main: true)
	  respond_to do |f|
		  f.html { redirect_to updater_index_url }
	  end
  end

  def set_cols
  end

  def set_rows
  end
  
  def show
	@file = MyFile.find_by(main: true)
	@data= "Vendor#{@file.vendor_id.to_s}".constantize.take(150)
	@cols = "Vendor#{@file.vendor_id.to_s}".constantize.column_names
  end

  def update
	  i = MyFile.find_by(main:true)
	  respond_to do |f|
	  if i.update(main_template: (params.permit(:item_code, :price, :currency, :available, :params_start, :params_end)).to_json) then
	f.html {redirect_to updater_url(i), notice: "Updating succesful!" }
	  else
		  f.html { redirect_to updater_url(i), notice: "Filed..." }
	  end
	  end
  end

end
