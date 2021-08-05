class Bot
    @@bots = 0
    @@battery_level = 0
    

    attr_accessor :name, :madein, :yearmadein, :battery_level, :damage
    
    def initialize(name, madein, yearmadein)
        @name = name
        @madein = madein
        @yearmadein = yearmadein
        @damage = 0
        @@battery_level = 100
        @@bots += 1
    end
    
    def talk(x)
        if @@battery_level < 5
            "Need more battery to perform the action, charge me first."
        else @@battery_level -= 5
        "#{x}"
        end
    end

    def give_me_your_details
        if @@battery_level < 5
            "Need more battery to perform the action, charge me first."
        else @@battery_level -= 5
        "Hi I am #{self.name}, I was made in #{self.madein}, in #{self.yearmadein}."
        end
    end

    def age
        if @@battery_level < 5
            "Need more battery to perform the action, charge me first."
        else @@battery_level -= 5
            t = Time.now
            age = t.year - self.yearmadein
            "I am #{age} years old."
        end
    end
    
    def battery_level
        case @@battery_level
        when 100 then "Battery is full."
        when 26..99 then "Battery level is at #{@@battery_level} %."
        when 10..25 then "Battery level is at #{@@battery_level} % charge me when possible."
        when 1..9 then "Battery level is at #{@@battery_level} % I will put myself in ECO mode, charge me as soon as possible."
        else "Battery level is at 0 % I need a overnight charge."
        end
    end

    def self.bots_created
        case @@bots
        when 0 then "0 bots created, you need to create bots."
        when 1 then "Only 1 bot has been created."
        else "The total of #{@@bots} bots have been created."
        end
    end
    
    def play_song
        if @@battery_level < 7
            "Need more battery to perform the action, charge me first."
        else @@battery_level -= 7
        "The robot played a song my battery level is now #{@@battery_level} %."
        end
    end
    
    def charge
        until @@battery_level == 100
             @@battery_level += 1
        end 
        return "Battery level replenished."          
    end
    def punch(x) 
         if x.damage >=100
            t = Time.now
            year = t.year
            "#{x.name} is no longer with us, let it rest in peace. Born: #{x.yearmadein} - Died : #{year}"
         elsif @@battery_level < 10
            "Need more battery to perform the action, charge me first." 
         else @@battery_level -= 10 
              x.damage += 25
              "#{self.name} punched #{x.name}."
            
        end
    end
end



