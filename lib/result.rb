class Result
  CURRENT_PATH = File.dirname(__FILE__)

  @results = []
  amount = 1

  6.times do
    file_path = CURRENT_PATH + "/../data/results/result_0#{amount}.txt"
    f1 = File.open(file_path, "r:utf-8")
    f2 = f1.readlines
    f1.close
    @results << f2
    amount +=1
  end

  def self.answer(num)
    num -= 1
    @results[num]
  end
end

