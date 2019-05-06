require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  holiday_hash[:summer][:fourth_of_july][1]
  
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  
   holiday_hash[:winter][:christmas] << supply
   holiday_hash[:winter][:new_years] << supply

end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash[:spring][:memorial_day] << supply 
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array )
  sesn = season.to_sym   
  hldy = holiday_name.to_sym

  hash = holiday_hash[sesn][hldy] = supply_array
  hash.flatten

  holiday_hash
  
end

def all_winter_holiday_supplies(holiday_hash)
  holiday_hash[:winter].values.flatten

end

def all_supplies_in_holidays(holiday_hash)

  holiday_hash.each do |season, holiday|
    puts "#{season.capitalize}:" 

      holiday.each do |holiday, supplies|
        holiday = holiday.to_s
        if holiday.include? "_"
          x = holiday.split("_") 
          cap_array = []
          x.map do |word|
            cap_array << word.capitalize
            cap_array.join("_")
          end
          x = "  #{cap_array.join(" ")}: #{supplies.join(", ")}"
        else 
          y = "  #{holiday.capitalize}: #{supplies.join(", ")}"
        end
          puts "#{x}#{y}" 
      end 
  end
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  final_arr = []
  holiday_hash.map do |season, holiday|
    bbq_array = []
    holiday.each do |holiday, supplies|
      if supplies.include? "BBQ"
        bbq_array << holiday
      end
  
      
    end
    x = bbq_array
    final_arr << x
  end
final_arr.flatten
end







