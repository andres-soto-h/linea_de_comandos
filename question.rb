class Question
  attr_reader :question_list, :seed, :keys, :current_ans, :items

  def initialize
    @question_list = {}
    question_file = IO.readlines('questions.txt')

    question_file.each do |question|
      dato_split = question.split('->')
      @question_list[dato_split[0]] = dato_split[1]
    end
    @seed = rand(0..question_list.length)
    @items = question_list.length
    @keys = @question_list.keys
  end

  def new_question
    if !@question_list.empty?
      @seed = rand(0..@items) until @question_list.key?(@keys[@seed])
      puts '* ' + @question_list[@keys[@seed]]
      @current_ans = @keys[@seed]
      @question_list.delete(@keys[@seed])
    else
      false
    end
  end

  def check_questions
    if !@question_list.empty?
      true
    else
      false
    end
  end

  def check_ans(ans)
    @current_ans.casecmp(ans).zero?
  end
end
