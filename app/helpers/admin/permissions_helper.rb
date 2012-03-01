module Admin::PermissionsHelper

  def permissions
    {
        "view" => "View",
        "create tickets" => "Create Tickets",
        "edit tickets" => "Edit tickets",
        "delete tickets" => "Delete tickets",
        "change states" => "Change States"
    }
  end
end
