class ProductsController < ApplicationController
	
	def index
		@products = Product.all
	end

	def new
		@product = Product.new
	end

	def destroy
		@product = Product.find(product_id)
		flash[:notice] = "there is an error while deleting" unless @product.destroy
		redirect_to products_url
	end

	def edit
		@product = Product.find(product_id)
		render :new
	end

	def create
		@product = Product.new(product_params)
		if @product.save
			redirect_to products_url
		else
			render :new
		end
	end

	def update
		@product = Product.find(product_id)
		if @product.update(product_params)
			redirect_to products_url
		else
			flash[:notice] = "there is an error while updating"
			render :new
		end
	end

	private

		def product_id
			params[:id]
		end

		def product_params
			params.require(:product).permit(:title, :description, :price)
		end
end