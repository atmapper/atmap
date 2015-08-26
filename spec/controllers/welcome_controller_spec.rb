require 'rails_helper'

RSpec.describe WelcomeController, :type => :controller do
	it "get /" do
		get :index
		expect(response).to render_template :index
	end
end

RSpec.describe  WelcomeController, :type => :controller do
	before(:each) {
		request.env["HTTP_ACCEPT"] = 'application/json'
	}
	it "get /welcome/data" do
    	get "data"
		expect(response).to be_success
    	expect(response.status).to eq(200)
	end
	it "json parse" do
    	@map = FactoryGirl.create(:map)
    	get "data"
		json = JSON.parse(response.body)
		expect(json['clean']).to eq @map.clean
	end
end