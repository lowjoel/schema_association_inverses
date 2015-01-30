module SchemaAssociationInverses
  module Middleware
    module Association
      def self.insert
        SchemaMonkey::Middleware::Association::Association.append AssociationInverse
      end

      class AssociationInverse < SchemaMonkey::Middleware::Base
        def call(env)
          result = continue env
          unless result
            # Report
          end
          result
        end
      end
    end
  end
end
