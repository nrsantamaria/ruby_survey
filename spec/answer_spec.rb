require "spec_helper"

describe(Answer) do
  describe("#question") do
    it("lists the question the answer resides in") do
      test_question = Question.create({:description => "What is your favorite breed of dog"})
      test_answer = Answer.create({:description => "Grey Hound", :question_id => test_question.id()})
      expect(test_answer.question()).to(eq(test_question))
    end
  end
end
