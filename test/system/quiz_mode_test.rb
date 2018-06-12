require "application_system_test_case"

class QuestionsTest < ApplicationSystemTestCase
  setup do
    @question_1 = questions(:one)
  end
  
  test "quiz_mode" do
    visit quiz_mode_index_url
    assert_selector "h1", text: "QuizMode"
    assert_text '0/0問正解'
    # 1問目(正解)
    fill_in "answer", with: @question_1.answer
    click_on '回答'
    assert_text '正解'
    click_on '次の問題'
    # 2問目(不正解)
    assert_text '1/1問正解'
    fill_in "answer", with: 'incorrect'
    click_on '回答'
    assert_text '不正解'
    click_on '次の問題'
    # 3問目(不正解)
    assert_text '1/2問正解'
    fill_in "answer", with: 'incorrect'
    click_on '回答'
    assert_text '不正解'
    click_on '次の問題'
    # 4問目(正解)
    assert_text '1/3問正解'
    fill_in "answer", with: @question_1.answer
    click_on '回答'
    assert_text '正解'
    click_on '次の問題'
    assert_text '2/4問正解'
  end
end