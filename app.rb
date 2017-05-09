require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"
require "./lib/Survey"
require "./lib/Answer"
require "./lib/Question"
require "pry"

also_reload "lib/**/*.rb"

get "/" do
  erb :index
end

# ******* SURVEY DESIGNER PATH ******

get "/make_surveys" do
  @surveys = Survey.all
  erb :make_surveys_home
end

post "/surveys" do
  name = params.fetch("survey_name")
  @survey = Survey.new({:name => name}).save
  @surveys = Survey.all
  erb :make_surveys_home
end

get "/surveys/:id" do
  @survey = Survey.find(params.fetch('id').to_i)
  @questions = Question.all
  erb :survey
end

patch "/surveys/:id" do
  @survey = Survey.find(params.fetch("id").to_i)
  new_survey = params.fetch("new_survey")
  @survey.update({:name => new_survey})
  erb :survey
end

delete "/surveys/:id" do
  @survey = Survey.find(params.fetch("id").to_i)
  @survey.delete
  redirect("/make_surveys")
end

# QUESTIONS PATH

get "/surveys/:id/questions" do
  @survey = Survey.find(params.fetch('id').to_i)
  @questions = Question.all
  erb :survey
end

post "/surveys/:id/questions" do
  @survey = Survey.find(params.fetch("id").to_i)
  question_name = params.fetch("question_name")
  survey_id = params.fetch("survey_id").to_i
  @question = Question.new({:description => question_name, :survey_id => survey_id}).save
  erb :survey
end

get "/questions/:id" do
  @question = Question.find(params.fetch("id").to_i)
  @answers = Answer.all
  @survey = @question.survey
  erb :question
end

patch "/questions/:id" do
  @question = Question.find(params.fetch("id").to_i)
  new_question = params.fetch("new_question")
  @question.update({:description => new_question})
  erb :question
end

delete "/questions/:id" do
  @question = Question.find(params.fetch("id").to_i)
  survey_id = @question.survey_id
  @question.delete
  redirect("/surveys/#{survey_id}/questions")
end

# ANSWERS PATH

post "/questions/:id/answers" do
  @question = Question.find(params.fetch("id").to_i)
  @survey = @question.survey
  answer_name = params.fetch("answer_name")
  question_id = params.fetch("question_id").to_i
  @answer = Answer.create({:description => answer_name, :question_id => question_id})
  erb :question
end

get "/answers/:id" do
  @answer = Answer.find(params.fetch("id").to_i)
  @question = @answer.question
  @survey = @question.survey
  erb :answer
end

patch "/answers/:id" do
  @answer = Answer.find(params.fetch("id").to_i)
  new_answer = params.fetch("new_answer")
  @answer.update({:description => new_answer})
  @answers = Answer.all
  @question = @answer.question
  @survey = @question.survey
  erb :answer
end

delete "/answers/:id" do
  @answer = Answer.find(params.fetch("id").to_i)
  question_id = @answer.question_id
  @answer.delete
  redirect ("/questions/#{question_id}")
end


# ***** SURVEY TAKER PATH *****

get "/take_surveys" do
  @surveys = Survey.all
  erb :take_surveys_home
end
