require "spec_helper"

describe(Answer) do
  describe("#question") do
    it("lists the question the answer resides in") do
      test_question = Question.create({:description => "What is your favorite breed of dog"})
      test_answer = Answer.create({:description => "Grey Hound", :question_id => test_question.id()})
      expect(test_answer.question()).to(eq(test_question))
    end
  end

  describe("#select_answer") do
    it("counts how many times an answer is selected") do
      test_answer = Answer.create({:description => "Grey Hound", :selected => 0})
      test_answer2 = Answer.create({:description => "Grey Hound2", :selected => 0})
      test_answer.select_answer()
      expect(test_answer2.selected()).to(eq(0))
    end
  end
end
