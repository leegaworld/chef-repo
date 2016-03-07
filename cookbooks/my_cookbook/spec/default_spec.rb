require 'chefspec'

describe 'my_cookbook::default' do
  let(:chef_run) {
    ChefSpec::ChefRunner.new(
      platform:'ubuntu', version:'12.04'
    )
  }

  it 'creates a greetings file, containing the platform name' do
    expect(chef_run.converge(described_recipe)).to create_file_with_content('/tmp/greeting.txt','Hello! centos!')
  end
end
