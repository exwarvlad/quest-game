# encoding: utf-8
# Квест Южное Бутово, теперь за гопоту
# Этот код необходим при использовании русских букв на Windows
if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end
###

# подключаю быдлость :)
require_relative 'print_budlost.rb'
require_relative 'lib/answer.rb'
require_relative 'lib/result.rb'

puts

budlost = 30 # стартовое кол-во быдлости

print_budlost(budlost) # метод показывает кол-во быдлости

puts "Вы с пацанами решили прогуляться в Южом Бутово
и наткнулись на неспортивных лохов"

puts Answer.question 1

choice = STDIN.gets.chomp until choice == "1" || choice == "2" || choice == "3" ||
    choice == "4"


if choice == "1"
  puts

  budlost -= 10

  print_budlost(budlost)

  puts "Увы, не получилось"
elsif choice == "2" || choice == "3"
  puts

  budlost += 10

  print_budlost(budlost)

  puts "Лохи расступились, главный вышел и промямлил \"нету\""
end

if choice == "1"
  puts Answer.question 2

  choice = nil # если дошло сюда, надо сбросить choice

  choice2 = STDIN.gets.chomp until choice2 == "1" || choice2 == "2" || choice2 == "3"

  puts

elsif choice == "2" || choice == "3"
  puts Answer.question 3

  choice = nil

  choice = STDIN.gets.chomp until choice == "1" || choice == "2" || choice == "3"

  puts

  if choice == "3"
    budlost -= 5

    print_budlost(budlost)

    puts Result.answer 1
    abort
  end
end

if choice2 == "1" || choice2 == "2"
  puts

  budlost += 10

  print_budlost(budlost)

  puts "Лохи расступились, главный вышел и промямлил \"нету\""
  puts Answer.question 3

  choice = STDIN.gets.chomp until choice == "1" || choice == "2" || choice == "3"
end


if choice == "4" || choice2 == "3"
  puts

  budlost += 10

  print_budlost(budlost)

  puts "Лохи грустно расстались с курточками"
  puts Answer.question 4


  choice = STDIN.gets.chomp until choice == "1" || choice == "2" || choice == "3"


  if choice == "1" || choice == "2"
    puts

    budlost += 10

    print_budlost(budlost)

    puts "Лохи расступились, главный вышел и промямлил \"нету\""
    puts Answer.question 3

    choice = nil

    choice = STDIN.gets.chomp until choice == "1" || choice == "2" || choice == "3"

  else
    puts

    budlost -= 5

    print_budlost(budlost)
    puts Result.answer 1
    abort
  end
end


if choice == "1"
  puts
  budlost += 20

  print_budlost(budlost) # метод показывает кол-во быдлости

  sleep 1

  puts "эмм..."

  sleep 2

  puts Answer.question 5

  choice = nil

  choice = STDIN.gets.chomp until choice == "1" || choice == "2"

  puts

  if choice == "1"
    budlost += 30

    print_budlost(budlost) # метод показывает кол-во быдлости

    random_drop = rand(0..2) # ничего, мобила, семки

    t = Time.now # инсцилизирую время

    if random_drop == 0
      puts Result.answer 2
      abort
    elsif random_drop == 1
      puts Result.answer 3
      abort
      # если на часах больше 22:00 и меньше 8:00 то никто не приезджает (все спят)
    elsif random_drop == 2 && t.hour.between?(8, 22)
      puts Answer.question 6

      choice = STDIN.gets.chomp

      puts

      if choice == "1"
        puts Result.answer 4

        puts

        budlost = 0

        abort print_budlost(budlost).to_s
      elsif choice.upcase == "LEAVEMEALONE" # чит против копов
        abort "Полицейские забыли зачем подходили и вы с ребятами спокойно двинули дальше" # result 5
      else
        puts Result.answer 4

        puts

        budlost = 0

        abort print_budlost(budlost).to_s
      end
    elsif random_drop == 2 # если день
      puts Result.answer 6
      abort
    end

  elsif choice == "2"
    budlost -= 5

    print_budlost(budlost)

    puts Result.answer 1

  end
elsif choice == "3"
  puts

  budlost -= 5

  print_budlost(budlost)

  puts Result.answer 1

elsif choice == "2"
  budlost += 30

  print_budlost(budlost) # метод показывает кол-во быдлости

  random_drop = rand(0..2) # ничего, мобила, семки

  t = Time.now


  if random_drop == 0
    puts Result.answer 2
    abort
  elsif random_drop == 1
    puts Result.answer 3
    abort
    # если на часах больше 22:00 и меньше 8:00 то никто не приезджает (все спят)
  elsif random_drop == 2 && t.hour.between?(8, 22)
    puts Answer.question 6

    choice = STDIN.gets.chomp

    puts

    if choice == "1"
      puts Result.answer 4

      puts

      budlost = 0

      abort print_budlost(budlost).to_s
    elsif choice.upcase == "LEAVEMEALONE" # чит против копов
      puts Result.answer 5
      abort
    else
      puts Result.answer 4

      puts

      budlost = 0

      abort print_budlost(budlost).to_s
    end
  elsif random_drop == 2 # если день
    puts Result.answer 6
    abort
  end

end


