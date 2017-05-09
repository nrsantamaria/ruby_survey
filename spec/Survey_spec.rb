require "spec_helper"

describe(Survey) do
  describe('#questions') do
    it "lists all the questions within a survey" do
      test_survey = Survey.create({:name => "Favorite Dogs"})
      test_question1 = Question.create({:description => "What is your favorite color of dog?", :survey_id => test_survey.id})
      test_question2 = Question.create({:description => "What is your favorite breed of dog?", :survey_id => test_survey.id})
      expect(test_survey.questions()).to(eq([test_question1, test_question2]))
    end
  end
end
