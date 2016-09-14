module MessagesHelper
  def tags_for(message)
    message.tags.sort{|a,b| a.created_at <=> b.created_at}.map(&:tag)
  end
end

