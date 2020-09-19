module ApplicationHelper
  def basket_count_page_over_one
    if @basket.basket_items.count > 0
      return "<span class='tag is-dark'> #{@basket.basket_items.count}</span>".html_safe
    end
  end

  def basket_has_items
    return @basket.basket_items.count > 0
  end
end
