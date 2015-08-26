require 'rails_helper'

describe User do 
  describe "index method" do
    before do
      # user = User.new()
      # user.name = "草テストユーザ"
      # user.password = "password"
      # user.startflg = 1
      # user.deleteflg = 1
      # user.email = 'kai.kusakari@gmail.com'
      # user.auth = '1234567788kusakarikai'
      # user.pref = 49
      # user.mm = 0
      # user.save
    FactoryGirl.create(:user)
	  @user = User.where("name = ?","テストユーザ１").first
    end
    context "normal case." do
      it "not null" do
        expect(@user.hello).not_to be_nil
      end
    end
  end
end
