require 'schema_plus/core'

module AssociationInverses; end

require_relative 'association_inverses/middleware'
require_relative 'association_inverses/version'

SchemaMonkey.register(SchemaPlus::AssociationInverses)
