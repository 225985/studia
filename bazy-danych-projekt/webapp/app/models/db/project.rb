class Java::Db::Project
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  include Db::Base

  def tasks
    ListProxy.new(self, :tasks, :project, Db::Task)
  end
end

class ListProxy
  def initialize(parent, coll, pname, klazz)
    @parent = parent
    @coll = coll
    @pname = pname
    @klazz = klazz
  end

  def method_missing(name, *args, &block)
    __coll.send(name, *args, &block)
  end

  def find(id)
    __coll.find {|e| e.id == id.to_i }
  end

  def create(attrs = {})
    obj = @klazz.new(attrs.merge(@pname => @parent))
    __coll << obj
    obj.save
    obj
  end

  def __coll
    @parent.send("get_#{@coll}")
  end
end
