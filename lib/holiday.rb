
require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
   {
     :winter => {
       :christmas => ["Lights", "Wreath"],
       :new_years => ["Party Hats"]
     },
     :summer => {
       :fourth_of_july => ["Fireworks", "BBQ"]
     },
     :fall => {
      :thanksgiving => ["Turkey"]
     },
     :spring => {
       :memorial_day => ["BBQ"]
     }
   }

holiday_hash[:summer][:fourth_of_july][1]
 
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  holiday_hash[:winter].each do |season, holiday|
    holiday_hash[:winter][season] << supply
  end
end


def add_supply_to_memorial_day(holiday_hash, supply)
  holiday_hash[:spring].each do |season, holiday|
    holiday_hash[:spring][season] << supply
  end
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  
  holiday_hash[season][holiday_name] = supply_array
  holiday_hash

end

def all_winter_holiday_supplies(holiday_hash)
  
  storage = holiday_hash[:winter].map do |season, items|
    items
  end
  storage.flatten
end

def all_supplies_in_holidays(holiday_hash)
  
  holiday_hash.each do |season, holiday|
    puts season.to_s.capitalize! + ":"
    
    holiday.each do |holiday, items| ##enters bottom level of hash, bringing in holiday and respective array(s) of items for each holiday and sets the following variables for each key/value pair that comes through 
      
      items = items.join(", ") ##creates a variable which turns all items in arrays to comma separated values 
      
      holidays = holiday.to_s.capitalize!.split("_").map {|i| i.capitalize}.join(" ") + ":" ##creates a varaible which turns the holiday from a symbol into a string, capitalizes it permanently. For any edge-case holidays with 2+ words (New Years), this variable will split any string into two different strings if the words are separated by an "_", then put them back into the array as capitalized, inidividual strings. Finally the elements from holiday are put into a single string. 
      
     puts "  " + holidays + " " + items
    end
  end 
end

def all_holidays_with_bbq(holiday_hash)
  
  holiday_hash.collect do |season, holidays|
    holidays.collect do |holiday, items|
      ##enters second level of array to get access to the items, which only evaluate to true if BBQ is one of the items in Value part of the Key/Value pair
     
      if items.include?("BBQ") ##checks to see if items includes "BBQ" and then puts the holiday into an array
        holiday
      end
    end
  end.flatten.compact ##this takes the final array, which is filled with nil values for KVPs that didn't contain "BBQ", and eliminates all of the nil values (#compact), as well as consolidates the entire group of elements into a SINGLE array from a multi-dimensional array (flatten)
end






