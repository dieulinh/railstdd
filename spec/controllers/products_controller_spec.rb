require 'rails_helper'
RSpec.describe ProductsController, type: :controller do
	context "User can CRUD Products" do
		describe "#index" do
			let!(:new_created_products) { FactoryGirl.create_list(:product, 3) }
	      
	    it " it must list of products" do
	    	get :index
	      expect(assigns(:products).count).to be 3
	    end
		end

		describe "#new" do

			before{
					get :new
				}

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
			let!(:product) { FactoryGirl.create(:product) }

			it "should have product available for render" do
				get :edit, id: product.id
		  	expect(assigns(:product)).to eq (product)
			end
		  it "should render product view ready for update" do
		  	expect(get :edit, id: product.id ).to render_template(:new)
			end
		end

		describe "#update" do
			let!(:product) { FactoryGirl.create(:product) }
			let!(:new_product_params) { {title: "Python book for you", 
																	description: "For you learning Python in 10 years",
																	price: 134 } }
			
			before do
				put :update, id: product.id, product: new_product_params
				product.reload
		  end			

		  it "should update new value after saving Product" do
		  	expect(product.description).to include("For you learning Python in 10 years")
		  	expect(product.price).to eq 134
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