アプリケーション名
# Expense App


## アプリケーション概要
出費管理をすることができる
URL: https://expenses-app-34489.herokuapp.com/
#### テスト用アカウント
user1
メールアドレス : test@email
パスワード    : test11
user2
メールアドレス : tom@email
パスワード    : tom111


# 利用方法

 - サインインをする
 - 出費を記録する
 - topページで確認する
 - カテゴリーごと、月ごとに確認する
 - 友達を追加する
 - 友達の出費と比較する


# 目指した問題解決

## 大学生の出費管理
出費を管理している大学生は少数派で、浪費してしまいがちである。また、現金、QRコード決済などさまざまな支払い方法があり、一元管理が難しくなっている。このアプリケーションを使うことでカテゴリーごとの出費を確認し、主な支出を知ることができる。また、友達と出費を比較することでお金を使いすぎてないか客観的に考える機会を作る。





# テーブル設計

## Users table

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| user_name          | string  | null: false, unique: true |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |

### Association

- has_many :expenses
- has_many :following_relationships, foreign_key: "follower_id"
- has_many :followings, through: :following_relationships
- has_many :follower_relationships, foreign_key: "following_id"
- has_many :followers, through: :follower_relationships


## Expenses table

| Column      | Type       | Options           |
| ----------- | ---------- | ----------------- |
| category_id | integer    | null: false       |
| memo        | text       | null: false       |
| amount      | integer    | null: false       |
| user        | references | foreign_key :true |

### Association

- belongs_to :user

## Relationships table

| Column       | Type       | Options           |
| ------------ | ---------- | ----------------- |
| follower_id  | integer    | null: false       |
| following_id | integer    | null: false       |

### Association

- belongs_to :follower, class_name: "User"
- belongs_to :following, class_name: "User"
