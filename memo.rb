require "csv"

puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"
memo_type = gets.to_i

if memo_type == 1
  puts "新規でメモを作成します。拡張子を除いたファイル名を入力してください。"
  file_name = gets.chomp
  puts "メモの内容を記入して下さい。Enterを押下後Ctrl+Dで保存します。"
  input_memo = STDIN.read
  CSV.open("#{file_name}.csv", "w") do |csv|
    csv << [input_memo.chomp]
  end

elsif memo_type == 2
  puts "既存のメモを編集します。ファイル名を拡張子を除いて入力してください。"
  file_name = gets.chomp
  if File.exist?("#{file_name}.csv")
    puts "編集内容を入力してください。Enterを押下後Ctrl+Dで保存します。"
    input_memo = STDIN.read
    CSV.open("#{file_name}.csv", "a") do |csv|
      csv << [input_memo.chomp]
    end
    puts "メモを編集しました"
  else
    puts "存在しないファイルです"
  end
else
  puts "値が不正です。"
end