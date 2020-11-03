require 'stripe'
require 'dotenv'
Dotenv.load  

class User < ApplicationRecord
    has_many :comments 
    has_many :donations

    has_secure_password

    def paid_donations_count
        Stripe.api_key = ENV['STRIPE_SECRET_KEY']
        customer = Stripe::Customer.retrieve(self.customer_id)
        Stripe::Checkout::Session.list.find_all { |session| session.customer === self.customer_id && session.payment_status === 'paid'}.count
    end

    def total_donations_amount
        Stripe.api_key = ENV['STRIPE_SECRET_KEY']
        customer = Stripe::Customer.retrieve(self.customer_id)
        sessions = Stripe::Checkout::Session.list.find_all { |session| session.customer === self.customer_id && session.payment_status === 'paid'}
        array_of_payments = sessions.pluck(:amount_total)
        array_of_payments.inject(0){ |sum, payment| sum + payment} / 100
    end

    def donated_to
        Stripe.api_key = ENV['STRIPE_SECRET_KEY']
        customer = Stripe::Customer.retrieve(self.customer_id)
        sessions = Stripe::Checkout::Session.list.find_all { |session| session.customer === self.customer_id && session.payment_status === 'paid'}
        array_of_unique_shelter_ids = sessions.filter { |session| session.client_reference_id }.pluck(:client_reference_id).uniq
        array_of_unique_shelter_ids = array_of_unique_shelter_ids.map { |id| id.to_i }
        shelters = []
        array_of_unique_shelter_ids.each { |id| shelters = AnimalShelter.all.find_all { |shelter| shelter.id === id } }
        shelters
    end


end

