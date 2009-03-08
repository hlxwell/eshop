class Admin::CategoriesController < ApplicationController
    layout 'admin'

    def index
        @categories = Category.find(:all)

        respond_to do |format|
            format.html # index.html.erb
        end
    end

    def show
        @category = Category.find(params[:id])

        respond_to do |format|
            format.html # show.html.erb
        end
    end

    def new
        @category = Category.new

        respond_to do |format|
            format.html # new.html.erb
        end
    end

    def edit
        @category = Category.find(params[:id])
    end

    def create
        @category = Category.new(params[:category])

        respond_to do |format|
            if @category.save
                flash[:notice] = 'Category was successfully created.'
                format.html { redirect_to(admin_category_path(@category)) }
            else
                format.html { render :action => "new" }
            end
        end
    end

    def update
        @category = Category.find(params[:id])

        respond_to do |format|
            if @category.update_attributes(params[:category])
                flash[:notice] = 'Category was successfully updated.'
                format.html { redirect_to(admin_category_path(@category)) }
            else
                format.html { render :action => "edit" }
            end
        end
    end

    def destroy
        @category = Category.find(params[:id])
        @category.destroy

        respond_to do |format|
            format.html { redirect_to(admin_categories_url) }
        end
    end
end
