class LatestArticlesCell < Cell::Rails
  def display
    @articles = Article.limit(3).all
    render
  end
end
