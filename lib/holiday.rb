require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  holiday_hash[:summer][:fourth_of_july][1]
end


def add_supply_to_winter_holidays(holiday_hash, supply)
  holiday_hash[:winter][:christmas].push(supply)
  holiday_hash[:winter][:new_years].push(supply)
end


def add_supply_to_memorial_day(holiday_hash, supply)
holiday_hash[:spring][:memorial_day].push(supply)
end


def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)

holiday_hash[season][holiday_name] = supply_array
holiday_hash
end


def all_winter_holiday_supplies(holiday_hash)
  winter_stuff = []
    holiday_hash[:winter].collect do |key, value|
      value.each do |supply|
        winter_stuff << supply
      end
    end
  winter_stuff
end


def all_supplies_in_holidays(holiday_hash)
  def format(symbol)
    symbol.to_s.split("_").map(&:capitalize).join(" ") + ":"
  end

  holiday_hash.each do |season, season_obj|
    puts format(season)
    season_obj.each do |holiday, holiday_obj|
      puts "  " + format(holiday) + " " + holiday_obj.join(", ")
    end
  end
end


def all_holidays_with_bbq(holiday_hash)
  holiday_names = []
  holiday_hash.each do |season, season_obj|
    season_obj.each do |holiday, holiday_obj|
      if (holiday_obj.include?("BBQ"))
        holiday_names << (holiday)
      end
    end
  end
  holiday_names
end
