class Question < ApplicationRecord

  validates :content, presence: true
  validates :answer, presence: true, format: { with: /\A\w+\z/ }

  def is_correct?(form_answer, id)
    # 数字が入力されても単語として判定可能にする
    # DBに登録されている回答が数字の場合、英単語に変換
    answer = remove_space(Question.find(id)[:answer]&.downcase)
    answer = convert_number_to_word(answer.to_i) if number?(answer)
    # フォームに入力された回答が数字の場合、英単語に変換
    form_answer = remove_space(form_answer&.downcase)
    form_answer = convert_number_to_word(form_answer.to_i) if number?(form_answer)
    # 正誤判定
    answer == form_answer
  end

  def number?(string)
    string.to_s =~ /\A[+-]?\d+\Z/
  end

  def convert_number_to_word(params)
    params.to_words # gem 'numbers_and_words'
  end

  def remove_space(string)
    string&.gsub("", "")
  end
end
