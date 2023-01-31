# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test '#editable？' do
    user = create(:kei)
    report = create(:foo_report, user_id: user.id)
    assert_equal true, report.editable?(user)
  end

  test '#created_at?' do
    user = create(:mike)
    report = create(:foo_report, user_id: user.id, created_at: Time.zone.now)
    assert_equal Time.zone.now.to_date, report.created_on
  end
end
