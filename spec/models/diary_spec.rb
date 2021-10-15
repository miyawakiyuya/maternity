require 'rails_helper'

RSpec.describe Diary, type: :model do
    it '投稿日がないと無効です' do
        diary = Diary.new()
        diary.valid?
        expect(diary.errors.messages[:start_time]).to include('を入力してください')
    end

    it 'タイトルがないと無効です' do
        diary = Diary.new()
        diary.valid?
        expect(diary.errors.messages[:title]).to include('を入力してください')
    end

    it '内容がないと無効です' do
        diary = Diary.new()
        diary.valid?
        expect(diary.errors.messages[:body]).to include('を入力してください')
    end
  pending "add some examples to (or delete) #{__FILE__}"
end
