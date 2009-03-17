class ProductsController < ApplicationController
layout proc{ |controller| controller.params[:en] ? "enmain" : "cnmain" }

    def index
      if params[:lang]=='en'
        layout 'enmain'
      end

        if params[:category]
            @products = Product.paginate_by_category_id params[:category],:page => params[:page], :order => 'created_at DESC'
        else
            @products = Product.paginate :page => params[:page], :order => 'created_at DESC'
        end
        @news_categories = NewsCategory.all
        respond_to do |format|
            format.html # index.html.erb
        end
    end

    def show
        @product = Product.find(params[:id])
        @news_categories = NewsCategory.all
        respond_to do |format|
            format.html # show.html.erb
        end
    end

    def search
        if params[:search][:words]
            @products = Product.paginate :conditions=>["name like ?","%#{params[:search][:words]}%"],:page => params[:page], :order => 'created_at DESC'
        else
            @products = Product.paginate :page => params[:page], :order => 'created_at DESC'
        end
        @news_categories = NewsCategory.all
        respond_to do |format|
            format.html {render :template=>"/products/index"}
        end
    end
    def en
      
    end
end
