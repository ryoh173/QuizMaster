class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.all
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to questions_path, success: 'Quizを作成しました' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to questions_path, info: 'Quizを更新しました' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, danger: 'Quizを削除しました' }
      format.json { head :no_content }
    end
  end

  # 入力された答えの正誤,出題総数,正解数を渡す
  def answer
    question = Question.find(params[:id].to_i)
    answer = params[:answer]
    @result = question.is_correct?(answer, params[:id].to_i)
    @total, @correct = set_total_correct(@result, @total, @correct)
    @result ?  @correct_incorrect = '正解' :  @correct_incorrect = '不正解'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:content, :answer, :total, :correct)
    end

    def set_total_correct(result, total, correct)
      total = params[:total].to_i + 1
      if result
        correct = params[:correct].to_i + 1
      else
        correct = params[:correct].to_i
      end
      return total, correct
    end
end
