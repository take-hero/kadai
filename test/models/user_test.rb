require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
    @user = User.new(name: "Example User", email: "user@example.com",
                     password: "Foo123!", password_confirmation: "Foo123!")
  end
・
・
・
  test "password validation should accept valid password" do
    valid_passwords = %w[123aBc#! 1a`Df55 $12@vFl S65_mL:]
    valid_passwords.each do |valid_password|
      @user.password= @user.password_confirmation = valid_password
      assert @user.valid?,"#{valid_password.inspect} should be valid"
    end
  end
  
  test "password validation should reject invalid password" do
    valid_passwords = %w[123abc %12@._65 pf$?/vp; 123abc#!]
    valid_passwords.each do |valid_password|
      @user.password= @user.password_confirmation = valid_password
      assert_not @user.valid?,"#{valid_password.inspect} should be valid"
    end
  end  
  # test "the truth" do
  #   assert true
  # end
end
