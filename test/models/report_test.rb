# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test '#editable？' do
    user = User.new(id: 999, email: 'foo@test.com', name: 'kei')
    report = user.reports.new(title: 'テスト', content: 'テスト')
    p report
    assert_equal true, report.editable?(user)
  end

  test '#created_at?' do
    user = User.new(email: 'mike@test.com', name: 'mike')
    report = Report.new(user_id: user.id, title: 'テスト', content: 'テスト', created_at: Time.zone.now)
    assert_equal Time.zone.now.to_date, report.created_on
  end
end
