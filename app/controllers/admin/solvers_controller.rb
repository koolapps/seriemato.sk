class Admin::SolversController < AdminController
  def index
    @solvers = Solver.all.order('issue_id')
  end
end
