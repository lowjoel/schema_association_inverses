require 'spec_helper'

describe 'Inverse Detection', type: :model do
  class A < ActiveRecord::Base
    has_one :b
  end

  class B < ActiveRecord::Base
    belongs_to :a
  end

  context 'automatic inverse detection' do
    it 'detects inverses' do
      A.new
    end
  end
end
