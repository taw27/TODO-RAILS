require 'rails_helper'

RSpec.describe Todo, type: :model do
  subject do
    described_class.new(
      todo: 'Test todo',
      status: 'pending'
    )
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'defaults status to pending' do
    todo = Todo.create(todo: 'Test todo')
    expect(todo.status).to eq('pending')
  end

  it 'is not valid without a todo' do
    subject.todo = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid with status not in ["pending", "complete"]' do
    subject.status = 'invalid_status'
    expect(subject).to_not be_valid
  end

  describe '.pending?' do
    it 'returns true when status is pending' do
      subject.status = 'pending'
      expect(subject.pending?).to be true
    end

    it 'returns false when status is not pending' do
      subject.status = 'complete'
      expect(subject.pending?).to be false
    end
  end
end
