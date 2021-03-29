#アプリケーション名
Expense App


## アプリケーション概要
出費管理をすることができる
URL: https://expenses-app-34489.herokuapp.com/
#### テスト用アカウント
##### user1
メールアドレス : test@email
パスワード    : test11
##### user2
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

# 要件定義

## ユーザー管理機能
### 目的
ユーザーごとに出費を管理し、友達同士で出費を比較するため。
### 詳細
deviseを用いた実装。友達の出費と自分の出費を比較し、その差額で今月使いすぎてないか確かめる。
### ユースケース
サイトにログインするとまずユーザー認証を求める。ニックネーム、ユーザーネーム、メールアドレス、パスワード、パスワードの確認を入力する。ログイン後はヘッダーの右上にログアウトボタンが表示される。ログアウトすると最初のログイン画面に戻る。ユーザー名をクリックするとユーザー詳細画面に遷移する。サイドバーから友達確認、友達検索、友達申請を確認できる。友達確認では相手のニックネーム、相手の今月の出費額、自分との差額を表で確認できる。友達検索をするときは検索バーに相手のユーザーネームを入力する。一部ヒットでも表示される。表示されたユーザーのニックネームの下にフォローかアンフォローが表示される。どちらかをクリックすることで友達申請または友達解除を行うことができる。友達かもには友達申請をした相手のニックネーム、id(ユーザーネーム)、許可フォームが表示される。許可をクリックするとその相手と友達になり、「友達」から確認できるようになる。
## 支出管理機能
### 目的
月別、カテゴリー別に出費を確認するため。
### 詳細
支出を記録し、月にいくら使ったか確認する。カテゴリー別に出費をまとめ、どういった類いのものに浪費しているか確認する。
### ユースケース
記録ボタンをクリックすると出費記録ページに遷移する。カテゴリーを選択する、必要であればメモをかく、金額を半角数字で入力、日付を登録する。保存ボタンを押して完了する。保存に失敗すると支出記録ページにもどる。保存に成功するとトップページに遷移する。サイドバーの「カテゴリー別」をクリックするとカテゴリー別のページに遷移する。サイドバーの「月別」をクリックすると月別のページに遷移する。

## 機能
### 出費保存


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
