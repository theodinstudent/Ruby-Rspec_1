require "./lib/interactive_bot.rb"

describe Bot do
    subject(:bot1) { Bot.new("bender", "USA", 2018)}
    subject(:bot2) { Bot.new("metalhead", "Germany", 2015)}
    describe "#self.bots_created" do
        it "Outputs the number of bots created;" do
            expect(Bot.bots_created).to eql("0 bots created, you need to create bots.")
            Bot.new("a","aa", 00)
            expect(Bot.bots_created).to eql("Only 1 bot has been created.")
        end
    end
    describe "#talk(x)" do
        it "Outputs a String.class;" do
            expect(bot1.talk("hello human")).instance_of?(String)
            expect(bot1.battery_level).to eql("Battery level is at 95 %.")
            expect(bot1.charge).to eql("Battery level replenished.")
            expect(bot1.battery_level).to eql("Battery is full.")
            expect(bot2.talk("hello human")).instance_of?(String)
        end
    end
    describe "#give_me_your_details" do
        it "Outputs the subject's info;" do
            expect(bot1.give_me_your_details).to eql("Hi I am bender, I was made in USA, in 2018.")
            expect(bot1.battery_level).to eql("Battery level is at 95 %.")
            expect(bot1.charge).to eql("Battery level replenished.")
            expect(bot1.battery_level).to eql("Battery is full.")
            expect(bot2.give_me_your_details).to eql("Hi I am metalhead, I was made in Germany, in 2015.")

        end
    end
    describe "#age" do
        it "Outputs the subject's age plus a higher number of bots created;" do
            expect(bot1.age).to eql("I am 3 years old.")
            expect(bot1.battery_level).to eql("Battery level is at 95 %.")
            expect(bot1.charge).to eql("Battery level replenished.")
            expect(bot1.battery_level).to eql("Battery is full.")
            expect(bot2.age).to eql("I am 6 years old.")
            expect(Bot.bots_created).to eql("The total of 7 bots have been created.")
        end
    end
    describe "#my_battery_level" do
        it "Outputs the level of battery;" do
            expect(bot1.battery_level).to eql("Battery is full.")
            expect(bot2.battery_level).to eql("Battery is full.")
        end
    end
    describe "#play_song #my_battery_level #charge" do
        it "Outputs the level of battery after playing songs, and confirms the battery has been replenished." do
        expect(bot1.play_song).to eql("The robot played a song my battery level is now 93 %.")
        expect(bot1.battery_level).to eql("Battery level is at 93 %.")
        expect(bot1.play_song).to eql("The robot played a song my battery level is now 86 %.")
        expect(bot1.play_song).to eql("The robot played a song my battery level is now 79 %.")
        expect(bot1.play_song).to eql("The robot played a song my battery level is now 72 %.")
        expect(bot1.play_song).to eql("The robot played a song my battery level is now 65 %.")
        expect(bot1.play_song).to eql("The robot played a song my battery level is now 58 %.")
        expect(bot1.play_song).to eql("The robot played a song my battery level is now 51 %.")
        expect(bot1.play_song).to eql("The robot played a song my battery level is now 44 %.")
        expect(bot1.play_song).to eql("The robot played a song my battery level is now 37 %.")
        expect(bot1.play_song).to eql("The robot played a song my battery level is now 30 %.")
        expect(bot1.play_song).to eql("The robot played a song my battery level is now 23 %.")
        expect(bot1.battery_level).to eql("Battery level is at 23 % charge me when possible.")
        expect(bot1.play_song).to eql("The robot played a song my battery level is now 16 %.")
        expect(bot1.play_song).to eql("The robot played a song my battery level is now 9 %.")
        expect(bot1.battery_level).to eql("Battery level is at 9 % I will put myself in ECO mode, charge me as soon as possible.")
        expect(bot1.play_song).to eql("The robot played a song my battery level is now 2 %.")
        expect(bot1.play_song).to eql("Need more battery to perform the action, charge me first.")
        expect(bot1.charge).to eql("Battery level replenished.")
        expect(bot1.battery_level).to eql("Battery is full.")
        expect(bot1.play_song).to eql("The robot played a song my battery level is now 93 %.")
        
        end
    end
    describe "#punch" do
        it "Outputs the action of punching another object." do
            expect(bot1.punch(bot2)).to eql("bender punched metalhead.")
            expect(bot1.punch(bot2)).to eql("bender punched metalhead.")
            expect(bot1.punch(bot2)).to eql("bender punched metalhead.")
            expect(bot1.punch(bot2)).to eql("bender punched metalhead.")
            expect(bot1.punch(bot2)).to eql("metalhead is no longer with us, let it rest in peace. Born: 2015 - Died : 2021")
            expect(bot2.damage=(0)).to eql(0)
            expect(bot1.punch(bot2)).to eql("bender punched metalhead.")
            expect(bot1.punch(bot2)).to eql("bender punched metalhead.")
            expect(bot1.punch(bot2)).to eql("bender punched metalhead.")
            expect(bot1.punch(bot2)).to eql("bender punched metalhead.")
            expect(bot1.punch(bot2)).to eql("metalhead is no longer with us, let it rest in peace. Born: 2015 - Died : 2021")
            expect(bot2.damage=(0)).to eql(0)
            expect(bot1.punch(bot2)).to eql("bender punched metalhead.")
            expect(bot1.punch(bot2)).to eql("bender punched metalhead.")
            expect(bot1.punch(bot2)).to eql("Need more battery to perform the action, charge me first.")
        end
    end
end