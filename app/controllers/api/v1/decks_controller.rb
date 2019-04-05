class Api::V1::DecksController < ApplicationController
  def create_deck
    deck = Deck.create()
    #I play Aces high :)
    values = %w(2 3 4 5 6 7 8 9 10 J Q K A)
    suits = %w(Diamonds Clubs Spades Hearts)
    suits.each do |suit|
      values.each do |value|
        Card.create(value: value, suit: suit, deck_id: deck.id, code:value+suit[0])
      end
    end
    render :json => deck.cards
  end

  def draw
    deck = Deck.find(params[:id])
    drawn = Array.new
    (0..4).each do
      drawn.push(deck.cards.sample)
    end
    if drawn.uniq.length > 4
      render :json => drawn
    else
      draw
    end
  end

  def index
    decks = Deck.all
    deck_ids = Array.new
    decks.each do |deck|
      deck_ids.push(deck.id)
    end
    render :json => deck_ids
  end

  def delete_deck
    deck = Deck.find(params[:id])
    deck.destroy()
    render json: {success: 'deck deleted'}, status: :accepted
  end

end
