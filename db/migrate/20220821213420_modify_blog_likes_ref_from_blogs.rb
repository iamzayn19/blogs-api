class ModifyBlogLikesRefFromBlogs < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key "blog_likes", "blogs"
    add_foreign_key "blog_likes", "blogs", on_delete: :cascade
  end
end
