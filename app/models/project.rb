class Project < ActiveRecord::Base
  has_many :tickets, :dependent => :delete_all
 # delegate :project, :to => :ticket

  validates :name, :presence => true
  has_many :permissions, :as => :thing
  scope :readable_by, lambda {|user|
        joins(:permissions).where(:permissions => { :action => "view",
                                                     :user_id => user.id})
  }

  def title
    name
  end

  def self.for(user)
    user.admin? ? Project : Project.readable_by(user)
  end

  def last_ticket
    tickets.last
  end
end
