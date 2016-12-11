class ReaderController < ApplicationController
  def index
  end

  def read
  end

  def my
	  respond_to do |f|
		  f.html { redirect_to reader_index_url}
		  f.js
	  end
  end
end
