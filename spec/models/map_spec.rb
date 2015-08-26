require 'rails_helper'

describe Map do 
  describe "map model" do
    before do
      map = Map.new()
      map.clean = 1
      map.famous = 1
      map.infoseek = 1
      map.mapname = 'マップ名'
      map.lat = 122.123456
      map.lgn = 98.123456
      map.kind = 1
      map.regist_user = 1
      map.memo = 'メモばっかり'
      map.save
	  @map = Map.where("mapname = ?","マップ名").first
    end
    context "normal case." do
      it "not null" do
        expect(@map.hello).not_to be_nil
      end
      it "kind 9 > 14 " do
        result_val = @map.hello
        expect(result_val).to eq 10
      end
    end
  end
end
