xml.instruct!
xml.yml_catalog "date"=>"#{Time.now.strftime "%Y-%m-%d %H:%M:%S"}" do
 
  xml.shop "name"=>"Stalnoy","company"=>"Stalnoy","url"=>"http://stalnoy.org/","email"=>"vapst@yandex.ru" do 
    xml.currencies do
    		   a = %w[EUR UAH USD]
		   a.each {|e| xml.currency "id"=>e,"rate"=>"1"}

    end
    xml.categories do
    		   xml.category
    end

    xml.offers do
      @data.each  do |e|
        if e.send(@template["available"]) == "+"
          available = "true"
        elsif e.send(@template["available"]) == "0"
          available = "false"
        elsif e.send(@template["available"]) == "-"
          available = ""
        end
        xml.offer "id"=>"#{e.send(@template["category_id"])}" do
         
          xml.price e.send(@template["price"])
          xml.currencyId e.send(@template["currency"])
          xml.available available
           xml.vendorCode e.send(@template["item_code"])
        end
      end
    end
  end	       

end
