# README

BFD \~who is the Best Fancy Dresser\~
====

## Overview
コスプレ写真の投稿、３種類の評価(cool, cute, creepy)、写真のお気に入り登録、他ユーザーのフォロー、評価別ごとの並べ替え、毎日観点ごとの評価が一番高い写真の表示ができます。

You can post pictures of you in cosplay, evaluate other user's pictures, add awesome ones to favorite, follow other users, sort the pictures in index by evaluation.
you can see the each best pictuer of cool, cute and creepy.


## Description
日本では近年ハロウィンの日に仮装して楽しむ習慣が広まってきています。
市販のものや簡単な手作り、もしくは素人とは思えないような完成度の高いものまで様々です。そんな中でも特に、限りある自分の労力を費やして完成させた思い入れのあるコスプレ衣装を投稿して、ユーザーに評価してもらい順位がわかるようなアプリケーションがあればより多くの人にハロウィンやコスプレを楽しんでもらえるのではないかと考えました。


We've enjoyed wearing costumes on Halloween for several years in Japan.
most costumes are sold at shops or made by hand. However, some of them are high quality works which we can't believe it's made by hand.

I think it's awesome if there is the place where cosplayers can show their favorite, vauted costumes to the world and thier works can be praised.

## Demo
<image src="app/assets/images/bfd_index.png">


## Deployment instructions
URL: https://bfd-new.herokuapp.com/ </br>
caution: Showing the top page needs a little time.

Test account</br>
  email address: test-cosplayer@gmail.com </br>
  password: test-cosplayer



## Technology

```
ruby 2.5.1
MySQL 5.6.47
Haml
Scss
jQuery
```


## Licence

URL:https://github.com/tcnksm/tool/blob/master/LICENCE

## Author

URL: https://github.com/DON4024


## isuue in the future
3つの評価を取り消すことができない
ユーザーのアイコン画像を変更できない


Users cannot cancel after they evaluate pictures.
Users cannot change their own images for profiles.



## features in the future
予定の追加実装は、動画投稿機能と衣装購入機能を考えています。
コスプレ初心者がどのようにして衣装を作ったら良いかわからず、諦めてしまうことを防ぐために、衣装作りの動画をアップできる機能
また、衣装を売買できるようにすることで、衣装作成が困難な方を助け、副業として自分の力を活かす場所を提供できる。

First, I'm going to add the feature of post videos about making thier costume.
It can help who wants to make costume but doens't know how to make it.

Second, I'm going to add the page where users can sell and buy handmade costumes to each other.
It'll help Begginers who can't make costumes with enter the world of cosplay.
And, the feature can give the oppotunity for earning as second job to cosplayers.



## Table of contents
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|image|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false, unique: true|

### Association
- has_many : pictures
- has_many : comments
- has_many : favorites
- has_many :favorites, dependent: :destroy 
has_many :fav_pictures, through: :favorites, source: :picture

 ↓評価機能 cool
- has_many :favorites, dependent: :destroy 
- has_many :cool_pictures, through: :favorites, source: :picture

 ↓評価機能 cute
- has_many :favorites, dependent: :destroy 
- has_many :cute_pictures, through: :favorites, source: :picture

 ↓評価機能 creepy
- has_many :favorites, dependent: :destroy 
- has_many :creepy_pictures, through: :favorites, source: :picture

 ↓フォロー機能
- has_many :relationships
- has_many :followings, through: :relationships, source: :follow
- has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
- has_many :followers, through: :reverse_of_relationships, source: :user

## picturesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|content|string||
|user_id|integer|null: false, foreign_key: true, unique: true|

### Association
- belongs_to :user
- has_many :comments
   ↓お気に入り機能
- has_many :favorites
- has_many :users, through: :favorites
   ↓評価機能 cool
- has_many :cool
- has_many :users, through: :favorites
   ↓評価機能 cute
- has_many :cute
- has_many :users, through: :favorites
   ↓評価機能 creepy
- has_many :cteepy
- has_many :users, through: :favorites

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|comments|string|null: false|
|user_id|integer|null: false, foreign_key: true, unique: true|
|picture_id|integer|null: false, foreign_key: true, unique: true|

### Association
- belongs_to :user
- belongs_to :picture


## favoritesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|picture_id|integer|null: false, foreign_key: true, unique: true|

### Association
- belongs_to :user
- belongs_to :picture
- validates_uniqueness_of :picture_id, scope: :user_id


## relatonshipsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true, unique: true|
|follow_id|integer|null: false, foreign_key: true, unique: true|

### Association
- belongs_to :user
- belongs_to :follow, class_name: 'User'
- validates :user_id, presence: true
- validates :follow_id, presence: true


## coolsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true, unique: true|
|picture_id|integer|null: false, foreign_key: true, unique: true|

### Association
- belongs_to :user
- belongs_to :picture
- validates_uniqueness_of :picture_id, scope: :user_id


## cutesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true, unique: true|
|picture_id|integer|null: false, foreign_key: true, unique: true|

### Association
- belongs_to :user
- belongs_to :picture
- validates_uniqueness_of :picture_id, scope: :user_id


## crepiesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true, unique: true|
|picture_id|integer|null: false, foreign_key: true, unique: true|

### Association
- belongs_to :user
- belongs_to :picture
- validates_uniqueness_of :picture_id, scope: :user_id
