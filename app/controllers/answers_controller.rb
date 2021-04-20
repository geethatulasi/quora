class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :question,only:[:create]

  def index
    @answers = current_user.answers.order(created_at: :desc)
  end
  
  def create
    @answer = @question.answers.create(answer_params)
    if @answer.save
      flash[:notice] = "Answer Saved"
      redirect_to question_path(@question)
    else
      flash[:alert] = "Failed to save answer"
      redirect_to question_path(@question)
    end
  end

  private
  def answer_params
    params.require(:answer).permit(:body).merge(user_id:current_user.id)
  end
  def question
    @question = Question.find(params[:question_id])
  end
end
