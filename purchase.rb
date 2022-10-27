module PurchaseManageable #お金の管理がわからなくてこのモジュールに
  def select_drink_management #メソッド名追加
    puts "飲み物を選んでください。colaの場合は1, redbullの場合は2, waterの場合は3を入力してください"
    @select_drink_name = gets.to_i
  end

  def buy_drink_management #メソッド名追加
    if @slot_money >= pickup_drink[0][:price] && have_stock?
      pickup_drink.shift
      puts "売上金:#{@sales_amount += pickup_drink[0][:price]}円"
      puts "残金:#{@slot_money -= pickup_drink[0][:price]}円"
    else #0円の場合だけじゃなく、お金を入れていない（slot_money）を呼んでいない時の記述も必要？ 
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

