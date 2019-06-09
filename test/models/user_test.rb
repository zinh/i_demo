# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  username        :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = User.new(email: 'test@mail.com',
                     password: '12345678',
                     password_confirmation: '12345678',
                     username: 'test')
  end

  test "should save valid user to db" do
    assert @user.save
  end

  test "should not allow blank email" do
    @user.email = nil
    assert_not @user.save
  end

  test "should note allow invalid email" do
    invalid_emails = %w{invalid@email invaid @}
    invalid_emails.each do |invalid_email|
      @user.email = invalid_email
      assert_not @user.save
    end
  end

  test "should not allow invalid password" do
    invalid_passwords = %w{abc}
    invalid_passwords.each do |invalid_password|
      @user.password = invalid_password
      @user.password_confirmation = invalid_password
      assert_not @user.save
    end
  end

  test "should check password_confirmation" do
    @user.password_confirmation = "another"
    assert_not @user.save
  end

  test "default username" do
    @user.email = 'valid@email.com'
    @user.save!
    assert_equal 'valid', @user.username
  end

  test "uniqueness of email" do
    another_user = @user.dup
    @user.save
    assert_not another_user.save
  end
end
