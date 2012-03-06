class Notifier < ActionMailer::Base
  default from: "from@example.com"

  def comment_update(comment, user)
    @comment = comment
    @user = user
    mail(:to => user.email,
         :subject => "[ticketee] #{comment.ticket.project.name} - #{comment.ticket.title}")
  end
end
