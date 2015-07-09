require 'rails_helper'
RSpec.describe Product, type: :model do

	context 'Common Validation' do
		it { should validate_presence_of :title }
		it { should validate_presence_of :description }
		it { should validate_numericality_of(:price).
	    is_greater_than(0) }
	end

	context 'Custom Validation' do
	  it "title should shorter than description" do
	  	product = Product.create(title: 'Ruby book', description: 'Book', price: 1)
	  	expect(product.errors[:title]).to include("title is longer than description")
	  end

	  it "Title should be all lowercase" do 
	  	product = Product.create(title: 'Ruby book', description: 'this book for learning Ruby', price: 1)
	  	expect(product.title).to eq product.title.downcase
	  end
	end
  
end