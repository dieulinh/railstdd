require 'rails_helper'
RSpec.describe ProductsController, type: :controller do
	context "#index" do
		let!(:new_created_products) { FactoryGirl.create_list(:product, 3) }
	  describe "get" do
      describe "Check if it contains products" do
        it "contains 2 products" do
        	get :index
          expect(assigns(:products).count).to be 3
        end
      end
   end
	end
end