class Answer
  attr_reader :answer1, :answer2, :answer3, :answer4, :answer5, :answer6

  CURRENT_PATH = File.dirname(__FILE__)

  def initialize
    answers = []
    amount = 1

    6.times do
      file_path = CURRENT_PATH + "/../data/answers/question_0#{amount}.txt"
      f1 = File.open(file_path, "r:utf-8")
      f2 = f1.readlines
      f1.close
      answers << f2
      amount +=1
    end

    @answer1 = answers[0]
    @answer2 = answers[1]
    @answer3 = answers[2]
    @answer4 = answers[3]
    @answer5 = answers[4]
    @answer6 = answers[5]
  end
end