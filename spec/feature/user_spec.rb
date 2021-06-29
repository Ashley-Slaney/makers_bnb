describe User do
  before(:each) do
    @connection = PG.connect(dbname: 'bnb_users_test')
    @connection.exec('TRUNCATE TABLE user;')
  end

  it 'adds a user to the database' do
    user = User.sign_up(name: 'John', email: 'john@gmail.com', password: '123')
    expect(user[0]['name']).to eq('John')
  end
end