#! /usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'pg'

# データベース接続する（不要なものは指定しなくても良い。:port は標準で 5432 が使用される模様）
#connection = PG::connect(:host => "localhost", :user => "postgres", :password => "postgres ユーザのパスワード", :dbname => "スキーマの名前", :port => "ポート番号")
connection = PG::connect(host: "localhost", user: "pi", password: "\n", dbname: "lifeSoundLog_development")
#connection = PG::connect(host: "localhost", dbname: "lifeSoundLog_development")
begin
  # connection を使い PostgreSQL を操作する
  # ...
ensure
  # データベースへのコネクションを切断する
  connection.finish
end

#result = connection.exec("SELECT value1, value2 FROM table1 WHERE key1 = $1 AND key2 = $2", [key1, key2])
result = connection.exec("SELECT * FROM log_views;")

# 各行を処理する
result.each do |tuple|
  puts tuple['value1']
  puts tuple['value2']
end
