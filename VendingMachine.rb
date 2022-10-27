require_relative 'stock'
require_relative 'purchase'

class VendingMachine
  include StockManageable
  include PurchaseManageable

  MONEY = [10, 50, 100, 500, 1000].freeze

  def initialize
    @slot_money = 0
    @drink_stocks = StockManageable.stock_management
    @sales_amount = 0
    @select_drink_name = nil
  end

  def current_slot_money
    @slot_money
  end

  # 山石さん参考
  def slot_money(money)
      return money unless MONEY.include?(money)
      @slot_money += money
  end

  def return_money  #売上金と釣り銭を管理するモジュールが必要？
    puts "釣り銭：#{@slot_money}円"
    @slot_money = 0
  end

  # ------ここまでデフォルトの内容-----------

  def buyable_list #ドリンクを選ぶ
    buyable_list_management #モジュールのメソッドを呼び出す
  end

  def select_and_buy_drink #ドリンクを選んで購入する
    select_drink_management #モジュールのメソッドを呼び出す
    buy_drink_management #モジュールのメソッドを呼び出す
    return_money 
  end
end

  # def drink_stocks_list  #不要？確認用
  #   @drink_stocks
  # end

    # # 10円玉、50円玉、100円玉、500円玉、1000円札を１つずつ投入できる。投入は複数回できる。
    # def slot_money(money)
    #   # while true
    #   #   puts "お金を入力してください。10円玉、50円玉、100円玉、500円玉、1000円札を1つずつ投入できます"
    #   #   money = gets
    #     # 想定外のもの（１円玉や５円玉。千円札以外のお札、そもそもお金じゃないもの（数字以外のもの）など）
    #     # が投入された場合は、投入金額に加算せず、それをそのまま釣り銭としてユーザに出力する。
    #     return money unless MONEY.include?(money)
    #     # 自動販売機にお金を入れる
    #       @slot_money += money
    #   #     break
    #   #   else 
    #   #     puts "釣り銭は#{money.chomp}です。対応していません"
    #   #   end
    #   # end 
    # end




