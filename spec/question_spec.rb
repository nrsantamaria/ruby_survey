require "spec_helper"

describe(Question) do
  describe("#answers") do
    it("lists all the answers of a question") do
      test_question = Question.create({:description => "What is your favorite breed of dog?"})
      test_answer1 = Answer.create({:description => "Golden Retriever", :question_id => test_question.id})
      test_answer2 = Answer.create({:description => "Grey Hound", :question_id => test_question.id})
      expect(test_question.answers()).to(eq([test_answer1, test_answer2]))
    end
  end

  describe("#survey") do
    it("lists the survey that the question resides in") do
      test_survey = Survey.create({:name => "Favorite Dogs"})
      test_question = Question.create({:description => "What is your favorite breed of dog?", :survey_id => test_survey.id()})
      expect(test_question.survey()).to(eq(test_survey))
    end
  end

  describe("#select_answer") do
    it("counts how many times an answer is selected") do
      test_question = Question.create({:description => "What is your favorite breed of dog"})
      test_answer1 = Answer.create({:description => "Grey Hound", :question_id => test_question.id, :selected => 0})
      test_question.select_answer()
      expect(test_answer1.selected()).to(eq(1))
    end
  end

end
