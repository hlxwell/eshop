class NewsCategoriesController < ApplicationController
layout proc{ |controller| controller.session[:en] ? "enmain" : "cnmain" }
  # GET /news_categories
  # GET /news_categories.xml
  def index
    @headpic=3
    @news_categories = NewsCategory.all
    @news_topics = NewsTopic.find(:all,:order => 'id desc')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @news_categories }
    end
  end

  # GET /news_categories/1
  # GET /news_categories/1.xml
  def show
    @headpic=3
    @news_categories = NewsCategory.all
    @news_topics = NewsTopic.find(:all,:order => 'id desc',
      :conditions => ["news_category_id=?",params[:id]])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @news_category }
    end
  end

end
