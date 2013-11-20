class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant

  validate :check_capacity

  def check_capacity
    total_guests = 0

    restaurant.reservations.each do |r|
      if (r.time_slot.day == time_slot.day) && (r.time_slot.hour == time_slot.hour)
        total_guests += r.guests
      end
    end
    # debugger
    if (total_guests + guests > restaurant.capacity)
      errors.add(:reservation, :message => "Restaurant is full.")
      false
    end
  end

end
