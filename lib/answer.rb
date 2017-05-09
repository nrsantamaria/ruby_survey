class Answer < ActiveRecord::Base
  belongs_to(:question)

  def select_answer
    self.selected += 1
  end
end
