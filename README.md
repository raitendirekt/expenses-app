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