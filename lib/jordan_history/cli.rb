class JordanHistory::CLI

    def start
        JordanHistory::Scraper.scrape_jordan_info
        intro
        display_jordans
        menu
        selection
    end

    def intro
        puts""
        puts "       
         d8888 8888888 8888888b.         888888  .d88888b.  8888888b.  8888888b.        d8888 888b    888 
        d88888   888   888   Y88b           88b d88P   Y88b 888   Y88b 888   Y88b      d88888 8888b   888 
       d88P888   888   888    888           888 888     888 888    888 888    888     d88P888 88888b  888 
      d88P 888   888   888   d88P           888 888     888 888   d88P 888    888    d88P 888 888Y88b 888 
     d88P  888   888   8888888P             888 888     888 8888888P   888    888   d88P  888 888 Y88b888 
    d88P   888   888   888 T88b             888 888     888 888 T88b   888    888  d88P   888 888  Y88888 
   d8888888888   888   888  T88b            88P Y88b. .d88P 888  T88b  888  .d88P d8888888888 888   Y8888 
  d88P     888 8888888 888   T88b           888   Y88888P   888   T88b 8888888P  d88P     888 888    Y888 
                                          .d88P                                                           
                                        .d88P                                                            
                                       888P                                               "
        puts ""
        puts "```````````````````````````````````````````````````````````````````````````````````````````````````````````"
        puts "Welcome!!! Michael Jordan is considered to be THE GOAT in the sport of Basketball."
        puts ""
        puts "```````````````````````````````````````````````````````````````````````````````````````````````````````````"
        puts ""
        sleep 2
    end

    def display_jordans
        sneakers = JordanHistory::Sneaker.all
        sneakers.each.with_index(1) do |sneaker, index| 
            puts "#{index}. #{sneaker.name}"
        end
    end

    def menu
        puts ""
        puts "~ Please make a selection to learn more about THE GOAT's sneakers by selecting a number from the list above."
        puts "~ To end this program, type 'exit'."
        puts "~ What would you like to do?"
        puts ""
    end

    def selection
        input = nil
        while input != "exit"
        input = gets.strip

            if input.to_i > 0 && input.to_i <= JordanHistory::Sneaker.all.length
                jordan = JordanHistory::Sneaker.find_by_index(input.to_i - 1)
                puts "Name - #{jordan.name}"
                puts "Release Date - #{jordan.release_date}"
                puts "Original Price - #{jordan.og_price}"
                puts "Designer - #{jordan.designer}"
                puts "Description - #{jordan.description}"
                puts ""
                sleep 4
                display_jordans
                puts ""
                puts "Would you like to make another selection from the list above?"
                puts "If not, type 'exit' to exit."
                puts ""
            elsif input == "price"
                JordanHistory::Sneaker.sorted_by_price.each do |sneaker|
                    puts "Name - #{sneaker.name}. Price - #{sneaker.og_price}."
                end
                menu
            elsif input == "exit"
                puts ""
                puts "Closing..."
                sleep 1
                puts "Thanks for visiting!!!"
                exit
            else 
                puts ""
                puts "That is not a valid request, please select a number from the list."
                puts ""
                sleep 2
                display_jordans
                menu
            end
        end
    end
end