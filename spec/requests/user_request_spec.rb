require 'rails_helper'

describe 'GET /users/' do
	it "get index" do
		get "/users/"
		expect(response).to be_success
    	expect(response.status).to eq(200)
    	json = JSON.parse(response.body)
    	expect(json.to_s).to eq "{}"
	end
end
describe 'POST /users/create' do
	it "post create" do
		params = FactoryGirl.attributes_for(:user).to_json
		request_headers = {
		    "HTTP_ACCEPT" => "application/json",
		    "CONTENT_TYPE" => "application/json",	
		    "DATA_TYPE" => "json"
		}
		expect {
			post "/users/create", params, request_headers
		}.to change { User.count }.by(1)
    	expect(response.status).to eq(200)
    	json = JSON.parse(response.body)
    	expect(json.to_s).to eq "{}"
	end
end
describe 'GET /users/start' do
	before do
		@usertest = FactoryGirl.create(:usertest)
    end
	it "get /users/start" do
		get "/users/start/" + @usertest.auth
		expect(flash[:notice]).to eq "ユーザの確認が終わりました。ATMapを引き続きご利用おねがいします。"
	end
end