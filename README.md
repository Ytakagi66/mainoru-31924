# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column                | Type   | Options                   |
| ----------------------|------- | ------------------------- |
| nickname              | string | null: false               |
| email                 | string | null: false, unique: true |
| encrypted_password    | string | null: false               |
| prefecture_id         | integer| null: false               |
| birthday              | date   | null: false               |
| self_info             | text   |                           |
| favorite              | string |                           |

### Association

- has_many :temples
- has_many :shrines
- has_many :comments

## temples テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false, unique: true      |
| info            | text       | null: false                    |
| benefits_id     | integer    | null: false                    |
| prefecture_id   | integer    | null: false                    |
| city            | string     | null: false                    |
| address         | string     | null: false                    |
| latitude        | float      | null: false                    |
| longitude       | float      | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association
- has_many :comments, through: temple_comments
- has_many :goshuin, through: temple_goshuins
- has_many :natures, through: temple_natures
- has_many :histories, through: temple_histories
- has_many :builds, through: temple_builds
- belongs_to :user

## shrines テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false, unique: true      |
| info            | text       | null: false                    |
| benefits_id     | integer    | null: false                    |
| prefecture_id   | integer    | null: false                    |
| city            | string     | null: false                    |
| address         | string     | null: false                    |
| latitude        | float      | null: false                    |
| longitude       | float      | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

- has_many :comments, through: shrine_comments
- has_many :goshuin, through: shrine_goshuins
- has_many :natures, through: shrine_natures
- has_many :histories, through: shrine_histories
- has_many :builds, through: shrine_builds
- belongs_to :user

## temple_comments テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| temple         | references | null: false, foreign_key: true |
| comment        | references | null: false, foreign_key: true |

### Association

- belongs_to :temple
- belongs_to :comment

## shrine_comments テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| shrine         | references | null: false, foreign_key: true | 
| comment        | references | null: false, foreign_key: true |

### Association

- belongs_to :shrine
- belongs_to :comment

## goshuins テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| title           | string     | null: false                    |
| content         | text       | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

- has_many :temples, through: temple_goshuins
- has_many :shrines, through: shrine_goshuins
- belongs_to :user

## natures テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| title           | string     | null: false                    |
| content         | text       | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

- has_many :temples, through: temple_natures
- has_many :shrines, through: shrine_natures
- belongs_to :user

## histories テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| title           | string     | null: false                    |
| content         | text       | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

- has_many :temples, through: temple_histories
- has_many :shrines, through: shrine_histories
- belongs_to :user

## builds テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| title           | string     | null: false                    |
| content         | text       | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

- has_many :temples, through: temple_builds
- has_many :shrines, through: shrine_builds
- belongs_to :user

## goshuin_comments テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| goshuin        | references | null: false, foreign_key: true |
| comment        | references | null: false, foreign_key: true |

### Association

- belongs_to :goshuin
- belongs_to :comment

## nature_comments テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| nature         | references | null: false, foreign_key: true |
| comment        | references | null: false, foreign_key: true |

### Association

- belongs_to :nature
- belongs_to :comment

## history_comments テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| history         | references | null: false, foreign_key: true |
| comment        | references | null: false, foreign_key: true |

### Association

- belongs_to :histories
- belongs_to :comment

## build_comments テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| build         | references | null: false, foreign_key: true |
| comment        | references | null: false, foreign_key: true |

### Association

- belongs_to :build
- belongs_to :comment

## comments テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| content      | text       |                                |
| user         | references | null: false, foreign_key: true |

### Association

- has_many :temples, through: temple_comments
- has_many :shrines, through: shrine_comments
- has_many :goshuins, through: goshuin_comments
- has_many :natures, through: nature_comments
- has_many :histories, through: history_comments
- has_many :builds, through: build_comments
- belongs_to :user