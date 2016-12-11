class LoaderController < ApplicationController
  def index
      @myfiles = MyFile.all
   end
   
   def new
      @myfile = MyFile.new
   end
   
   def create
      @myfile = MyFile.new(myfile_params)
      
      if @myfile.save
         redirect_to my_files_path, notice: "The resume #{@myfile.name} has been uploaded."
      else
         render "new"
      end
      
   end
   
   def destroy
      @myfile = MyFile.find(params[:id])
      @myfile.destroy
      redirect_to my_files_path, notice:  "The resume #{@myfile.name} has been deleted."
   end
   
   private
      def myfile_params
      params.require(:my_file).permit(:name, :attachment)
   end
end
