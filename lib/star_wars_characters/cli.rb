require 'pry'
module StarWarsCharacters
    class CLI
        
        def start
            puts "Hello User and welcome to... "
            puts "----------------------------"
            puts "| STAR_WARS_CHARACTER.INFO |"
            puts "----------------------------"
            menu_interface
        end
        


        def menu_interface
            puts <<-INTERFACE
                +++Controls+++
                
                Access data on any character in the franchise
                by entering 'search' into the terminal 
                and following the prompts.

                To exit program enter 'exit'.
                INTERFACE
            @input = gets.chomp.downcase
            if @input == "search"
                input_character_search
            elsif @input == "exit"
                exit_program
            else 
                puts "Invalid selection, try again."
                menu_interface
            end

        end


        def input_character_search
            Character.clear
            puts "Enter the name of the character you would like to search."
            puts "Specific names will return one character while general searches may return multiple results."
            @input = gets.chomp
            Character.get_stats(@input)
            character_return_menu
        end

        def character_return_menu
            if Character.all.count == 0
                puts "There were no characters found, please try another search."
                input_character_search
            end
            Character.all.each.with_index(1) do |ch, index|
                    puts "#{index}) #{ch.name}"
                end
            puts "Select a character you wish to see more on by selecting their number"
            @input = gets.chomp
            index = @input.to_i - 1
            if index > Character.all.count || index < 0
                puts "Invalid selection, please enter a number shown."
                character_return_menu
            else 
                selected_character = Character.all[index]
                puts "Name: #{selected_character.name}"
                puts "Height: #{selected_character.height}cm"
                puts "Weight #{selected_character.mass}kg"
                puts "Hair Color: #{selected_character.hair_color}"
                puts "Eye Color: #{selected_character.eye_color}"
                puts "Birth Year: #{selected_character.birth_year}"
                puts "Gender: #{selected_character.gender}"
            end
            select_again
        end

       
        def select_again
            puts "Want to see another character"
            @input = gets.chomp.downcase
            until @input == "yes" || @input == "no" || @input == "exit"
                puts "Invalid selection, please enter 'yes' or 'no' to continue"
                @input = gets.chomp.downcase
            end
            if @input == "yes"
                input_character_search
            elsif @input == "no" || @input == "exit" 
                exit_program
            end
        end

        def exit_program
            puts "To go back to the main menu, enter 'main'. To exit program, enter 'exit'."
            @input = gets.chomp
            if @input == "main"
                menu_interface
            elsif @input == "exit"
                Character.clear
                puts "Thank you for using 'STAR_WARS_CHARACTER.INFO' - Goodbye"
            else 
                puts "Invalid selection, please enter one of the indicated commands."
                exit_program
            end
        end
    end
end






        
        


       
        
    

    
