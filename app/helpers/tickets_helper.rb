module TicketsHelper
  def state_for(comment)
    if comment.state
      if comment.previous_state && comment.state != comment.previous_state
        "#{render comment.previous_state} &rarr; #{render comment.state}".html_safe
      else
        "&rarr;" + render(comment.state).html_safe
      end
    end
  end
end
