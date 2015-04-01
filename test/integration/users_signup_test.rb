require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test 'invalid signup' do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, :user => { :name => '', :email => 'user@invalid', :password => 'foo', :password_confirmation => 'bar'}
    end

  end

  test 'valid signup' do
    get signup_path
    post_via_redirect users_path, :user => { :name => 'valid name', :email => 'valsid@email.com', :password => 'password', :password_confirmation => 'password'}

    assert_template 'users/show'
  end

end
