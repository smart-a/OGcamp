class Project < ApplicationRecord
    it { should validate_presence_of(:title) }
end
