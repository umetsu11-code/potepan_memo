require "csv" # CSVファイルを扱うためのライブラリを読み込んでいます

puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"

memo_type = gets.to_i # ユーザーの入力値を取得し、数字へ変換しています

# if文を使用して続きを作成していきましょう。
# 「memo_type」の値（1 or 2）によって処理を分岐させていきましょう。
if memo_type == 1
    puts "新規でメモを作成します"
    puts "メモの内容を入力してください"
    memo_content = gets.chomp
    #csvの読み込みを実行する処理
    CSV.open("memos.csv", "w") do |csv|
        csv << [memo_content]
    end

elsif memo_type == 2
    puts "既存のメモを編集します"
    # CSVファイルからメモを読み込み、表示する
    memos = CSV.read("memos.csv")
    memos.each_with_index do |memo, index|
        puts "#{index + 1}: #{memo[0]}"
    end

    puts "編集したいメモの番号を入力してください："
    edit_index = gets.to_i - 1 # 編集したいメモの番号を取得し、配列のインデックスに変換する
    if edit_index >= 0 && edit_index < memos.length
        puts "現在の内容：#{memos[edit_index][0]}"
        puts "新しい内容を入力してください："
        new_content = gets.chomp # 新しい内容をユーザーから受け取る

        # メモを更新する
        memos[edit_index][0] = new_content

        # 更新したメモをCSVファイルに書き込む
        CSV.open("memos.csv", "w") do |csv|
            memos.each do |memo|
                csv << memo
            end
        end
        puts "メモを編集しました"
    else
        puts "無効な番号です"
    end

else
    puts "値が不正です。"
end