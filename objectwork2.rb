class VendingMachine
  # attr_accessor :slot_money, :cola_stock, :sales_amount
  # ステップ０　お金の投入と払い戻しの例コード
  # ステップ１　扱えないお金の例コード

  # 10円玉、50円玉、100円玉、500円玉、1000円札を１つずつ投入できる。
  MONEY = [10, 50, 100, 500, 1000].freeze

  # （自動販売機に投入された金額をインスタンス変数の @slot_money に代入する）
  def initialize
    # 最初の自動販売機に入っている金額は0円
    @slot_money = 0
    @drink_stocks = [],[],[]
    5.times{@drink_stocks[0]<<{name: "cola", price: 120}}
    5.times{@drink_stocks[1]<<{name: "redbull", price: 200}}
    5.times{@drink_stocks[2]<<{name: "water", price: 100}}
    @sales_amount = 0
  end

  def drink_stocks_list
    @drink_stocks
  end

  # 投入金額の総計を取得できる。
  def current_slot_money
    # 自動販売機に入っているお金を表示する
    @slot_money
  end

  # 10円玉、50円玉、100円玉、500円玉、1000円札を１つずつ投入できる。
  # 投入は複数回できる。
  def slot_money(money)
    # 想定外のもの（１円玉や５円玉。千円札以外のお札、そもそもお金じゃないもの（数字以外のもの）など）
    # が投入された場合は、投入金額に加算せず、それをそのまま釣り銭としてユーザに出力する。
    return false unless MONEY.include?(money)
    # 自動販売機にお金を入れる
    @slot_money += money
  end

  # 払い戻し操作を行うと、投入金額の総計を釣り銭として出力する。
  def return_money
    # 返すお金の金額を表示する
    puts @slot_money
    # 自動販売機に入っているお金を0円に戻す
    @slot_money = 0
  end

  def juice_info
    if have_stock?
      puts @drink_stocks[0][:name]
      puts @drink_stocks[0][:price]
    else
      p "在庫なし"
    end
  end

  def have_stock?
    if @cola_stock.any?
      p @cola_stock.count
      true
    else
      false
    end
  end

  def buyable?
    if @slot_money >= 120 && have_stock?
      p @cola_stock.shift
      p @sales_amount += 120
      p @slot_money -= 120
    else
      false
    end
  end

  def buyable_list
  #  if @slot_money >= 200 && have_stock?
    
  #  elsif 
    
  #  else
    
  #  end
  end
end
    

# Step3
# 投入金額、在庫の点で、コーラが購入できるかどうかを取得できる。
# ジュース値段以上の投入金額が投入されている条件下で購入操作を行うと、ジュースの在庫を減らし、売り上げ金額を増やす。
# 投入金額が足りない場合もしくは在庫がない場合、購入操作を行っても何もしない。
# 現在の売上金額を取得できる。
# 払い戻し操作では現在の投入金額からジュース購入金額を引いた釣り銭を出力する。
