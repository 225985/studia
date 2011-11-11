module Db
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
