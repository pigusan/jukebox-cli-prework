def help
  puts "I accept the following commands:"
  puts "- help : displays this help message"
  puts "- list : displays a list of songs you can play"
  puts "- play : lets you choose a song to play"
  puts "- exit : exits this program"
end



def list(my_songs)
  my_songs.collect do |song_name, file_path|
    puts song_name
    song_name
  end
end



def play(my_songs)
  puts "Please enter a song name or number:"
  user_input = gets.chomp
  if my_songs.keys.include?(user_input)
    puts "Now playing #{user_input}"
    system "open #{my_songs[user_input]}"
  else
    puts "Invalid song choice"
    play(my_songs)
  end
end


def exit_jukebox
  puts "Goodbye"
end

def run(my_songs)
  help
  puts "Please enter a command:"
  user_input = gets.chomp
  if user_input == "exit"
    exit_jukebox
  else
    until user_input == 'exit' do
      if user_input == 'help'
        help
        user_input = gets.chomp
      elsif user_input == 'list'
        list(my_songs)
        user_input = gets.chomp
      elsif user_input == 'play'
        play(my_songs)
        user_input = gets.chomp
      else
        puts "Incorrect command, please try again"
        help
        user_input = gets.chomp
      end
    end
    exit_jukebox
  end
end
