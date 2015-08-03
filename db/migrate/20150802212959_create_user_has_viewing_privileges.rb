class CreateUserHasViewingPrivileges < ActiveRecord::Migration
  def change
    create_table :user_has_viewing_privileges do |t|
      t.references :user, index: true
      t.references :viewingPrivilege, index: true

      t.timestamps
    end
  end
end
