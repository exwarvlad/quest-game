class Result
  attr_reader :result1, :result2, :result3, :result4, :result5, :result6

  CURRENT_PATH = File.dirname(__FILE__)

  def initialize
    results = []
    amount = 1

    6.times do
      file_path = CURRENT_PATH + "/../data/results/result_0#{amount}.txt"
      f1 = File.open(file_path, "r:utf-8")
      f2 = f1.readlines
      f1.close
      results << f2
      amount +=1
    end

    @result1 = results[0]
    @result2 = results[1]
    @result3 = results[2]
    @result4 = results[3]
    @result5 = results[4]
    @result6 = results[5]
  end
end