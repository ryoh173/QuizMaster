class QuizModeController < ApplicationController
  def index
    @question = Question.find(Question.pluck(:id).sample)
  end

end
