require 'spec_helper'

describe 'Inverse Detection', type: :model do
  class TestB < ActiveRecord::Base; end
  class TestA < ActiveRecord::Base; end

  before(:each) do
    create_tables(
      'test_as', {}, {},
      'test_bs', {}, { a_id: {} }
    )
  end

  context 'inverse detection' do
    it 'detects inverses being set' do
      expect { TestB.belongs_to :a, inverse_of: :b }.to_not raise_error
    end

    it 'raises errors when inverses are not detected' do
      expect { TestA.has_many :b, class_name: TestB.name }.to raise_error(ActiveRecord::InverseOfAssociationNotFoundError)
    end

    it 'ignores polymorphic associations' do
      expect { TestA.belongs_to :c, polymorphic: true }.to_not raise_error
    end
  end

  protected

  def create_tables(*table_defs)
    ActiveRecord::Migration.suppress_messages do
      ActiveRecord::Base.connection.tables.each do |table|
        ActiveRecord::Migration.drop_table table
      end
      table_defs.each_slice(3) do |table_name, opts, columns_with_options|
        ActiveRecord::Migration.create_table table_name, opts do |t|
          columns_with_options.each_pair do |column, options|
            coltype = options.delete(:coltype) || :integer
            t.send coltype, column, options
          end
        end
      end
    end
  end
end
