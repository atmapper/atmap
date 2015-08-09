class Map
  include Cequel::Record
  key :id, :text
  column :username, :text, :index => true
  column :mapname, :text, :index => true
  column :lat, :text , :index => true
  column :lgn, :text , :index => true
  column :clean, :int
  column :famous, :int
  column :infoseek, :int
  column :body, :text
  set :comment, :text
end
