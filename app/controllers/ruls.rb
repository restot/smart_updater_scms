DEBUG = true unless defined? DEBUG  # INFO: to debug mode on, set on true

puts "##{__LINE__} Ruls included..." if DEBUG
class Ruls
  def self.show (arg)

    return "123_" + arg.to_s

  end
  
  def self.item_code (ruls, flag = false)

    if ruls != nil then 
      parsed_ruls = Ruls.json_parse(ruls)
      splited_ruls = parsed_ruls["item_code"].split("|")
      flag = splited_ruls[1]
      splited_ruls_array = splited_ruls[0].split(",")
      if flag.to_s == "true" then
        return "Ruls: #{ splited_ruls_array.join(',')  } Flag TRUE"
      else
        ruls_array = Array.new()
        t = splited_ruls_array.each do |e|
          ruls_hash = Hash.new()
          v = e.split(":")
          ruls_hash[:operator] = v[0]
          ruls_hash[:value] = v[1]
          ruls_array << ruls_hash
        end
        print "##{__LINE__.to_s} " if DEBUG 
        puts ruls_array if DEBUG 
        puts "Ruls: #{ splited_ruls_array.join(',')  } Flag FALSE" if DEBUG
        return ruls_array
      end
    else
    return  100 # INFO: code 100 means ruls is nil
    
    end
  end

    def self.price (ruls, flag = false)
   
    if ruls != nil then 
      parsed_ruls = Ruls.json_parse(ruls)
      splited_ruls = parsed_ruls["price"].split("|")
      flag = splited_ruls[1]
      splited_ruls_array = splited_ruls[0].split(",")
      if flag.to_s == "true" then
        return "Ruls: #{ splited_ruls_array.join(',')  } Flag TRUE"
      else
        ruls_array = Array.new()
        t = splited_ruls_array.each do |e|
          ruls_hash = Hash.new()
          v = e.split(":")
          ruls_hash[:operator] = v[0]
          ruls_hash[:value] = v[1]
          ruls_array << ruls_hash
        end
        print "##{__LINE__.to_s} " if DEBUG 
        puts ruls_array if DEBUG 
        puts "Ruls: #{ splited_ruls_array.join(',')  } Flag FALSE" if DEBUG
        return ruls_array
      end
    else
    return  100 # INFO: code 100 means ruls is nil
    
    end  
    end

    def self.available (ruls, flag = false)

    if ruls != nil then 
      parsed_ruls = Ruls.json_parse(ruls)
      splited_ruls = parsed_ruls["item_code"].split("|")
      flag = splited_ruls[1]
      splited_ruls_array = splited_ruls[0].split(",")
      if flag.to_s == "true" then
        return "Ruls: #{ splited_ruls_array.join(',')  } Flag TRUE"
      else
        ruls_array = Array.new()
        t = splited_ruls_array.each do |e|
          ruls_hash = Hash.new()
          v = e.split(":")
          ruls_hash[:operator] = v[0]
          ruls_hash[:value] = v[1]
          ruls_array << ruls_hash
        end
        print "##{__LINE__.to_s} " if DEBUG 
        puts ruls_array if DEBUG 
        puts "Ruls: #{ splited_ruls_array.join(',')  } Flag FALSE" if DEBUG
        return ruls_array
      end
    else
    return  100 # INFO: code 100 means ruls is nil
    
    end
  end

    def self.rule_parse (ruls, flag = false)

    if ruls != nil then 
      parsed_ruls = Ruls.json_parse(ruls)
      splited_ruls = parsed_ruls["item_code"].split("|")
      flag = splited_ruls[1]
      splited_ruls_array = splited_ruls[0].split(",")
      if flag.to_s == "true" then
        return "Ruls: #{ splited_ruls_array.join(',')  } Flag TRUE"
      else
        ruls_array = Array.new()
        t = splited_ruls_array.each do |e|
          ruls_hash = Hash.new()
          v = e.split(":")
          ruls_hash[:operator] = v[0]
          ruls_hash[:value] = v[1]
          ruls_array << ruls_hash
        end
        print "##{__LINE__.to_s} " if DEBUG 
        puts ruls_array if DEBUG 
        puts "Ruls: #{ splited_ruls_array.join(',')  } Flag FALSE" if DEBUG
        return ruls_array
      end
    else
    return  100 # INFO: code 100 means ruls is nil
    
    end
  end
    
    def self.dunamic_rule (operator, condition, val)
       print "##{__LINE__.to_s} " if DEBUG 
       puts "\n Operator: #{operator} \n Condition: #{condition} \n Value: #{val.inspect}" if DEBUG
       
       t = ((condition.to_s == "nil")? nil : condition).method(operator.to_s)
       if condition.to_i == 0 && val.to_i == 0
         e = t.call((val == "nil")? nil : val)
         t = ((condition.to_s == "nil")? nil : condition).method(operator.to_s)
       else
         t = ((condition.to_s == "nil")? nil : condition.to_f).method(operator.to_s)
         e = t.call((val == "nil")? 0 : val.to_f)
       end
       puts "Value  #{val.class}"
       puts " Return #{e}"
      return e
  
    end

 
   def self.json_parse (json)

    hash = JSON.parse(json)
    return hash

  end  
end
