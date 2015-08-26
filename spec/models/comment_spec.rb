require 'rails_helper'

describe Comment do 
  describe "comment model" do
    before do
      comment = Comment.new()
      comment.mapid = 1
      comment.regist_user = 1
      comment.value = "テストコメント"
      comment.save
	  @comment = Comment.where("mapid = ?", 1).first
    end
    context "normal case." do
      it "not null" do
        expect(@comment.hello).not_to be_nil
      end
      it "mapid = 2 " do
        result_val = @comment.hello
        expect(result_val).to eq 2
      end
    end
  end
end
