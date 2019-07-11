require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.new(name: "tamil", email: "tamilcrea@gmail.com")
  end

  test "should be valid have  valid " do
    assert @user.valid?
  end


  test "name should  be  long" do
    @user.name = "a" * 51
    assert @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert @user.valid?
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email addresses should be unique" do
  duplicate user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end
  end
