class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :profile,only:[:show,:edit,:update]
  def index
    @profile = Profile.all
  end

  def new
    @profile = current_user.build_profile
  end

  def create
    @profile = current_user.build_profile(profile_params)
    @profile.save
    redirect_to @profile
  end

  def show
    @user = @profile.user
    @questions = @user.questions
    @answers = @user.answers
    @topics = @user.topics
    @followings = @user.followees
    @followers = @user.followers
  end

  private
  def profile_params
    params.require(:profile).permit(:gender,:location,:bio,:avatar)
  end

  def profile
    @profile = Profile.find(params[:id])
  end


end
