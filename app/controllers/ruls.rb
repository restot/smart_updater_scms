DEBUG = true unless defined? DEBUG  # INFO: to debug mode on, set on true

puts "##{__LINE__} Ruls included..." if DEBUG
class Ruls
 
    def self.rules_parse (ruls,context, flag = false)

    if ruls != nil then 
      parsed_ruls = JSON.parse(ruls)
      splited_ruls = parsed_ruls[context].split("|")
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
        puts "Ruls: #{ splited_ruls_array.join(',')  } Flag FALSE \n" if DEBUG
        return ruls_array
      end
    else
    return  100 # INFO: code 100 means ruls is nil
    
    end
  end
    
    def self.dunamic_rule (operator, condition, val)
       print "##{__LINE__.to_s} " if DEBUG 
       puts "\n Operator: #{operator.inspect} \n Condition: #{condition.inspect}  \n Condition class: #{condition.class}  \n Value class: #{val.class} \n Value: #{val.inspect}" if DEBUG
       # NOTE: dia?size=all error fix need && error available <,>,<=,>= n wft///

       t = ((condition == "nil")? nil : condition).method(operator.to_s)
       if condition.to_i == 0 && val.to_i == 0 && condition != "0"
         e = t.call((val == "nil")? nil : val)
         t = ((condition.to_s == "nil")? nil : condition).method(operator.to_s)
       else
         t = ((condition.to_s == "nil")? nil : condition.to_f).method(operator.to_s)
         e = t.call((val == "nil")? 0 : val.to_f)
       end
      # puts "Value  #{val.class}"  if DEBUG
       puts " Return #{e}"  if DEBUG
      return e
  
    end

    def self.bool_and (arry,val)
      unless arry == 100
       print "##{__LINE__.to_s} " if DEBUG 
       puts "#bool_and"  if DEBUG
      flag = true
      arry.each do |a|
        if !Ruls.dunamic_rule(a[:operator],a[:value],val) then
          flag = false
          break
        end
      end
      return flag
      else
        print "##{__LINE__.to_s} " if DEBUG 
       puts "#bool_and #exit_code: 100"  if DEBUG

       return true
      end
    end

      def self.bool_or (arry,val)
         unless arry == 100
	print "##{__LINE__.to_s} " if DEBUG 
        puts "#bool_or"  if DEBUG

      flag = false
      arry.each do |a|
        if !Ruls.dunamic_rule(a[:operator],a[:value],val) then
          flag = true
          break
        end
      end
      return true
       else
        print "##{__LINE__.to_s} " if DEBUG 
       puts "#bool_and #exit_code: 100"  if DEBUG

       return true
      end
    end
 

    
end
