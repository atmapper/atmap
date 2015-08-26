require 'rails_helper'

describe Clip do 
  describe "clip model" do
    before do
      clip = Clip.new()
      clip.mapid = 1
      clip.regist_user = 1
      clip.save
	  @clip = Clip.where("mapid = ?", 1).first
    end
    context "normal case." do
      it "not null" do
        expect(@clip.hello).not_to be_nil
      end
      it "mapid = 2 " do
        result_val = @clip.hello
        expect(result_val).to eq 2
      end
    end
  end
end