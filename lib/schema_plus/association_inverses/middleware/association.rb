module SchemaPlus::AssociationInverses
  module Middleware

    module Model
      module Association
        module Declaration

          def after(env)
            reflection = env.model.reflect_on_association(env.name)
            if !reflection.polymorphic? && !reflection.has_inverse?
              raise ActiveRecord::InverseOfAssociationNotFoundError.new(reflection)
            end
          end

        end
      end
    end

  end
end
