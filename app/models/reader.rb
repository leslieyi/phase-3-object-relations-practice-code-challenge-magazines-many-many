class Reader < ActiveRecord::Base
    has_many :subscriptions 
    has_many :magazines, through: :subscriptions

# Reader#subscribe(magazine, price)
# takes a magazine (an instance of the Magazine class) and a price (integer) as arguments, and creates a new subscription in the database associated with the magazine and the reader

    def subscribe(magazine, price)
        Subscription.create(magazine: magazine, price: price, reader: self )
    end 
    
    def total_subscription_price
        self.subscriptions.sum(:price)
    end 

    def cancel_subscription(magazine)
        self.subscriptions.find_by(magazine: magazine).destroy
        
    end 
end