class Message < ApplicationRecord

	after_create_commit { MessageBroadcastJob.perform_later self }
 	after_initialize :set_initial_status
    def set_initial_status
      self.state ||= :new
    end

	state_machine :state, :initial => :new do

		event :confirmed do
			transition :new => :confirmed 
		end

		event :cancel do
			transition :confirmed => :canceled, :new=> :canceled
		end

		event :open_order do
			transition :canceled => :confirmed
		end

		event :ship do
			transition :confirmed => :sold, :delivered => :sold
		end

		event :delivery do
			transition :confirmed => :delivered
		end

		event :annulled do
			transition :delivered => :confirmed
		end

	end


end
