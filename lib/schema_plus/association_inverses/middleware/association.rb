module SchemaPlus::AssociationInverses
  module Middleware

    module Model
      module Reflection
        module AssociationReflection

          def before(env)
            if !env.reflection.polymorphic? && !env.reflection.has_inverse?
              raise ActiveRecord::InverseOfAssociationNotFoundError.new(env.reflection)
            end
          end

        end
      end
    end

  end
end
