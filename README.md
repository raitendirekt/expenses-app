#アプリケーション名
Expense App


## アプリケーション概要
#### 出費管理をすることができる
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
![969fc99f0d5c9d9db60cf5cf992f413d](https://user-images.githubusercontent.com/71278326/112833118-3e235680-90d1-11eb-8919-be74616c8b4d.gif)
### カテゴリー別に表示
![7916e79097e95fbc31ab732a5cf351e0](https://user-images.githubusercontent.com/71278326/112834281-c35b3b00-90d2-11eb-8fc7-38163176cf86.gif)
### 月別に表示
![cdbeb62ab3564d3136d01d0c15ac364c](https://user-images.githubusercontent.com/71278326/112834428-ed146200-90d2-11eb-9ecd-81afb9d0ba0a.gif)
### 友達機能
#### 友達
![0dae3108587bcfad65ac0b922f66bfed](https://user-images.githubusercontent.com/71278326/112834591-2351e180-90d3-11eb-80ba-9a9a285e3aca.gif)
#### 友達を探す
![65b6075243cd562763a9fceaccfbb061](https://user-images.githubusercontent.com/71278326/112834719-48deeb00-90d3-11eb-966b-fe55241a4491.gif)
#### 友達かも
![3ce54a7a2d65fb434af766b90edac1fc](https://user-images.githubusercontent.com/71278326/112834798-6744e680-90d3-11eb-8faa-7fd16822c700.gif)
#### マイページ
![6773d35d6e68f52b91291939b4a81415](https://user-images.githubusercontent.com/71278326/112834885-804d9780-90d3-11eb-8a44-e225433a3643.gif)

# ER図
<img width="758" alt="スクリーンショット 2021-03-29 21 45 24" src="https://user-images.githubusercontent.com/71278326/112838659-403ce380-90d8-11eb-82aa-2ced6c0ee60c.png">

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

# ローカルでの操作方法
## コマンド
git clone https://github.com/raitendirekt/expenses-app.git
## 環境
Rails 6.0.3.5 / Ruby 2.6.5 / MySql
