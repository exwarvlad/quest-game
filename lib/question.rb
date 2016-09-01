class Question
  attr_reader :question

  def initialize(amount)
    current_path = File.dirname(__FILE__)

    begin
      file_path = current_path + "/../data/questions/question_0#{amount}.txt"
      f1 = File.open(file_path, "r:utf-8")
      f2 = f1.readlines
      f1.close
      @question = f2
    rescue Errno::ENOENT
      @question = abort "Файл /data/questions/question_0#{amount}.txt поврежден или небыл найден"
    end
  end
end