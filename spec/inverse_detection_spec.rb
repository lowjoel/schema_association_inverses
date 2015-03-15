require 'spec_helper'

describe 'Inverse Detection', type: :model do
  before(:each) do
    create_tables(
      'test_as', {}, {},
      'test_bs', {}, { a_id: {} }
    )

    class TestB < ActiveRecord::Base
      belongs_to :a
    end

    class TestA < ActiveRecord::Base
      has_many :b, class_name: TestB.name
    end
  end

  context 'automatic inverse detection' do
    it 'detects inverses' do
      expect { TestA.new.b.build() }.to raise_error(ActiveRecord::InverseOfAssociationNotFoundError)
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
