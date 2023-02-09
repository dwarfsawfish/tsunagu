# アプリケーション名
TSUNAGU

# アプリケーション概要
出所者（前科のある者）と雇い入れてくれる企業への情報提供を行うことで、出所者の就労支援をすることができる。

# URL

# テスト用アカウント
・Basic認証パスワード：
・Basic認証ID：
・メールアドレス：
・パスワード：

# 管理者用アカウント
・メールアドレス：admin@admin
・パスワード：admin111

# 利用方法
## 記事投稿
管理者用アカウントのみ、企業・求職者へ向けた記事を投稿することができる。
1.トップページ（一覧ページ）のヘッダーから上記アカウントでログインする
2.ヘッダーの「記事を投稿する」ボタンから、記事の内容（タイトル・記事の種類・内容）を入力し投稿する

## 求人投稿
1.トップページのヘッダーから、「企業の方はこちら」と書かれた新規登録ボタンより、企業アカウント登録を行う
2.トップページの下部、「仕事を登録する」ボタンから、求人情報（職種カテゴリー・雇用形態・仕事内容・入社後の育成・資格・年齢制限・勤務地・給与・試用期間中の給与・勤務時間・休日・待遇・待遇の補足・採用が難しい条件・職場の雰囲気・代表者メッセージ・ひと言アピール・画像）を入力し投稿する

## 応募

# アプリケーションを作成した背景
犯罪により検挙等された者の中に，過去にも検挙等された者がどの程度いるのかを示す指標である「再犯者率」が、
日本では過去最悪の49.1%を記録した。要因として、前科があるため就職ができない、という課題がある。
企業側においては、出所者でも雇い入れてくれる「協力雇用主」を増やす活動が行われており、年々増えてはいるものの、
開拓の余地があるという課題がある。
出所者側においては、土木・建設業の登録が多く、本人の意思や得意なことを活かした就職ができないことで、長続きしないという課題がある。
また、今まで定職についたことがない、就活経験が少ない、という者も多いため、キャリア形成に失敗するという課題もある。

そこで、「企業側・出所者側の双方にとって、有益な情報提供の場が少ない」ことが真因であるという仮説を立てた。
これを解決するために、企業側には協力雇用主になるメリット、出所者側には就活の方法や長く働くコツなどの情報提供を行い、
求人の投稿・応募まで完結できるようなアプリケーションを開発することにした。

# 洗い出した要件

# 実装した機能についての画像やGIFおよび説明

# 実装予定の機能

# データベース設計

# 画面遷移図

# 開発環境

# ローカルでの動作方法
以下のコマンドを順に実行。

# 工夫したポイント


## usersテーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| nickname           | string     | null: false |
| email              | string     | null: false |
| encrypted_password | string     | null: false |
| first_name         | string     | null: false |
| last_name          | string     | null: false |
| admin              | boolean    |             |


### Association
- has_many :offers
- has_many :articles



## companiesテーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| company_name       | string     | null: false |
| category_id        | integer    | null: false |
| prefecture_id      | integer    | null: false |
| city               | string     | null: false |
| house_number       | string     | null: false |
| building           | string     | null: false |
| last_name          | string     | null: false |
| first_name         | string     | null: false |
| email              | string     | null: false |
| encrypted_password | string     | null: false |


### Association
- has_many :jobs



## jobsテーブル

| Column                 |  Type      | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| occupation_id          | integer    | null: false                    |
| status_id              | integer    | null: false                    |
| work                   | text       | null: false                    |
| training               | text       | null: false                    |
| license                | text       | null: false                    |
| age                    | string     | null: false                    |
| work_area              | string     |                                |
| salary                 | integer    | null: false                    |
| trial_salary           | integer    | null: false                    |
| time                   | text       | null: false                    |
| holiday                | text       | null: false                    |
| benefit                | text       | null: false                    |
| benefit_supplement     | text       | null: false                    |
| qualification          | text       | null: false                    |
| emvironment            | text       | null: false                    |
| representative_message | text       | null: false                    |
| appeal                 | text       | null: false                    |
| company_id             | references | null: false, foreign_key: true |


### Association
- has_many :offers
- belongs_to :company



## offersテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| first_name      | string     | null: false                    |
| last_name       | string     | null: false                    |
| age             | integer    | null: false                    |
| prefecture_id   | integer    | null: false                    |
| city            | srting     | null: false                    |
| house_number    | string     | null: false                    |
| building        | string     | null: false                    |
| email           | string     | null: false                    |
| phone_number    | string     | null: false                    |
| academic_career | text       | null: false                    |
| work_history    | text       | null: false                    |
| appeal          | text       |                                |
| user_id         | references | null: false, foreign_key: true |
| job_id          | references | null: false, foreign_key: true |

### Association
- belongs_to :job
- belongs_to :user



## articlesテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| title   | string     | null: false                    |
| content | text       | null: false, foreign_key: true |
| user_id | references | null: false, foreign_key: true |


### Association
- belongs_to :user
