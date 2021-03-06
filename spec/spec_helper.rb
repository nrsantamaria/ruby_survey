ENV["RACK_ENV"] = "test"

require "rspec"
require "pg"
require "pry"
require "sinatra/activerecord"
require "Survey"
require "Question"
require "Answer"

RSpec.configure do |config|
  config.after(:each) do
    Survey.all.each do |survey|
      survey.destroy
    end
    Question.all.each do |question|
      question.destroy
    end
    Answer.all.each do |answer|
      answer.destroy
    end
  end
end
