class MakeTag
  attr_accessor :message, :tags

  def initialize(message, options={})
    @message = message
    @tags = []
  end

  def call
    tags = parse_tags(message.body)
    make_tags(tags)
  end

  private

  def parse_tags(message)
    message.scan(/#\w+/).flatten.uniq
  end

  def make_tags(tags)
    tags.each do |tag|
      t = Tag.find_by(tag: tag)
      t = Tag.create(tag: tag) if t.nil?
      message.tags << t unless message.tags.include?(t)
    end
  end
end
