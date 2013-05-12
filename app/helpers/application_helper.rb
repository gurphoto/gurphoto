# encoding: utf-8

module ApplicationHelper
  def main_menu_item text, url
    content_tag :li, link_to(text, url), class: current_page?(url) ? 'active' : ''
  end

  def tickets_link_text messages_count = nil, tickets_count = nil, mine_tickets_count = nil
    parts = []
    parts << "<img src=\"#{asset_path('mail.gif')}\" /> #{messages_count} #{Russian.p(messages_count, 'сообщение', 'сообщения', 'сообщений')}" if messages_count and messages_count > 0
    parts << "#{tickets_count} #{Russian.p(tickets_count, 'новый запрос', 'новых запроса', 'новых запросов')}" if tickets_count and tickets_count > 0
    parts << "#{mine_tickets_count} #{Russian.p(mine_tickets_count, 'запрос', 'запроса', 'запросов')} в работе" if mine_tickets_count and mine_tickets_count > 0

    "#{parts.join(', ')}"
  end

  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to params.dup.merge({ sort: column, direction: direction }), { class: css_class } do
      if column == sort_column
        raw title + icon("arrow-#{direction == 'asc' ? 'up' : 'down'}")
      else
        title
      end
    end
  end

  def n2br(text, options={})
    text ||= ''
    text = h(text) unless options[:escape] == false
    text = text.gsub(/\r\n?/, "\n")    # \r\n and \r -> \n
    text = text.gsub("\n", "<br />\n")
    text.html_safe
  end
end
