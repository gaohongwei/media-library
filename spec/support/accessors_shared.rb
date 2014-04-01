shared_examples_for "accessors" do
  context "base attribute accessibility" do
    it { should allow_mass_assignment_of(:file) }
    it { should allow_mass_assignment_of(:size) }
    it { should_not allow_mass_assignment_of(:id) }
  end
end
