load File.expand_path('../ruls.rb',__FILE__)
class UpdaterController < ApplicationController

  def index
     @myfiles = MyFile.all 
	  @statuses = Status.all
	
  end

  def sequence
	  @id = params[:updater_id]
	  @name = MyFile.find(params[:updater_id])
	  respond_to :html, :js
  end

  def load
    
    	  @file = MyFile.find(params[:updater_id])
          @my_file_main = MyFile.find_by(main: true)
          
          @main = "Vendor#{@my_file_main.vendor_id.to_s}".constantize.all
          @status = Status.find_by(model_id: @file.vendor_id.to_s)
	  @status.update(status: "Updating...", time_start: Time.now)
          @main_template = JSON.parse(@my_file_main.main_template) 
          @template = JSON.parse(@file.main_template)
          @skip_rows = JSON.parse(@file.skip_rows)
          @ruls_item_code = Ruls.rules_parse(@file.skip_rows,"item_code")
          @ruls_price = Ruls.rules_parse(@file.skip_rows,"price")
          @ruls_available = Ruls.rules_parse(@file.skip_rows,"available")
          @ruls_unavailable = Ruls.rules_parse(@file.skip_rows,"unavailable")
          @ruls_on_order = Ruls.rules_parse(@file.skip_rows,"on_order")
          @data= "Vendor#{@file.vendor_id.to_s}".constantize.all
          puts "start update..."
          @un_isset = Array.new
         @isset = Array.new
          @data.each do |e|
            
            item_code_current_value = e.send(@template["item_code"])
            price_current_value = e.send(@template["price"])
            available_current_value = e.send(@template["available"])

           # puts @template
            
            if e.visible == true and Ruls.bool_and(@ruls_item_code,item_code_current_value) and Ruls.bool_and(@ruls_price,price_current_value) then
              a = @main.find_by(@main_template['item_code'] => e.send(@template["item_code"]))
              if a != nil
                @available = nil
               # puts "Available: " + available_current_value.to_s + " " + Ruls.bool_or(@ruls_available,available_current_value).to_s
                if Ruls.bool_or(@ruls_available,available_current_value)
                  @available = "+"
                end  
                if  Ruls.bool_or(@ruls_on_order,available_current_value)
                  @available = "0"
                end
                if Ruls.bool_or(@ruls_unavailable,available_current_value)
                  @available = "-"
                end
                #puts @available
           if @available !=nil then
                h = Hash[id: a.send(@main_template['item_code']).to_s, price_was: a.send(@main_template['price']).to_s, price_new: e.send(@template["price"]).to_s,available_was: a.send(@main_template['available']).to_s, available_new: @available]
#Hash[id: a.send(@main_template['item_code']).to_s, price_was: a.send(@main_template['price']).to_s, price_new: e.send(@template["price"]).to_s]
                @isset << h

                
                if (@template["currency"] == "$SOURCE") then
a.update(@main_template['price'] => (@skip_rows["kurs"] == "nil" )? e.send(@template["price"]) : (e.send(@template["price"]).to_i.fdiv(@skip_rows["kurs"].to_f)).round(6).to_s, @main_template['available'] => @available)
                else
                  puts "A: " + @available + " I:  " + item_code_current_value
                   a.update(@main_template['price'] =>(@skip_rows["kurs"] == "nil" )? e.send(@template["price"]) : (e.send(@template["price"]).to_i.fdiv(@skip_rows["kurs"].to_f)).round(6).to_s, @main_template['currency'] => @template["currency"], @main_template['available'] => @available)
                end
              else
                
             puts "@available = nil! ---------------------------"     
           end
              else
              @un_isset << e.send(@template["item_code"])
           
           end
              end
            end
            
          
File.open(Rails.root.join('public',"#{@file.name}_isset.json").to_s, 'w') { |file| file.write(@isset.to_json) }
          #Sputs @isset
         File.open(Rails.root.join('public',"#{@file.name}_un_isset.json").to_s, 'w') { |file| file.write(@un_isset.to_json) }
        # @un_isset.each {|e| puts "un_isset: " + e }
@status.update(status: "finish update", time_end: Time.now)
    
respond_to do |f|
		  f.html
		  f.json
end
puts "update end..."
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
      if params[:size] == "all"
      @data= "Vendor#{@file.vendor_id.to_s}".constantize.all
    else
      @data= "Vendor#{@file.vendor_id.to_s}".constantize.take((params[:size] != nil )? params[:size].to_i : 50)
    end
    @cols = "Vendor#{@file.vendor_id.to_s}".constantize.column_names
  end

  def set_rows
    @file = MyFile.find(params[:updater_id])
      if params[:size] == "all"
      @data= "Vendor#{@file.vendor_id.to_s}".constantize.all
    else
      @data= "Vendor#{@file.vendor_id.to_s}".constantize.take((params[:size] != nil )? params[:size].to_i : 50)
    end
    @cols = "Vendor#{@file.vendor_id.to_s}".constantize.column_names
    #load File.expand_path('../ruls.rb',__FILE__)
    # require_relative 'ruls' 
    #puts params[:updater_id]
    
   # puts "##{__LINE__} "  +  Ruls.item_code(@file.skip_rows)
  end
  
  def show
    @file = MyFile.find(params[:id])
    if params[:size] == "all"
      @data= "Vendor#{@file.vendor_id.to_s}".constantize.all
    else
      @data= "Vendor#{@file.vendor_id.to_s}".constantize.take((params[:size] != nil )? params[:size].to_i : 50)
    end
    @cols = "Vendor#{@file.vendor_id.to_s}".constantize.column_names
  end

  def update
    i = MyFile.find(params[:id])
    if params[:flag] == nil
      if i.main == true then
        respond_to do |f|
	  if i.update(main_template: (params.permit(:item_code, :price, :currency, :available, :params_start, :params_end,:category_id,:item_id,:item_name)).to_json) then
	    f.html {redirect_to :back, notice: "Updating main template  succesful!" }
	  else
	    f.html {redirect_to :back, notice: "Filed...[main template]" }
	  end
	end
      else
        respond_to do |f|
	  if i.update(main_template: (params.permit(:item_code, :price, :currency, :available)).to_json) then
	    f.html {redirect_to :back, notice: "Updating template succesful!" }
	  else
	    f.html { redirect_to :back, notice: "Filed...[template]" }
	  end
	end
      end
    end

    if params[:flag] == "skip_rows"
      i = MyFile.find(params[:id])
      respond_to do |f|
	if i.update(skip_rows: (params.permit(:item_code, :price, :currency, :available,:unavailable,:on_order,:kurs)).to_json) then
	  f.html {redirect_to :back, notice: "Updating skip rows succesful!" }
	else
	  f.html { redirect_to :back, notice: "Filed...[skip rows]" }
	end
      end      
    end
  end

  def visible
    file = MyFile.find(params[:updater_id])
    val = "Vendor#{file.vendor_id.to_s}".constantize.find(params[:id])
    bool = (val.visible == true)? true : false;
    val.update(visible: !bool )
  end

  def preview
    @file = MyFile.find(params[:updater_id])
    if params[:size] == "all"
      @data= "Vendor#{@file.vendor_id.to_s}".constantize.all
    else
      @data= "Vendor#{@file.vendor_id.to_s}".constantize.take((params[:size] != nil )? params[:size].to_i : 50)
    end
    @cols = "Vendor#{@file.vendor_id.to_s}".constantize.column_names
  end
  
end
