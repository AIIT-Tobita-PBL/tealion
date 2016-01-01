#! /usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'pg'

APP_ROOT="#{ENV['TEALION_ROOT']}"


class PostgreSQL
	def initialize()
	end

	def connect()
		conn = PG::connect(
			host: "localhost",
			user: "pi",
			password: "pi",
			dbname: "lifeSoundLog_development"
		)
		return conn
	end

	def sql(conn)
		t = Time.now - 360
		ts = t.strftime("%Y-%m-%d %H:%M")
		msgs = []

		begin
			result = conn.exec(
				"SELECT * FROM log_views"\
				" WHERE updated_at > $1"\
				" ORDER BY updated_at ASC",
				[ts]
			)

			# 各行を処理する
			result.each do |tuple|
				msgs.push(tuple['msg'])
			end
		ensure
			return msgs
		end
	end

	# データベースへのコネクションを切断する
	def close(conn)
 	 conn.finish
	end
end

def parse(msgs)
	debug = Debug.new(true)

	sound_patterns = [
		"施錠音",
		"手洗い音"
	]

	lock_flg = false
	ugai_flg = false

	msgs.each do |msg|
		debug.print(msg)
		if(msg =~ /(\d{4})-(\d{2})-(\d{2}) (\d{2}):(\d{2}) : 環境音\((.*)\)を認識しました/)
			log_time = Time.local($1, $2, $3, $4, $5, 0)
			t = Time.now()
			recog_sound = $6

			# 3分以上経過した施錠音のみフラグを立てる
			if sound_patterns[0] == recog_sound && log_time < t - 300 then
				lock_flg = true
				debug.print("lock")
			end

			# 施錠音のフラグあった場合のみ手洗いを確認する
			if sound_patterns[1] == recog_sound && lock_flg then
				ugai_flg = true
				debug.print("ugai")
			end
		end
	end

	# 施錠音のフラグが立っていて手洗い音のフラグがない場合はうがいを促す
	if lock_flg == true && ugai_flg == false
		tmp = "忘れずにうがいをしてください"
		system("#{APP_ROOT}/bin/talk.sh #{tmp}")
	end
end

class Debug
	def initialize(flg)
		@debug_flg = flg
	end

	def print(msg)
		if @debug_flg
			puts msg
		end
	end
end

db = PostgreSQL.new()
conn = db.connect()
msgs = db.sql(conn)
parse(msgs)
db.close(conn)
