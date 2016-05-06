var CommentBox = React.createClass({
  getInitialState: function () {
    return JSON.parse(this.props.presenter);
  },

  handleCommentSubmit: function ( formData, action ) {
    $.ajax({
      data: formData,
      url: action,
      type: "POST",
      dataType: "json",
      success: function ( data ) {
        this.setState({ comments: data });
      }.bind(this)
    });
  },

  render: function () {
    return (
      <div className="comment-box">
     <CommentForm form={ this.state.form } onCommentSubmit={ this.handleCommentSubmit } />
        <h4> Comments </h4>
        <CommentList comments={ this.state.comments } />
        <hr />
      </div>
    );
  }
});
