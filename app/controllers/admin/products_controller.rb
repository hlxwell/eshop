class Admin::ProductsController < ApplicationController
    layout 'admin'

    def index
        @products = Product.find(:all)

        respond_to do |format|
            format.html # index.html.erb
        end
    end

    def show
        @product = Product.find(params[:id])

        respond_to do |format|
            format.html # show.html.erb
        end
    end

    def new
        @product = Product.new

        respond_to do |format|
            format.html # new.html.erb
        end
    end

    def edit
        @product = Product.find(params[:id])
    end

    def create
        @product = Product.new(params[:product])

        respond_to do |format|
            if @product.save
                flash[:notice] = 'Product was successfully created.'
                format.html { redirect_to(upload_picture_admin_product_path(@product)) }
            else
                format.html { render :action => "new" }
            end
        end
    end

    def update
        @product = Product.find(params[:id])        

        respond_to do |format|
            if @product.update_attributes(params[:product])
                flash[:notice] = 'Product was successfully updated.'
                format.html { redirect_to(admin_product_path(@product)) }
            else
                format.html { render :action => "edit" }
            end
        end
    end

    def destroy
        @product = Product.find(params[:id])
        @product.destroy

        respond_to do |format|
            format.html { redirect_to(admin_products_url) }
        end
    end
end
