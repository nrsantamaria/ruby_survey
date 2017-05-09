class Question < ActiveRecord::Base
  belongs_to(:survey)
  has_many(:answers)


  def select_answer
    answer_selected = nil
    self.answers.each() do |answer|
      if self.id.==(answer.question_id)
        answer_selected = answer.selected += 1
      end
    end
    answer_selected
  end
end
