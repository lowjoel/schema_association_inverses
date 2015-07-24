module SchemaPlus::AssociationInverses
  module Middleware

    module Model
      module Association
        module Declaration

          def after(env)
            model = env.model
            reflection = model.reflect_on_association(env.name)

            # Cannot check polymorphic relationships
            return if reflection.polymorphic?

            # Cannot check HABTM relationships, models, or through: relationships
            return if model.name =~ /^HABTM_/
            return if reflection.is_a?(ActiveRecord::Reflection::HasAndBelongsToManyReflection)
            return if reflection.is_a?(ActiveRecord::Reflection::ThroughReflection)

            # Explicitly ignored
            return if reflection.options.key?(:inverse_of) && !reflection.options[:inverse_of]

            if !reflection.has_inverse?
              raise ActiveRecord::InverseOfAssociationNotFoundError.new(reflection, model)
            end
          end

        end
      end
    end

  end
end
