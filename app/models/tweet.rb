class Tweet
  include Cequel::Record

  key :id, :text
  column :username, :text, :index => true
  column :body, :text
  column :retweeted, :int
  column :favarited, :int
  set :reply_to, :text
end
