module Devise
  module Orm
    module Neodatis
      module Hook
        def devise_modules_hook!
          extend Schema
          yield
          # return unless Devise.apply_schema
          # devise_modules.each { |m| send(m) if respond_to?(m, true) }
        end
      end

      module Schema
        include Devise::Schema

        # Tell how to apply schema methods
        def apply_devise_schema(name, type, options={})
          # type = Time if type == DateTime
          # field name, { :type => type }.merge!(options)
        end
      end
    end
  end
end

class Java::Db::User
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  include Db::Base

  class << self
    include Devise::Models
    include Devise::Orm::Neodatis::Hook

    def before_validation(*args)

    end

    def to_adapter
      self
    end

    def find_first(opts = {})
      find_by_email(opts[:email])
    end
  end

  devise :database_authenticatable
end




