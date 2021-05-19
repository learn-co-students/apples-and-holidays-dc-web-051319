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
  
  holiday_hash.collect do |key, data|
    data.collect do |holiday, array|
      if holiday == :fourth_of_july
        return array[1]
      end 
    end
  end
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  
  holiday_hash.collect do |key, data|
     if key == :winter
    data.collect do |holiday, array|
      array << supply
      end
    end
  end
end


def add_supply_to_memorial_day(holiday_hash, supply)
  holiday_hash.collect do |key, data|
     if key == :spring
    data.collect do |holiday, array|
      array << supply
      end
    end
  end
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
   holiday_hash[season][holiday_name] = supply_array
end

def all_winter_holiday_supplies(holiday_hash)
  all_winter_supplies = [] 
  holiday_hash.collect do |key, data|
    if key == :winter 
      data.collect do |holiday, supply_array|
        all_winter_supplies += supply_array
      end
      return all_winter_supplies
    end
  end
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  
  holiday_hash.each do |season_key, data|
    puts "#{season_key.capitalize}:"
   data.each do |holiday_key, supply_array|
     trimmed_symbol = ""
     if(holiday_key.to_s.include?("_"))
       trimmed_holiday_key = holiday_key.to_s.tr("_"," ")
       trimmed_holiday_key = trimmed_holiday_key.split.map(&:capitalize)*' '
       puts  "  #{trimmed_holiday_key}: #{supply_array.join(", ")}"
     else 
       puts "  #{holiday_key.capitalize}: #{supply_array.join(", ")}"
   end
 end
 end
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  
  bbq_holidays = []
  holiday_hash.collect do |season_key, data|
   
    data.collect do |holiday_key, supply_array|
      if (supply_array.include?("BBQ") && bbq_holidays.include?(holiday_key) == false) 
        bbq_holidays.push(holiday_key)
      end
    end
  end
  return bbq_holidays
end
         
