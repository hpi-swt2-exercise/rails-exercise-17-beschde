shared_examples 'parameter security' do |method: ,form: , attributes:|
  it "should filter #{form.to_s} parameters" do
    filtered = double()
    expect(filtered).to receive(:permit) do |*args|
      expect(args).to contain_exactly(*attributes)
    end
    @controller.params = { form => filtered }
    @controller.send(method)
  end

  it "should raise an error on missing #{form.to_s} parameter" do
    @controller.params = {}
    expect { @controller.send(method) }.to raise_error(ActionController::ParameterMissing)
  end
end
