var CommentForm = React.createClass({
  handleSubmit: function ( event ) {
    event.preventDefault();

    var author = this.refs.author.value.trim();
    var text = this.refs.text.value.trim();

    // validate
    if (!text || !author) {
      return false;
    }

    // submit
    var formData = $( this.refs.form ).serialize();
    this.props.onCommentSubmit( formData, this.props.form.action );

    // reset form
    this.refs.author.value = "";
    this.refs.text.value = "";
  },
  render: function () {
    return (
      <form ref="form" className="comment-form" action={ this.props.form.action }  method="post" onSubmit={ this.handleSubmit } remote='true'>
        <p><input type="hidden" name={ this.props.form.csrf_param } value={ this.props.form.csrf_token } /></p>
        <p><input type="hidden" name={ this.props.form.blogpost_ident } value={ this.props.form.blogpost_id } /></p>
        <p><input ref="author" name="comment[author]" placeholder="Your name" /></p>

        <p><textarea ref="text" name="comment[content]" placeholder="Your blogpost content.." /></p>
        <p><button type="submit">Post comment</button></p>
      </form>
    )
  }
});

