# README
https://damp-reaches-86522.herokuapp.com/
# Tsukaru
## 概要
旅行者からの情報やアドバイスを生かして、ユーザーにより良い温泉体験を実現してもらうことが目的。
## コンセプト
温泉好きの人のためのSNS
## バージョン情報
Ruby 2.6.4
Rails 5.2.3
## 機能一覧
- SNS機能
  - ユーザー登録機能
    - メールアドレス、名前、パスワードは必須
  - ログイン機能
    - メールアドレス、パスワードでログインできる
    - facebook id でログインできる
    - line id でログインできる
  - コンテンツ投稿機能
    - コンテンツの一覧を表示できる
    - 画像、テキストが投稿できる
    - 本人のみコンテンツの削除、編集ができる
  - お気に入り機能
    - 投稿をお気に入り登録できる
  - フォロー機能
    - 他のユーザーをフォローできる
  - コメント機能
    - 投稿にコメントできる
    - 本人のみコメントの削除、編集ができる
- 検索機能
  - 温泉池の場所を泉質で検索できる
  - ユーザーの投稿を検索できる
  - ラベルで投稿記事を検索できる
- 宿泊ガイド機能
  - 宿泊ガイドが表示される
- ラベル機能
  - 投稿にラベルが貼れる

# カタログ設計
https://docs.google.com/spreadsheets/d/1nu9Homub02-gxALajiWC8zfkjrg_cSWcxB0mhHRS79g/edit#gid=0
# テーブル定義
https://docs.google.com/spreadsheets/d/1nu9Homub02-gxALajiWC8zfkjrg_cSWcxB0mhHRS79g/edit#gid=1928497795
# ER図
https://docs.google.com/spreadsheets/d/1nu9Homub02-gxALajiWC8zfkjrg_cSWcxB0mhHRS79g/edit#gid=455075873
# 画面遷移図
https://docs.google.com/spreadsheets/d/1nu9Homub02-gxALajiWC8zfkjrg_cSWcxB0mhHRS79g/edit#gid=1415860087
# 画面ワイヤーフレーム
https://docs.google.com/spreadsheets/d/1nu9Homub02-gxALajiWC8zfkjrg_cSWcxB0mhHRS79g/edit#gid=1165959187
# 使用予定Gem
- ログイン機能
  - devise
  - omniauth
  - omniauth-facebook
  - omniauth-line
- 画像編集機能
  - carrierwave
  - mini_magic
- 検索機能
  - ransack
- CSSフレームワーク
  - bulma-rails
- デバッグ
  - better_errors
  - binding_of_caller
  - pry-rails
- テスト
  - rspec-rails
  - spring-commands-rspec
  - factory_bot_rails
  - capybara
  - selenium-webdriver
  - launchy
- 辞書機能
  - i18n
