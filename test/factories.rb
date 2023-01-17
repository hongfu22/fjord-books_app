# frozen_string_literal: true

FactoryBot.define do
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
end
