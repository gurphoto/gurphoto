class LastReviewsCell < Cell::Rails
  def display
    render @collection = Hotel::Review.published.limit(3).all
  end
end
