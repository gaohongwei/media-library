shared_examples_for "uploadables" do |model|

  def factory_from_classname
    described_class.name.split("::").last.downcase.to_sym
  end

  before(:each) {
    klass = (model.present? && model) || create(factory_from_classname)
    klass.build_profile(title: "title", content_type: "image/jpg")
    @klass = klass
  }
 
  it "has an associated profile" do
    @klass.should respond_to(:profile)
  end
      
  it "has the image id as foreign key" do
    @klass.id.should eql(@klass.profile.profileable_id)
  end
  
  it "has the item's class as its type" do
    name = @klass.class.name
    @klass.profile.profileable_type.should eql(name)
  end

end
