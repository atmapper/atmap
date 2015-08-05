class Map
  include Cequel::Record

  key :id, :text
  column :mapname, :text, :index => true
  column :body, :text
  column :clean, :int
  column :famous, :int
  column :infoseek, :int
  set :comment, :text
end
