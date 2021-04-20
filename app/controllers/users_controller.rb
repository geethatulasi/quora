class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all - [current_user]
  end

  def show
    @user = User.find(params[:id])
    @questions = @user.questions
    @answers = @user.answers
    @topics = @user.topics
    @followings = @user.followees
    @followers = @user.followers
  end

  def follow
    @user = User.find(params[:id])
    current_user.followees << @user
    redirect_to users_path
  end

  def unfollow
    @user = User.find(params[:id])
    current_user.followed_users.find_by(followee_id:@user.id).destroy
    redirect_to users_path
  end

  def questions
    @questions = current_user.questions.order(created_at: :desc)
  end

  def answers
    @answers = current_user.answers.order(created_at: :desc)
  end


end
