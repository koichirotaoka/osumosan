module ContactHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'confirm'
      confirm_conacts_path
    elsif action_name == 'edit'
      contact_path
    end
  end
end
