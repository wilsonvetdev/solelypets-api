require 'stripe'
require 'dotenv'
Dotenv.load  

class User < ApplicationRecord
    has_many :comments 
    after_create :save_to_stripe
    has_secure_password

    def find_stripe_sessions
        Stripe.api_key = ENV['STRIPE_SECRET_KEY']
        customer = Stripe::Customer.retrieve(self.customer_id)
        Stripe::Checkout::Session.list.find_all { |session| session.customer === customer.id && session.payment_status === 'paid'}
    end

    def paid_donations_count
        find_stripe_sessions.count
    end

    def total_donations_amount
        array_of_payments = find_stripe_sessions.pluck(:amount_total)
        array_of_payments.inject(0){ |sum, payment| sum + payment} / 100
    end

    def donated_to
        array_of_unique_shelter_ids = find_stripe_sessions.filter { |session| session.client_reference_id }.pluck(:client_reference_id).uniq
        array_of_unique_shelter_ids.map { |id| AnimalShelter.find_by(id: id.to_i).name }
    end

    private 

    def save_to_stripe
        Stripe.api_key = ENV['STRIPE_SECRET_KEY']
            customer = Stripe::Customer.create({
                email: self.email,
                name: "#{self.last_name}, #{self.first_name}"
            })
        self.update(customer_id: customer.id)
    end


end

