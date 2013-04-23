require 'spec_helper'

describe Authentication do
	it { should validate_presence_of(:provider) }
	it { should validate_presence_of(:uid) }
	it { should validate_presence_of(:user_id) }
	it { should validate_presence_of(:access_token) }

	it { should belong_to(:user) }
end