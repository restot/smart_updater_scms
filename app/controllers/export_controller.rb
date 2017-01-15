class ExportController < ApplicationController


  def index
    @file = MyFile.find_by(main: true)
    @template = JSON.parse(@file.main_template)
    @data = "Vendor#{@file.vendor_id.to_s}".constantize.offset(1).all

    respond_to :html, :xml
  end


end
