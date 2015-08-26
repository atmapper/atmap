require 'rails_helper'

describe 'GET /welcome/data/' do
	it "get /" do
		get "/"
		expect(response).to render_template :index
	end
end

describe 'GET /welcome/data/' do
	before do
	    @map = FactoryGirl.create(:map)
    	get "/welcome/data/"
	end
	it "get /welcome/data" do
		expect(response).to be_success
    	expect(response.status).to eq(200)
	end
	it "json parse" do
		json = JSON.parse(response.body)
		expect(json[0]['body']).to eq @map.body
		expect(json[0]['clean']).to eq @map.clean
		expect(json[0]['famous']).to eq @map.famous
		expect(json[0]['infoseek']).to eq @map.infoseek
		expect(json[0]['mapname']).to eq @map.mapname
		expect(json[0]['kind']).to eq @map.kind
		expect(json[0]['regist_user']).to eq @map.regist_user
		expect(json[0]['memo']).to eq @map.memo
	end
end