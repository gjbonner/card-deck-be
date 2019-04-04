class Api::V1::DecksController < ApplicationController
  def create_deck
    deck = Deck.create()
    #I play Aces high :)
    values = %w(2 3 4 5 6 7 8 9 10 J Q K A)
    suits = %w(Diamonds Clubs Spades Hearts)
    suits.each do |suit|
      values.each do |value|
        Card.create(value: value, suit: suit, deck_id: deck.id)
      end
    end
    render :json => deck.cards
  end

  def get_deck
    deck = Deck.find_by(id)
  end
end
