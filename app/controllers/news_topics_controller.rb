class NewsTopicsController < ApplicationController
  layout proc{ |controller| controller.session[:en] ? "enmain" : "cnmain" }

  def index
    @news_categories = NewsCategory.all
    @news_topics = NewsTopic.find(:all,:order => 'id desc')
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @news_categories = NewsCategory.all
    @news_topic = NewsTopic.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
    end
  end

end
