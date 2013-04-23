require 'spec_helper'

describe Photo do 

	it { should validate_presence_of(:user_id) }
	it { should validate_presence_of(:slide_id) }
	it { should validate_presence_of(:url) }

	it { should belong_to(:user) }
	it { should belong_to(:slide) }
end