class QuestionsController < ApplicationController
  before_action :authenticate_user!

  
  

  def new
    @question = Question.new
    @topics = Topic.all
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:notice] = "Question created successfully"
      redirect_to root_path
    else
      flash[:alert] = "Failed to create question"
      redirect_to root_path
    end
  end

  def show
    @question = Question.find(params[:id])
  end

  private
  def question_params
    params.require(:question).permit(:title,:description,:topic_id).merge(user_id:current_user.id)
  end
end
