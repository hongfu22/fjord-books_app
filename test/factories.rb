# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength

FactoryBot.define do
  factory :me, class: User do
    email { 'me@example.com' }
    password { 'password' }
  end

  factory :she, class: User do
    email { 'she@example.com' }
    password { 'password' }
  end

  factory :foo, class: User do
    email { 'foo@test.com' }
    password { 'password' }
  end

  factory :kei, class: User do
    id { 999 }
    email { 'foo@test.com' }
    name { 'kei' }
    password { 'password' }
  end

  factory :mike, class: User do
    email { 'mike@test.com' }
    name { 'mike' }
    password { 'password' }
  end

  factory :alice, class: User do
    id { 999 }
    email { 'alice@example.com' }
    password { 'password' }
  end

  factory :book, class: Book do
    id { 1 }
    title { 'MyString' }
    memo { 'MyText' }
    author { 'alice' }
  end

  factory :report, class: Report do
    title { 'レポートテスト' }
    content { 'レポートテスト' }
    user_id { 999 }
  end

  factory :foo_report, class: Report do
    title { 'テスト' }
    content { 'テスト' }
    user_id { 999 }
  end
end

# rubocop:enable Metrics/BlockLength
