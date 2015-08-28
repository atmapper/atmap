FactoryGirl.define do
  factory :user do
    name "テストユーザ１"
    password "password"
    email "kai.kusakari@gmail.com"
    auth "12345678900987654321"
    startflg 1
    deleteflg 1
    pref 49
    created_at "2015-01-01 01:01:01"
    updated_at "2015-01-01 01:01:02"
    mm 1
  end
  factory :usertest, :class => User do
    name "認証テストユーザ１"
    password "password"
    email "atmapper@gmail.com"
    auth "12345678900987654321"
    startflg 0
    deleteflg 1
    pref 49
    created_at "2015-01-01 01:01:01"
    updated_at "2015-01-01 01:01:02"
    mm 1
  end
  factory :map do
    body "マップボディ"
    clean 1
    famous 1
    infoseek 1
    mapname "マップ名"
    lat 123.123456
    lgn 99.876543
    kind 49
    regist_user 1
    memo "メモを入力"
    created_at "2015-08-26 20:01:01"
    updated_at "2015-08-26 20:01:02"
  end
end