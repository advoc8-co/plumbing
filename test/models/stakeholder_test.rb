require "test_helper"

class StakeholderTest < ActiveSupport::TestCase
  setup do
    @stakeholder = create(:stakeholder)
  end

  test "valid fixture" do
    assert @stakeholder.valid?
  end
end
