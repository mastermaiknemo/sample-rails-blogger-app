var CommentList = React.createClass({
  render: function () {
    var commentNodes = this.props.comments.map(function ( comment ) {
      return <Comment author={ comment.author } text={ comment.content } key={ comment.id } blogpost={ comment.blogpost_id }/>
    });

    return (
      <div className="comment-list">
        { commentNodes }
      </div>
    )
  }
});
