class Result
  attr_reader :result

  def initialize(amount) # на вход принимает номер файла
    current_path = File.dirname(__FILE__)

    begin
      file_path = current_path + "/../data/results/result_0#{amount}.txt"
      f1 = File.open(file_path, "r:utf-8")
      f2 = f1.readlines
      f1.close
      @result = f2
    rescue Errno::ENOENT
      @result = abort "Файл /data/results/result_0#{amount}.txt пофрежден или небыл найден"
    end
  end
end