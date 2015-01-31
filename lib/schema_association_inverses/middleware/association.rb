module SchemaAssociationInverses
  module Middleware
    module Association
      def self.insert
        SchemaMonkey::Middleware::Reflection::Association.append AssociationInverse
      end

      class AssociationInverse < SchemaMonkey::Middleware::Base
        def call(env)
          if !env.reflection.polymorphic? && !env.reflection.has_inverse?
            raise ActiveRecord::Associations::InverseOfAssociationNotFoundError.new(env.reflection)
          else
            continue env
          end
        end
      end
    end
  end
end
