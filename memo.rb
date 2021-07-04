require "csv"
CSV.open('test.csv','w') do |test|
  
  def make_memo
    puts "メモをしたい内容を記入してください"
    puts "完了したらCtrl + Dをおします"
    memo = STDIN.gets.chomp()
  end
  
  memo = []
  while true
  puts "1(新規でメモを作成) 2(既存のメモを編集する)"
  memo_type = gets.chomp
    
  if memo_type == "1"
    puts "拡張子を除いたファイル名を入力してください"
    file_name = gets.chomp
      
    memo.push(make_memo)
      
    require "csv"
    CSV.open("#{file_name}.csv","w") do |csv|
      csv.puts(memo)
    end
      
  elsif memo_type == "2"
    puts "拡張子を除いたファイル名を入力してください"
    file_name = gets.chomp
      
    require "csv"
    CSV.foreach("#{file_name}.csv") do |row|
      p row
    end
      
    memo.push(make_memo)
      
    require "csv"
    CSV.open("#{file_name}.csv","a+") do |csv|
      csv.puts(memo)
    end
      
  end
  end
end
