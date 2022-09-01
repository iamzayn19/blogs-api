class ModifyDatabaseForOnCascade < ActiveRecord::Migration[6.1]
  def change
    
    remove_foreign_key "blog_likes", "users"
    add_foreign_key "blog_likes", "users", on_delete: :cascade

    remove_foreign_key "blogs", "users"
    add_foreign_key "blogs", "users", on_delete: :cascade

    remove_foreign_key "comments", "blogs"
    add_foreign_key "comments", "blogs", on_delete: :cascade

    remove_foreign_key "comments", "users"
    add_foreign_key "comments", "users", on_delete: :cascade

  end
end
