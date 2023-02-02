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

| Column                 |  Type   | Options                   |
| ---------------------- | ------- | ------------------------- |
| occupation_id          | integer | null: false               |
| status_id              | integer | null: false               |
| work                   | text    | null: false               |
| training               | text    | null: false               |
| license                | text    | null: false               |
| age                    | string  | null: false               |
| work_area              | string  |                           |
| salary                 | integer | null: false               |
| trial_salary           | integer | null: false               |
| time                   | text    | null: false               |
| holiday                | text    | null: false               |
| benefit                | text    | null: false               |
| benefit_supplement     | text    | null: false               |
| qualification          | text    | null: false               |
| emvironment            | text    | null: false               |
| representative_message | text    | null: false               |
| appeal                 | text    | null: false               |


### Association
- has_many :offers
- belongs_to :company



## offersテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| first_name      | string     | null: false                    |
| last_name       | string     | null: false                    |
| age             | integer    | null: false                    |
| postage_id      | integer    | null: false                    |
| prefecture_id   | integer    | null: false                    |
| city            | srting     | null: false                    |
| house_number    | string     | null: false                    |
| building        | string     | null: false                    |
| email           | string     | null: false                    |
| phone_number    | string     | null: false                    |
| academic_career | string     | null: false                    |
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
