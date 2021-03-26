# アプリケーション名

## Expense App


# アプリケーション概要

## 出費管理をすることができる


# 利用方法

### サインインをする
### 出費を記録する
### topページで確認する
### カテゴリーごと、月ごとに確認する
### 友達を追加する
### 友達の出費と比較する


# 目指した問題解決

## 大学生の出費管理
出費を管理している大学生は少数派で、浪費してしまいがちである。また、現金、QRコード決済などさまざまな支払い方法があり、一元管理が難しくなっている。このアプリケーションを使うことでカテゴリーごとの出費を確認し、主な支出を知ることができる。また、友達と出費を比較することでお金を使いすぎてないか客観的に考える機会を作る。





# テーブル設計

## Users table

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |

### Association

- has_many :expenses

## Expenses table

| Column      | Type       | Options           |
| ----------- | ---------- | ----------------- |
| category_id | integer    | null: false       |
| memo        | text       | null: false       |
| amount      | integer    | null: false       |
| user        | references | foreign_key :true |

### Association

- belongs_to :user