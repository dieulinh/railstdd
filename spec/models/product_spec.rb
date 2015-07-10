require 'rails_helper'
RSpec.describe Product, type: :model do

	context 'Common Validation' do
		it { should validate_presence_of :title }
		it { should validate_presence_of :description }
		it { should validate_numericality_of(:price).is_greater_than(0) }
		
		context "should be all lowercase for title"
			let!(:product) { FactoryGirl.create(:product) }
			it "Title should be all lowercase" do 
		  	expect(product.title).to eq product.title.downcase
		  end
		end
	end

	context 'Custom Validation' do
		let(:product) { FactoryGirl.build(:product, description: 'book') }

	  it "title should shorter than description" do
	  	product.validate
	  	expect(product.errors[:title]).to include("title is longer than description")
	  end
	end  
end