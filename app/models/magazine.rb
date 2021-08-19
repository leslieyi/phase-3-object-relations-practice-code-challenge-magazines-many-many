class Magazine < ActiveRecord::Base
    has_many :subscriptions 
    has_many :readers, through: :subscriptions
    
  
    def email_list
        self.readers.pluck(:email).join(";")
        #self.readers.map {|reader| reader.email}.join(";")
        #end 
    end 

#Magazine.most_popular
# returns the Magazine instance with the most subscribers
    def self.most_popular
        # Lantz => # self.all.max {|a, b| a.subscriptions.length <=> b.subscriptions.length}
        Subscription.group("magazine_id").order("COUNT(*) DESC").first.magazine

        # most_popular = Subscription.group("magazine_id").order("COUNT(magazine_id) DESC").first
        # Magazine.find(most_popular.magazine_id)
    end 

end