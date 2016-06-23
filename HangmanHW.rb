p "Hello please input your name"
name = gets.chomp
p "So #{name} Shall we play hangman"
words = ["learning","computer","mobile","months","cat","dog","cricket","days","pets","sun","horse","monkey","bird","squirrel","ape","fish","lizard","goat","donkey"]

total_chances = 7
correct_guess = ""
incorrect_guess = 0

word = words[rand(words.length) - 1]

def get_space random_word, guessed_words
  space = ""
  random_word.chars { |char| space += (guessed_words.include? char)? char : "_ "}
  space
end

p "Guess what word i have chosen for you (press return to begin):" + get_space(word, "")
char = gets.chomp

while true
  p "Enter letter[ #{total_chances - incorrect_guess} guesses left]:"
  char = gets.chomp
  if word.include? char

    if(correct_guess.include? char)
      puts char + " This was already accepted. "
      puts "Try another letter: "+ get_space(word,correct_guess)
    else
      correct_guess = correct_guess + char
      space = get_space(word,correct_guess)
      p "Nice, next letter!:" + space

      unless space.include? "_"
        p "You Win!"
        break
      end
    end
  else
    p "The word you are guessing does not contain #{char}"
    incorrect_guess = incorrect_guess + 1

    if (incorrect_guess == total_chances)
      p "You have died"
      break
    else
      p "Try another letter" + get_space(word,correct_guess)
    end
  end
end
