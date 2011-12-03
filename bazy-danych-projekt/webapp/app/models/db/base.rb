module Db
  CAST = {
    "java.util.Date"  => lambda {|s| Date.parse(s).to_time rescue nil },
    "int"             => lambda {|s| s.to_i },
    "double"          => lambda {|s| s.to_f },
    "float"           => lambda {|s| s.to_f },
    "db.Milestone"    => lambda {|s| s.blank? ? nil : Db::Milestone.find(s.to_i) },
    "db.Project"      => lambda {|s| Db::Project.find(s.to_i) },
    "db.Task"         => lambda {|s| Db::Task.find(s.to_i) },
    "db.User"         => lambda {|s| Db::User.find(s.to_i) }
  }



  module Base
    extend ActiveSupport::Concern

    module InstanceMethods
      def initialize(attrs = {})
        super()
        load(attrs)
      end

      def load(attrs = {})
        attrs.each do |k,v|
          if self.respond_to?(:"#{k}=")
            Rails.logger.ap k
            Rails.logger.ap v
            # Rails.logger.ap v
            # Rails.logger.ap self.java_class.declared_method_smart("set#{k.to_s.camelcase}")
            # Rails.logger.ap self.java_class.declared_method_smart("set#{k.to_s.camelcase}").argument_types.first.name
            if v.is_a?(String) && m = (self.java_class.declared_method_smart("set#{k.to_s.camelcase}") rescue nil)
              if c = Db::CAST[m.argument_types.first.name]
                v = c.call(v)
              end
            end

            Rails.logger.ap k
            Rails.logger.ap v

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
    end

    module ClassMethods
      def create(attrs = {})
        new(attrs).tap do |o|
          o.save
        end
      end
    end

  end
end
