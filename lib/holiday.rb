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
  
  return holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  holiday_hash.collect do |key,value|
    if key == :winter
      value.each do |one, two|
        puts two << supply
      end
    end
  end
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash.each do |key,value|
    if key == :spring
      value.each do |one, two|
        puts two << supply
      end
    end
  end
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_hash.collect do |key,value|
    if key == season.to_sym
     holiday_hash[key][holiday_name] = supply_array      
    end
  end
  return holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  x = holiday_hash[:winter][:christmas]
  y = holiday_hash[:winter][:new_years]
  return x + y

end

def all_supplies_in_holidays(holiday_hash)
  holiday_hash.each do |one, another|
    seasons_to_string = one.to_s
    puts "#{seasons_to_string.capitalize!}:"
    another.each do |two, together|
      first_one_string = two.to_s
      a = ""
      x = first_one_string.split("_")
      x.each do |ok|
        f = ok.capitalize!
        a = a + " " + f 
      end
      second_one_string = together.join(", ")
      puts " #{a}: #{second_one_string}"
    end     
  end
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  arr = []
  holiday_hash.each do |key,value|
    value.each do |one,two|
      if two.include?("BBQ")
        arr << one
      end
    
    end
  end
  return arr
end







