class Budlostb
  attr_writer :point

  def initialize
    @point = 0
  end

  # метод выводит всю быдлость на экран
  def show_budlost
    puts "Быдлость: #{@point}"
    puts # отбиваю пустой строкой
  end

  def add_point(num)
    @point += num.to_i
  end
end