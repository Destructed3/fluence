class HomeController < ApplicationController
  # get /
  def index
    if Fluence::ACL.permitted?(current_user, "#{Fluence::OPTIONS.homepage}", Acl::Perm::Read)
      redirect_to "#{Fluence::OPTIONS.homepage}"
    else
      "Not authorized"
    end
  end
end
