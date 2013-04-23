require 'spec_helper'

describe User do 
	it { should validate_presence_of(:name) }
	it { should have_many(:authentications) }
	it { should have_many(:slides) }
end