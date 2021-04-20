class TopicsController < ApplicationController
  before_action :authenticate_user!

  def index
    @topics = Topic.all
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      flash[:notice] = "Topic saved"
    else
      flash[:alert] = "Failed to save topic"
    end
      redirect_to topics_path
  end

  def follow
    @topic = Topic.find(params[:id])
    current_user.topics << @topic
    redirect_to topics_path
  end

  def unfollow
    @topic = Topic.find(params[:id])
    current_user.follow_topics.find_by(topic_id:@topic.id).destroy
    redirect_to topics_path
  end

  private
  def topic_params
    params.require(:topic).permit(:name) 
  end
end
