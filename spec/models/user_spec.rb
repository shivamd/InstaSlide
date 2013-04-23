require 'spec_helper'

describe User do 
	it { should_validate_presence_of(:name) }
	it { should have_many(:authentications) }
end