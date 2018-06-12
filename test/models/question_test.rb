require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  setup do
    @question = questions(:one)
  end
  test "question_valid" do
    q = Question.new(content: 'test', answer: 'test')
    assert q.valid?
  end
  
  test "question_invalid" do
    q = Question.new(content: '', answer: 'test')
    assert q.invalid?
    q = Question.new(content: 'test', answer: '')
    assert q.invalid?
    q = Question.new(content: '', answer: '')
    assert q.invalid?
  end
  
  test "is_correct?" do
    assert @question.is_correct?('26', @question.id)
    assert @question.is_correct?('twenty-six', @question.id)
    assert_not @question.is_correct?('27', @question.id)
    assert_not @question.is_correct?('twenty-seven', @question.id)
  end
end
