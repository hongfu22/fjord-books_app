# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  setup do
    create(:alice)
    @report = create(:report)
    visit root_url
    fill_in 'user_email', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  test 'visiting the index' do
    visit reports_url
    assert_selector 'h1', text: '日報'
  end

  test 'create a Report' do
    visit reports_url
    click_on '新規作成'

    fill_in 'タイトル', with: @report.title
    fill_in '内容', with: @report.content
    click_on '登録する'

    assert_text '日報が作成されました。'
    assert_text 'レポートテスト'
    click_on '戻る'
  end

  test 'update a Report' do
    visit reports_url
    click_on '編集'

    fill_in 'タイトル', with: 'Report Test'
    fill_in '内容', with: 'Report Content'
    click_on '更新'

    assert_text '日報が更新されました。'
    assert_text 'Report Test'
    click_on '戻る'
  end

  test 'destroy a Report' do
    visit reports_url
    page.accept_confirm do
      click_on '削除', match: :first
    end

    assert_text '日報が削除されました。'
    assert_no_text 'レポートテスト'
  end
end
