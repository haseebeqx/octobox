module ApplicationHelper
  def bootstrap_class_for(flash_type)
    { success: 'alert-success', error: 'alert-danger', alert: 'alert-warning', notice: 'alert-info' }[flash_type.to_sym] || flash_type.to_s
  end

  def flash_messages
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} fade in") do
        concat content_tag(:button, 'x', class: 'close', data: { dismiss: 'alert' })
        concat message
      end)
    end
    nil
  end

  def notification_icon(subject_type)
    subject_types = {'RepositoryInvitation' => 'mail-read', 'Issue' => 'issue-opened',
      'PullRequest' => 'git-pull-request', 'Commit' => 'git-commit'}

    subject_types[subject_type]
  end

  def reason_label(reason)
    reasons = {'comment' => 'primary', 'author' => 'success', 'state_change' => 'info', 'mention' => 'warning',
       'assign' => 'danger' }
    reasons.default = 'default'
    reasons[reason]
  end
end
