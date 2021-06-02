# frozen_string_literal: true

# Monkey-patch Paperclip to use Addressable::URI normalization instead of deprecated URI.escape
module Paperclip
  module UrlGeneratorExtensions
    def escape_url(url)
      Addressable::URI.parse(url).normalize.to_str.gsub(escape_regex) { |m| "%#{m.ord.to_s(16).upcase}" }
    end
  end
end

Paperclip::UrlGenerator.prepend(Paperclip::UrlGeneratorExtensions)
