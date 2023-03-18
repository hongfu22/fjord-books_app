# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test '#name_or_email' do
    user = create(:foo)
    assert_equal 'foo@test.com', user.name_or_email
    user.name = 'FooBar'
    assert_equal 'FooBar', user.name_or_email
  end

  test '#follow' do
    me = create(:me)
    she = create(:she)
    me.follow(she)
    assert me.following?(she)
  end

  test '#unfollow' do
    me = create(:me)
    she = create(:she)
    me.unfollow(she)
    assert_not me.following?(she)
  end

  test '#followed_by?' do
    me = create(:me)
    she = create(:she)
    me.follow(she)
    assert she.followed_by?(me)
  end
end
