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
    @select_drink_name = nil
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
  def slot_money
    while true
      puts "お金を入力してください。10円玉、50円玉、100円玉、500円玉、1000円札を1つずつ投入できます"
      money = gets
      # 想定外のもの（１円玉や５円玉。千円札以外のお札、そもそもお金じゃないもの（数字以外のもの）など）
      # が投入された場合は、投入金額に加算せず、それをそのまま釣り銭としてユーザに出力する。
      if MONEY.include?(money.to_i)
      # 自動販売機にお金を入れる
        @slot_money += money
        break
      else 
        puts "釣り銭は#{money.chomp}です。対応していません"
      end
    end 
  end

  # 払い戻し操作を行うと、投入金額の総計を釣り銭として出力する。
  def return_money
    # 返すお金の金額を表示する
    puts "釣り銭：#{@slot_money}円"
    # 自動販売機に入っているお金を0円に戻す
    @slot_money = 0
  end

  def buyable_list
    @drink_stocks.each do |stock|
      if stock != [] && @slot_money >= stock[0][:price]
        puts "#{stock[0][:name]}が購入できます"
      end
    end
  end

  def select_drink
    puts "飲み物を選んでください。colaの場合は1, redbullの場合は2, waterの場合は3を入力してください"
    @select_drink_name = gets.to_i
  end

  # def select_drink_info
  #   if have_stock?
  #     puts pickup_drink[0][:name]
  #     puts pickup_drink[0][:price]
  #     puts pickup_drink.count
  #   else
  #     puts "在庫なし"
  #   end
  # end

  def buy_drink
    if @slot_money >= pickup_drink[0][:price] && have_stock?
      pickup_drink.shift
      puts "売上金:#{@sales_amount += pickup_drink[0][:price]}円"
      puts "残金:#{@slot_money -= pickup_drink[0][:price]}円"
      return_money
    else
      puts "購入できません"
    end
  end
  
  private 

  def pickup_drink
    case @select_drink_name
    when 1
      @drink_stocks[0]
    when 2
      @drink_stocks[1]
    when 3
      @drink_stocks[2]
    end
  end

  def have_stock?
    if pickup_drink.any?
      true
    else
      false
    end
  end

end


