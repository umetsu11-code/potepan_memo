require "csv" # CSVファイルを扱うためのライブラリを読み込んでいます

puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"

memo_type = gets.to_i # ユーザーの入力値を取得し、数字へ変換しています

# if文を使用して続きを作成していきましょう。
# 「memo_type」の値（1 or 2）によって処理を分岐させていきましょう。
    if memo_type == 1
        puts "新規でメモを作成します。拡張子を除いたファイル名を入力してください。"
        file_name = gets.chomp
        
        puts"メモの内容を記入して下さい。Ctrl+Dで保存します。"
        imput_memo = STDIN.read
        memo = imput_memo.chomp
        
        CSV.open("#{file_name}.csv", "w") do |csv|
        csv << [memo]
        end

      elsif memo_type == 2
        puts "既存のメモを編集します"
      
        # CSVファイルからメモを読み込み、表示する
        puts "編集したいメモのファイル名を拡張子を除いて入力してください。"
        file_name = gets.chomp
      
        # 指定されたファイルが存在するかチェック
        if File.exist?("#{file_name}.csv")
          memos = CSV.read("#{file_name}.csv")
          memos.each_with_index do |memo, index|
          end
      
          # メモの内容を編集する処理
          puts "編集内容を入力してください。Ctrl+Dで保存します。"
          input_memo = STDIN.read.chomp
          memo = input_memo.chomp
      
          # 更新したメモをCSVファイルに書き込む
          CSV.open("#{file_name}.csv", "a") do |csv|
            memos.each do |memo|
              csv << memo
            end
          end
          puts "メモを編集しました"
        else
          puts "存在しないファイルです"
        end
      else
        puts "値が不正です。"
      end