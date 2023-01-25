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
| person_in_charge   | string     | null: false |
| email              | string     | null: false |
| encrypted_password | string     | null: false |
| postage_id         | integer    | null: false |
| prefecture_id      | integer    | null: false |
| city               | string     | null: false |
| house_number       | string     | null: false |
| building           | string     | null: false |

### Association
- has_many :jobs



## jobsテーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| occupation_id        | integer    | null: false                    |
| employment_status_id | integer    | null: false                    |
| work_area            | text       | null: false                    |
| job_description      | text       | null: false                    |
| emvironment          | text       | null: false                    |
| merit                | text       | null: false                    |
| demerit              | text       | null: false                    |
| benefit_package      | text       | null: false                    |
| pay                  | integer    | null: false                    |
| time                 | string     | null: false                    |
| holiday              | integer    | null: false                    |
| detail               | string     |                                |
| company_id           | references | null: false, foreign_key: true |


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
