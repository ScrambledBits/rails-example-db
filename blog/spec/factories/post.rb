# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    name { 'MyString' }
    title { 'MyString' }
    content { 'MyText' }
  end
end
