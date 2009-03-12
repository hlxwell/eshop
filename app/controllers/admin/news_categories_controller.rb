class Admin::NewsCategoriesController < ApplicationController

  layout 'admin'

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

  # GET /news_categories/new
  # GET /news_categories/new.xml
  def new
    @news_category = NewsCategory.new
    @news_categories = NewsCategory.find(:all)
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @news_category }
    end
  end

  # GET /news_categories/1/edit
  def edit
    @news_category = NewsCategory.find(params[:id])
    @news_categories = NewsCategory.find(:all)
  end

  # POST /news_categories
  # POST /news_categories.xml
  def create
    @news_category = NewsCategory.new(params[:news_category])

    respond_to do |format|
      if @news_category.save
        flash[:notice] = 'NewsCategory was successfully created.'
        format.html { redirect_to(@news_category) }
        format.xml  { render :xml => @news_category, :status => :created, :location => @news_category }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @news_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /news_categories/1
  # PUT /news_categories/1.xml
  def update
    @news_category = NewsCategory.find(params[:id])

    respond_to do |format|
      if @news_category.update_attributes(params[:news_category])
        flash[:notice] = 'NewsCategory was successfully updated.'
        format.html { redirect_to(@news_category) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @news_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /news_categories/1
  # DELETE /news_categories/1.xml
  def destroy
    @news_category = NewsCategory.find(params[:id])
    @news_category.destroy

    respond_to do |format|
      format.html { redirect_to(news_categories_url) }
      format.xml  { head :ok }
    end
  end
#
#  private
#  def get_tree(trees,parent)
#    tree_html=""
#    trees.each do |tree|
#      tree_html+="var tree_#{tree.id}=new WebFXTreeItem('#{tree.name}');\r\n"
#
#      if !tree.children.blank?
#        tree_html+=get_tree(children,tree.id)
#      end
#
#      if parent.blank?
#        tree_html+="tree.add(tree_#{tree.id});"
#      else
#        tree_html+="tree_#{parent}.add(tree_#{tree.id});"
#      end
#    end
#    tree_html
#  end

end
