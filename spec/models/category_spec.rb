require 'rails_helper'

RSpec.describe Category, type: :model do
  context "validation" do
  	it "checks for presence of name" do
  		category = Category.new
  		#got an error when save because in model/category.erb
  		#we say that name cannot be empty
  		category.save

  		expect(category.errors).to_not be_empty
  	end

  	it "name cannot be outside of inclusion_of_name_in []" do
  		category = Category.new(name: "outside")
  		category.save

  		expect(category.errors).to_not be_empty
  	end
  end
end
