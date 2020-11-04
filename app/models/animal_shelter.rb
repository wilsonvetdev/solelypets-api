class AnimalShelter < ApplicationRecord
    has_many :comments 
    has_many :donations

    has_secure_password

    def full_address
        "#{self.address}, #{self.city}, #{self.state}"
    end

    def find_stripe_sessions
        Stripe.api_key = ENV['STRIPE_SECRET_KEY']
        Stripe::Checkout::Session.list.find_all { |session| session.client_reference_id.to_i === self.id && session.payment_status === 'paid'}
    end

    def donations_received
        sessions = find_stripe_sessions
        sessions.pluck(:amount_total).sum / 100
    end
    
end
