class NewsCategoriesController < ApplicationController
  # GET /news_categories
  # GET /news_categories.xml
  def index
    @news_categories = NewsCategory.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @news_categories }
    end
  end

  # GET /news_categories/1
  # GET /news_categories/1.xml
  def show
    @news_category = NewsCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @news_category }
    end
  end

end
