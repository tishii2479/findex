class Player < ApplicationRecord
  has_many :watches
  has_many :buy_histories
  has_many :sell_histories
  has_many :user_stocks
  has_many :change_histories

  scope :buy_asc, -> { order(buy_price: :asc) }
  scope :buy_desc, -> { order(buy_price: :desc) }
  scope :sell_asc, -> { order(sell_price: :asc) }
  scope :sell_desc, -> { order(sell_price: :desc) }

  def calc_delta
    change_histories = ChangeHistory.where(player_id: self.id).order(created_at: :desc)
    change_histories.each do |history|
      # 一週間より前であった場合
      if history.created_at < 1.day.ago.beginning_of_day
        return self.buy_price - history.new_value 
      end
    end

    # 過去のデータがない場合
    return 0
  end

  def raise_price
    self.price = self.price * 1.02
    self.buy_price = (self.price).floor
    self.sell_price = (self.price * 0.92).floor
    self.remaining_stock = self.border_stock
  end

  def lower_price
    self.price = self.price * 0.98
    self.buy_price = (self.price).floor
    self.sell_price = (self.price * 0.92).floor
    self.remaining_stock = 0
  end

  def create_change_history
    change_history = ChangeHistory.new(
      player_id: self.id,
      new_value: self.buy_price
    )

    if !change_history.save
      puts "failed"
    end
  end
end
