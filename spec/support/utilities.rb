def it_should_be_invalid_without(attr)
  it "should be invalid without #{attr}" do
    subject.send("#{attr}=", nil)
    subject.should be_invalid
  end
end
