# README
___
# Tsukaru
___
## 概要
___
旅行者からの情報やアドバイスを生かして、ユーザーにより良い温泉体験を実現してもらうことが目的。
___
## コンセプト
温泉好きの人のためのSNS
___
## バージョン情報
Ruby 2.6.4
Rails 5.2.3
___
## 機能一覧
- SNS機能
  - ユーザー登録機能
    - メールアドレス、名前、パスワードは必須
  - ログイン機能
    - メールアドレス、パスワードでログインできる
  - コンテンツ投稿機能
    - コンテンツの一覧を表示できる
    - 画像、テキストが投稿できる
    - 本人のみコンテンツの削除、編集ができる
  - お気に入り機能
    - 他のユーザーの投稿をお気に入り登録できる
  - フォロー機能
    - 他のユーザーをフォローできる
  - コメント機能
    - 投稿にコメントできる
    - 本人のみコメントの削除、編集ができる
- 検索機能
  - 温泉池の場所を泉質で検索できる
  - ユーザーの投稿を検索できる
- 宿泊ガイド機能
  - 宿泊ガイドが表示される

# カタログ設計
___
https://docs.google.com/spreadsheets/d/1nu9Homub02-gxALajiWC8zfkjrg_cSWcxB0mhHRS79g/edit#gid=0
# テーブル定義
___
https://docs.google.com/spreadsheets/d/1nu9Homub02-gxALajiWC8zfkjrg_cSWcxB0mhHRS79g/edit#gid=1928497795
# 画面遷移図
___
https://docs.google.com/spreadsheets/d/1nu9Homub02-gxALajiWC8zfkjrg_cSWcxB0mhHRS79g/edit#gid=1415860087
# 画面ワイヤーフレーム
___
https://docs.google.com/spreadsheets/d/1nu9Homub02-gxALajiWC8zfkjrg_cSWcxB0mhHRS79g/edit#gid=1165959187
# 使用予定Gem
___
- carrierwave
- mini_magic
- ransack
- bulma-rails
