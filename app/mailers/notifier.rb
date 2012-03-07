class Notifier < ActionMailer::Base
  default from: "ticketee@gmail.com"

  def comment_update(comment, user)
    @comment = comment
    @user = user
    mail(:to => user.email,
        :from => "Ticketee <ticketee+#{comment.project.id}+#{comment.ticket.id}@example.com>",
         :subject => "[ticketee] #{comment.ticket.project.name} - #{comment.ticket.title}")
  end
end
