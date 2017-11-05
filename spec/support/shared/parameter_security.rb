shared_examples 'parameter security' do |method_name ,form_name, attributes|
  it "should filter #{form_name.to_s} parameters" do
    filtered = double()
    expect(filtered).to receive(:permit) do |*args|
      expect(args).to contain_exactly(*attributes)
    end
    @controller.params = { form_name => filtered }
    @controller.send(method_name)
  end

  it "should raise an error on missing #{form_name.to_s} parameter" do
    @controller.params = {}
    expect { @controller.send(method_name) }.to raise_error(ActionController::ParameterMissing)
  end
end
