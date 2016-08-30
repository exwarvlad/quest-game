class Answer
  CURRENT_PATH = File.dirname(__FILE__)

  @answers = []
  amount = 1

  6.times do
    file_path = CURRENT_PATH + "/../data/answers/question_0#{amount}.txt"
    f1 = File.open(file_path, "r:utf-8")
    f2 = f1.readlines
    f1.close
    @answers << f2
    amount +=1
  end

  def self.question(num)
    num -= 1
    @answers[num]
  end
end