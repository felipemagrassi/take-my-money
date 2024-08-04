# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ShoppingCart, type: :model do
  let(:event_1) { instance_double(Event, name: 'Romeo') }
  let(:event_2) { instance_double(Event, name: 'Crumbs') }
  let(:performance_1) { instance_spy(Performance, id: 1, event: event_1) }
  let(:performance_2) { instance_spy(Performance, id: 2, event: event_2) }
  let(:ticket_1) { instance_double(Ticket, performance: performance_1, event: event_1, price: Money.new(3000)) }
  let(:ticket_2) { instance_double(Ticket, performance: performance_2, event: event_2, price: Money.new(0)) }
  let(:user) { instance_double(User, tickets_in_cart: [ticket_1, ticket_2]) }
  let(:cart) { ShoppingCart.new(user) }

  it 'returns events for the cart' do
    expect(cart.events.map(&:name)).to eq([event_2.name, event_1.name])
  end

  it 'returns the number of tickets for each performance' do
    expect(cart.performance_count).to eq(1 => 1, 2 => 1)
  end

  it 'returns the list of performances for the event' do
    expect(cart.performances_for(event_1)).to eq([performance_1])
  end

  it 'returns subtotal for performance' do
    expect(cart.subtotal_for(performance_1)).to eq(Money.new(3000))
  end

  it 'calculates entire total' do
    expect(cart.total_cost).to eq(Money.new(3000))
  end
end
