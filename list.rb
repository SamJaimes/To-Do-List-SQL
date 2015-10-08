require 'pg'

class List
  def initialize(name, id=nil)
    @name = name
    @list_id = id
  end

  def name
    @name
  end

  def self.all
    results = DB.exec("SELECT * FROM lists;")
    lists = []
    results.each do |result|
      name = result['name']
      list_id = result['list_id'].to_i
      lists << List.new(name)
    end
    lists
  end

  def save
    DB.exec("INSERT INTO lists (name) VALUES ('#{@name}', #{@list_id});")
    # @id = results.first['id'].to_i
  end

  def id
    @list_id
  end

  def ==(another_list)
    self.name == another_list.name && self.list_id == another_list.list_id
  end

end
