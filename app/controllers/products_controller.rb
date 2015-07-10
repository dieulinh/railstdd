class ProductsController < ApplicationController
	
	def index
		@products = Product.all
	end

	def new
		@product = Product.new
	end

	def destroy
		@product = Product.find(params[:id])
		@product.destroy
		redirect_to products_url
	end

	def edit
		@product = Product.find(params[:id])
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
		@product = Product.find(params[:id])
		if @product.update(product_params)
			redirect_to products_url
		else
			render :new
		end
	end

	private

		def product_id
			params[:product][:id]
		end

		def product_params
			params.require(:product).permit(:title, :description, :price)
		end
end