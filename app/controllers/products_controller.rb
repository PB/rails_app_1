class ProductsController < ApplicationController
	before_action :fetch_product, only: [:show, :edit, :update, :destroy, :toggle_status]

	def show
		respond_to do |format|
			format.html
			format.json { render json: @product }
		end
	end

	def index
		@products = Product.all

		respond_to do |format|
			format.json { render json: @products }
		end
	end

	def new

	end

	def edit
	end

	def update
	end

	def destroy
	end

	def toggle_status
		@product.toggle!(:status)
		flash[:notice] = "Successfully changed the status flag."
		redirect_to @product
	end

	def secret_product
		session[:vip] = true
		redirect_to root_path
	end

	private

	def fetch_product
		@product = Product.find(params[:id])
	end
end
