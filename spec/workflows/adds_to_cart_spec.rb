# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AddsToCart do
  let(:user) { instance_double(User) }
  let(:performance) { instance_double(Performance) }
  let(:ticket_1) { instance_spy(Ticket, status: :unsold, performance:) }
  let(:ticket_2) { instance_spy(Ticket, status: :unsold, performance:) }

  describe 'can add tickets' do
    let(:count) { 1 }

    it 'adds ticket to cart' do
      expect(performance).to receive(:unsold_tickets).with(1).and_return([ticket_1])

      action = AddsToCart.new(user:, performance:, count:)
      action.run
      expect(action.success).to be_truthy
      expect(ticket_1).to have_received(:place_in_cart_for).with(user)
      expect(ticket_2).not_to have_received(:place_in_cart_for)
    end
  end

  describe 'when request more tickets than available' do
    let(:count) { 3 }

    it 'returns false' do
      expect(performance).to receive(:unsold_tickets).with(3).and_return([ticket_1])
      action = AddsToCart.new(user:, performance:, count:)
      action.run
      expect(action.success).to be_falsey
      expect(ticket_1).not_to have_received(:place_in_cart_for)
      expect(ticket_2).not_to have_received(:place_in_cart_for)
    end
  end

  describe 'when no tickets are available' do
    let(:count) { 1 }

    it 'returns false' do
      expect(performance).to receive(:unsold_tickets).with(1).and_return([])
      action = AddsToCart.new(user:, performance:, count:)
      action.run
      expect(action.success).to be_falsey
      expect(ticket_1).not_to have_received(:place_in_cart_for)
      expect(ticket_2).not_to have_received(:place_in_cart_for)
    end
  end
end
