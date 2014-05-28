require 'spec_helper'

describe Job do
  it { should belong_to(:user) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:how_to_apply) }
  it { should validate_presence_of(:user) }

  describe "#to_param" do
    it "returns the parameterized title" do
      job = Job.make({ id: 12, title: 'Some Title' })
      expect(job.to_param).to eq('12-some-title')
    end
  end

  describe ".enabled" do
    it "returns only the enabled records" do
      enabled  = Job.make! enabled: true
      disabled = Job.make! enabled: false

      expect(Job.enabled).to eq([enabled])
    end
  end
end
