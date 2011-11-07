class Java::Db::Task
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  def initialize(attrs = {})
    super()
    load(attrs)
  end

  def load(attrs = {})
    attrs.each do |k,v|
      if self.respond_to?(:"#{k}=")
        self.send(:"#{k}=", v)
      end
    end
  end

  def update_attributes(attrs = {})
    load(attrs)
    save
  end

  def persisted?
    self.id > 0
  end


  #
  # def errors
  #   obj = Object.new
  #   def obj.[](key)         [] end
  #   def obj.full_messages() [] end
  #   obj
  # end
end
