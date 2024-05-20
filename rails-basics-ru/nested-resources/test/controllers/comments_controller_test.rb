require "test_helper"

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @comment = post_comments(:one)
    @post = @comment.post
    @attrs = {
      content: Faker::ChuckNorris.fact
    }
  end

  test 'should create post comment' do
    post post_comments_url(@post), params: { post_comment: @attrs }

    comment = @post.comments.find_by @attrs

    assert { comment }
    assert_redirected_to post_url(@post)
  end

  test 'should get edit' do
    get edit_post_comment_url(@post, @comment)
    assert_response :success
  end

  test 'should update post comment' do
    patch post_comment_url(@post, @comment), params: { post_comment: @attrs }

    @comment.reload

    assert { @comment.content == @attrs[:content] }
    assert_redirected_to post_url(@post)
  end

  test 'should destroy post comment' do
    delete post_comment_url(@post, @comment)

    assert { !PostComment.exists?(@comment.id) }

    assert_redirected_to post_url(@post)
  end
end
