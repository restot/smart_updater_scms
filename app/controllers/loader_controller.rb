class LoaderController < ApplicationController
  def index
      @myfiles = MyFile.all
   end
   
   def new
      @myfile = MyFile.new
      #@status_model = Status.new
   end
   
   def create
	   @status_model = Status.new(model_id: params.require(:my_file).permit(:vendor_id)[:vendor_id], status: "created")
	   
      @myfile = MyFile.new(myfile_params)
      
      if @myfile.save && @status_model.save
	      redirect_to my_files_path, notice: "The file #{@myfile.name} has been added. Status: #{@status_model.status}, id: #{@status_model.model_id}"
      else
         render "new"
      end
      
   end
    
   def update
      @myfile = MyFile.find(params[:id])
	   #@myfile.update(params)
	   respond_to do |format|
 if @myfile.update(myfile_params)
        format.html { redirect_to my_files_path, notice: "File #{@myfile.name} was successfully updated." }
      else
        format.html {  redirect_to my_files_path }
      end
    end
  end
   
   def edit
	   @myfile = MyFile.find(params[:id])
   end

   def destroy
      @myfile = MyFile.find(params[:id])
      @myfile.destroy
      redirect_to my_files_path, notice:  "The resume #{@myfile.name} has been deleted."
   end
   
   private
      def myfile_params
      params.require(:my_file).permit(:name, :attachment, :vendor_id,:main)
   end
end
