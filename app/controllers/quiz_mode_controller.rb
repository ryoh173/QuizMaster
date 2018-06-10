class QuizModeController < ApplicationController
  def index
    @total ||= 0
    @correct ||= 0
    @question = Question.find(Question.pluck(:id).sample)
    @total = params[:total].to_i
    @correct = params[:correct].to_i
  end

end
