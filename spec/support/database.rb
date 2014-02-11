ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => ':memory:'
)

ActiveRecord::Schema.define do
  self.verbose = false

  create_table :admins, :force => true do |t|
    t.string :name
  end

  create_table :managers, :force => true do |t|
    t.string :name
    t.integer :admin_id
  end

  create_table :users, :force => true do |t|
    t.string :name
    t.integer :manager_id
  end

  create_table :interns, :force => true do |t|
    t.string :name
    t.integer :manager_id
  end
end
