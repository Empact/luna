FriendlyId.defaults do |config|
  config.use :slugged, :reserved

  config.reserved_words = %w(new edit)
end
