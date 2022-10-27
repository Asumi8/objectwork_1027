module StockManageable
  def self.stock_management #selfに変更、メソッド名追加
    @drink_stocks = [],[],[]
    5.times{@drink_stocks[0]<<{name: "cola", price: 120}}
    5.times{@drink_stocks[1]<<{name: "redbull", price: 200}}
    5.times{@drink_stocks[2]<<{name: "water", price: 100}}
    @drink_stocks #入れないと「5」だけが入ってしまう。
  end

  def buyable_list_management #メソッド名追加
    @drink_stocks.each do |stock|
      if stock != [] && @slot_money >= stock[0][:price]
        puts "#{stock[0][:name]}が購入できます"
      end
    end
  end
end
