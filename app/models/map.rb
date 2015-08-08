class Map
  include Cequel::Record
  key :id, :text
  column :username, :text, :index => true
  column :mapname, :text, :index => true
  column :lat, :text
  column :lgn, :text
  column :body, :text
  column :clean, :int
  column :famous, :int
  column :infoseek, :int
  set :comment, :text
end
