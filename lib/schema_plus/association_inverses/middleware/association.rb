module SchemaPlus::AssociationInverses
  module Middleware

    module Model
      module Association
        module Declaration

          def after(env)
            reflection = env.model.reflect_on_association(env.name)

            # Cannot check polymorphic relationships
            return if reflection.polymorphic?

            # Explicitly ignored
            return if reflection.options.key?(:inverse_of) && !reflection.options[:inverse_of]

            if !reflection.has_inverse?
              raise ActiveRecord::InverseOfAssociationNotFoundError.new(reflection, env.model)
            end
          end

        end
      end
    end

  end
end
