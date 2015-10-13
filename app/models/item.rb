require "open-uri"

class Item < ActiveRecord::Base

  has_many :acks, foreign_key: :item_identifier, primary_key: :identifier

  def self.find_or_create_by_identifier!(identifier)
    find_by_identifier(identifier).presence || create(identifier: identifier)
  end

  def self.identifier_for(string)
    URI::encode(String(string).downcase)
  end

  def ack_count
    @ack_count ||= acks.count
  end

  def to_json
    {
      identifier: identifier,
      title:      title || identifier,
      ack_count:  ack_count
    }.to_json
  end

end
