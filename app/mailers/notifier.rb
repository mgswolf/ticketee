class Notifier < ActionMailer::Base
  default from: "ticketee@ticketee.com"

  def comment_update(comment, user)
    @comment = comment
    @user = user
    mail(:to => user.email,
         :subject => "[ticketee] #{comment.ticket.project.name} - #{comment.ticket.title}")
  end
end
