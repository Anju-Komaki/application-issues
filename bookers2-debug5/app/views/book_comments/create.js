 $('#js-table-book_comment').html("<%= j(render 'book_comments/comments',{ comments: @book_comments }) %>");
 $('#book_comment_comment').val('')