# README

## 環境

- ruby 2.5.1
- rails 5.2.0

## 環境構築

 **前提: rbenv等で `ruby 2.5.1`を導入しておいてください**

- `cd 作業フォルダ`
- `git clone git@github.com:ryoh173/QuizMaster.git`
- `cd QuizMaster`
- `bundle install --path vendor/bundle`
- `bundle exec rails db:create`
- `bundle exec rails db:migrate`
- `bundle exec rails db:seed`
- `bundle exec rails s`
