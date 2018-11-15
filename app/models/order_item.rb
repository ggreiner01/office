class OrderItem < ApplicationRecord
    belongs_to :order
  	belongs_to :supply
    has_many :cost

  	before_save :set_unit_price
  	before_save :set_total_price

    def unit_price
      @rez = Cost.where(:supply_id => supply.suppliesid).select(:cost)
  		if persisted?
  			self[:unit_price]
  		else
        @rez.pluck(:cost).first.to_f
  		end
  	end

  	def total_price
  		unit_price * quantity
  	end

		private
		def set_unit_price
			self[:unit_price] = unit_price
		end

		def set_total_price
			self[:total_price] = quantity * set_unit_price
		end
end
