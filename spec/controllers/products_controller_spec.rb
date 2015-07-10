require 'rails_helper'
RSpec.describe ProductsController, type: :controller do
	context "User can CRUD Products" do
		describe "#index" do
			let!(:new_created_products) { FactoryGirl.create_list(:product, 2) }
	      
	    it " it must list of products" do
	    	get :index
	      expect(assigns(:products).count).to be 2
	    end
		end

		describe "#new" do

			before{ get :new }

			it "should be a product" do
				expect(assigns(:product)).to be_a_new Product
			end
		end

		describe "#create" do
			let!(:product_params) { FactoryGirl.attributes_for(:product) }
			
			it "Products table should have new product by increasing by 1" do
				expect{
					post :create, product: product_params
					}.to change(Product, :count).by(1)
			end
		end

		describe "#edit" do
			def do_request
				get :edit, id: product.id
			end
			let!(:product) { FactoryGirl.create(:product) }

			it "should have product available for render" do
				do_request
		  	expect(assigns(:product)).to eq (product)
			end
		  it "should render product view ready for update" do
		  	expect( do_request).to render_template(:new)
			end
		end

		describe "#update" do
			let!(:product) { FactoryGirl.create(:product) }
			let!(:new_product_params) { FactoryGirl.attributes_for(:product, title: "Python book for you") }
			
			before do
				put :update, id: product.id, product: new_product_params
				product.reload
		  end			

		  it "should update new value after saving Product" do
		  	expect(product.title.downcase).to include("python book for you")
		  end
		end

		describe "#destroy" do
			let!(:product) { FactoryGirl.create(:product) }

			it "Table product should descrease by 1" do
				expect{
					delete :destroy, id: product.id
					}.to change(Product, :count).by(-1)
			end
		end
	end
end