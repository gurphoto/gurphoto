module HotelsHelper
  def review_counter hotel
    if can? :edit, Hotel::Review
      [hotel.reviews.published.count, hotel.reviews.count].join ' / '
    else
      hotel.reviews.published.count
    end
  end

  def review_count hotel
    if can? :edit, Hotel::Review
      hotel.reviews.count
    else
      hotel.reviews.published.count
    end
  end
end
