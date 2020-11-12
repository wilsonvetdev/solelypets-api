class AnimalShelter < ApplicationRecord
    has_many :comments 
    has_many :animals
    has_many :items, dependent: :destroy
    after_create :attach_default_image
    has_secure_password

    def full_address
        "#{self.address}, #{self.city}, #{self.state}"
    end

    def find_stripe_sessions
        Stripe.api_key = ENV['STRIPE_SECRET_KEY']
        Stripe::Checkout::Session.list.find_all { |session| session.client_reference_id.to_i === self.id && session.payment_status === 'paid'}
    end

    def donations_received
        find_stripe_sessions.pluck(:amount_total).sum / 100
    end

    private

    def attach_default_image
        self.items.create(image: 'https://res.cloudinary.com/dcupfetpr/image/upload/v1604622475/ewxx8ssnhr5aussakdar.jpg')
    end
    
end
