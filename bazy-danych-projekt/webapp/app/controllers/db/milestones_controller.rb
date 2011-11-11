module Db
  class MilestonesController < ApplicationController
    belongs_to :project

    inherit_resources
  end
end
