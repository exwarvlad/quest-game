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

require_relative 'lib/question.rb'
require_relative 'lib/result.rb'
require_relative 'lib/budlostb.rb'

# экземпляры квестов
question1 = Question.new(1).question
question2 = Question.new(2).question
question3 = Question.new(3).question
question4 = Question.new(4).question
question5 = Question.new(5).question
question6 = Question.new(6).question

# экземпляры результатов
result1 = Result.new(1).result
result2 = Result.new(2).result
result3 = Result.new(3).result
result4 = Result.new(4).result
result5 = Result.new(5).result
result6 = Result.new(6).result

# быдлость
budlostb = Budlostb.new

# задаю стартовое кол-во быдлости
budlostb.add_point(30)

puts

budlostb.show_budlost # показываю кол-во быдлости

puts "Вы с пацанами решили прогуляться в Южом Бутово
и наткнулись на неспортивных лохов"

puts question1

choice = STDIN.gets.chomp until choice == "1" || choice == "2" || choice == "3" ||
    choice == "4"

if choice == "1"
  puts

  budlostb.add_point(-10)
  budlostb.show_budlost

  puts "Увы, не получилось"
elsif choice == "2" || choice == "3"
  puts

  budlostb.add_point(10)
  budlostb.show_budlost

  puts "Лохи расступились, главный вышел и промямлил \"нету\""
end

if choice == "1"
  puts question2

  choice = nil # если дошло сюда, надо сбросить choice

  choice2 = STDIN.gets.chomp until choice2 == "1" || choice2 == "2" || choice2 == "3"

elsif choice == "2" || choice == "3"
  puts question3

  choice = nil

  choice = STDIN.gets.chomp until choice == "1" || choice == "2" || choice == "3"

  if choice == "3"
    budlostb.add_point(-5)
    budlostb.show_budlost

    puts result1
    abort
  end
end

if choice2 == "1" || choice2 == "2"
  puts

  budlostb.add_point(10)
  budlostb.show_budlost

  puts "Лохи расступились, главный вышел и промямлил \"нету\""
  puts question3

  choice = STDIN.gets.chomp until choice == "1" || choice == "2" || choice == "3"
end


if choice == "4" || choice2 == "3"
  puts

  budlostb.add_point(10)
  budlostb.show_budlost

  puts "Лохи грустно расстались с курточками"
  puts question4

  choice = STDIN.gets.chomp until choice == "1" || choice == "2" || choice == "3"

  if choice == "1" || choice == "2"

    budlostb.add_point(10)
    budlostb.show_budlost

    puts "Лохи расступились, главный вышел и промямлил \"нету\""
    puts question3

    choice = nil

    choice = STDIN.gets.chomp until choice == "1" || choice == "2" || choice == "3"
  else
    puts

    budlostb.add_point(-5)
    budlostb.show_budlost

    puts result1
    abort
  end
end

if choice == "1"
  puts

  budlostb.add_point(20)
  budlostb.show_budlost # метод показывает кол-во быдлости

  sleep 1

  puts "эмм..."

  sleep 2

  puts question5

  choice = nil

  choice = STDIN.gets.chomp until choice == "1" || choice == "2"

  puts

  if choice == "1"
    budlostb.add_point(30)
    budlostb.show_budlost # метод показывает кол-во быдлости

    random_drop = rand(0..2) # ничего, мобила, семки

    t = Time.now # инсцилизирую время

    if random_drop == 0
      puts result2

    elsif random_drop == 1
      puts result3

      # если на часах больше 22:00 и меньше 8:00 то никто не приезджает (все спят)
    elsif (random_drop == 2 || random_drop == 0) && t.hour.between?(8, 22)
      puts question6

      choice = STDIN.gets.chomp

      if choice == "1"
        puts result4

        puts

        budlostb.point = 0
        puts budlostb.show_budlost
        abort
      elsif choice.upcase == "LEVEMEALONE" # чит против копов
        puts result5
        abort
      else
        puts result4
        budlostb.point = 0
        puts budlostb.show_budlost
        abort
      end
    elsif random_drop == 2 # если день
      puts result6
      abort
    end

  elsif choice == "2"
    budlostb.add_point(-5)
    budlostb.show_budlost

    puts result1

  end
elsif choice == "3"
  puts

  budlostb.add_point(-5)
  budlostb.show_budlost

  puts result1

elsif choice == "2"
  budlostb.add_point(30)
  budlostb.show_budlost # метод показывает кол-во быдлости

  random_drop = rand(0..2) # ничего, мобила, семки

  t = Time.now

  if random_drop == 0
    puts result2

  elsif random_drop == 1
    puts result3

    # если на часах больше 22:00 и меньше 8:00 то никто не приезджает (все спят)
  elsif (random_drop == 2 || random_drop == 0) && t.hour.between?(8, 22)
    puts question6

    choice = STDIN.gets.chomp

    if choice == "1"
      puts result4

      puts

      budlostb.point = 0
      puts budlostb.show_budlost
      abort
    elsif choice.upcase == "LEVEMEALONE" # чит против копов
      puts result5
      abort
    else
      puts result4

      puts

      budlostb.point = 0
      puts budlostb.show_budlost
      abort
    end
  elsif random_drop == 2 # если день
    puts result6
    abort
  end
end