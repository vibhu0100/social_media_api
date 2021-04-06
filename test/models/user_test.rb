require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "the truth" do
    user = User.new
    assert user.save, "Saved without name"
  end
end
