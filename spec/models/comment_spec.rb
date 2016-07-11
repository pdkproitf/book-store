# Test model comment
require 'rails_helper'

RSpec.describe Comment, type: :model do

# ******************************************************************************
  let(:comment) { FactoryGirl.create(:comment) }
# ******************************************************************************
  describe 'validate with right db' do
    it { expect(comment).to be_valid }

    context 'book id' do
      it { expect(comment.book_id).to be_truthy }
      it { expect(comment).to validate_numericality_of(:book_id).is_greater_than_or_equal_to(1)
      }
    end

    context 'user id' do
      it { expect(comment.user_id).to be_truthy }
      it { expect(comment).to validate_numericality_of(:user_id).is_greater_than_or_equal_to(1)
      }
    end

    it { expect(comment.desc).to be_truthy }

    it { expect(comment.date).to be_truthy }
  end

  describe 'invalidate' do
    subject do
      comment.desc = nil
      comment.book_id = nil
      comment.user_id = nil
      comment.date = nil
    end

    context 'invalidate desc' do
      it { expect(comment.desc).not_to be_nil }
    end

    context 'invalidate user_id' do
      it { expect(comment.user_id).not_to be_nil }
    end

    context 'invalidate book_id' do
      it { expect(comment.book_id).not_to be_nil }
    end

    context 'invalidate date id' do
      it { expect(comment.date).not_to be_nil }
    end
  end
end
