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

end
