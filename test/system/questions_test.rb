require "application_system_test_case"

class QuestionsTest < ApplicationSystemTestCase
  setup do
    @question_1 = questions(:one)
  end

  test "visiting the index" do
    visit questions_url
    assert_selector "h1", text: "Questions"
  end

  test "creating a Question" do
    visit questions_url
    click_on "クイズ作成"
    fill_in "question_content", with: '問題2'
    fill_in "question_answer", with: '2'
    click_on "登録", match: :first
    assert_text "Quizを作成しました"
    # 2行目に作成されたクイズの情報が表示されていることを確認
    within :css, 'table tbody tr:nth-child(2)' do
      assert_selector 'td', text: '問題2'
      assert_selector 'td', text: '2'
      assert_selector 'td', text: '詳細'
      assert_selector 'td', text: '編集'
      assert_selector 'td', text: '削除'
    end
  end

  test "updating a Question" do
    visit questions_url
    click_on "編集", match: :first
    # 登録されている情報が入力されていることを確認
    assert has_field? "question_content", with: 'アルファベットの数は？'
    assert has_field? "question_answer", with: '26'
    fill_in "question_content", with: '日本の都道府県の数は？'
    fill_in "question_answer", with: '47'
    click_on "登録", match: :first
    assert_text "Quizを更新しました"
    # 1行目のクイズ内容が更新されていることを確認
    within :css, 'table tbody tr:nth-child(1)' do
      assert_selector 'td', text: '日本の都道府県の数は？'
      assert_selector 'td', text: '47'
      assert_selector 'td', text: '詳細'
      assert_selector 'td', text: '編集'
      assert_selector 'td', text: '削除'
    end
  end

  test "destroying a Question" do
    visit questions_url
    page.accept_confirm do
      click_on "削除", match: :first
    end
    assert_text "Quizを削除しました"
  end
end
