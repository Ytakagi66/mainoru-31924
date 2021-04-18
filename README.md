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

# アプリケーション名
  まいのる

# アプリケーション概要
このアプリではこれまで訪れた神社・寺院の情報や写真を投稿し、そこにコメントを出したりする事で、日記の役割やコミュニケーションツールとして使用する事が出来ます。
また、寺社仏閣の住所情報を取り入れる事によって、その寺社仏閣の地図を確認する事ができるだけでなく、マイページ上でこれまで投稿やコメントした寺社仏閣を日本地図でマーキングする事でこれまで訪れた寺社仏閣の記録として使用する事ができるツールとなっています。

# URL

# テスト用アカウント
- メールアドレス：test@test.com
- パスワード: a12345

# 利用方法
- ログインを行います。未登録の場合は新規登録を行ってください。
- リンクから神社一覧ページか寺院一覧ページへ移動します。
- すでに投稿された寺社仏閣のページに移動するか、画面右上の新規投稿ページから紹介したい寺社仏閣のページへ移動し、画像を投稿したり、紹介文を記入の上新しく投稿を行ってください。(なお、画像は複数枚の投稿が可能です。)
- 詳しい情報を確認した場合はそれぞれの寺社仏閣のページをクリックします。
- 寺社仏閣の画像や住所情報、紹介文を確認する事が出来ます。また、画面下部にはコメント投稿画面が表示され、各種コメントが表示されています。
- 各種コメントを一番下まで行くとそれぞれ御朱印に関するコメントページや祭・神事に関するコメントページへのリンクがあります。
- 各種コメントページではより多くのこれまで投稿されてきたコメントが表示されており、自分でも新たにコメントを画像と共に投稿する事が出来ます。
- プロフィールページでは自己紹介と共にその人がこれまで投稿してきた寺社仏閣情報やコメント情報を投稿した神社や寺院の住所が地図という形で表示されており、過去訪れた場所の記録として利用する事が出来ます。

# 制作背景(意図)
・普段からSNSを使っているので、旅行の思い出が埋もれていくため、ふとした時に振り返りにくい
・神社の紹介サイトはあるが、実際にコミュニティがない為、情報を得られにくい
・有名どころばかりが紹介されていて、ニッチなところを知る機会が少ない
・今まで行った神社がどこだったか忘れてしまう事がある
この様な事があり、今回サイトを作成するに至りました。

# 工夫したポイント
- Google Maps APIを用いた地図機能の実装
- swiperを用いて、投稿された画像を全て見てもらえる様にした
- 御朱印や祭・神事などをページを分ける事で目的別にコメントを探し安くなる様にした。
- 検索機能で住所や名前から検索できる様にして利便性を高めた

# 使用技術(開発環境)
- swiperのgemファイル
- GoogleMapsAPI
- ransackの検索メソッド
- Active Storage
- deviseでのユーザー管理機能

# 課題や今後実装したい機能
- 投稿済みの画像を編集する際に、前に投稿されていた画像がクリアされる為、修正する。
- 御朱印ページなど各種コメントページに季節ごとの情報などを追加したい

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