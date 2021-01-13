!> Precision defined with selected_real_kind
module kinds
  implicit none
  private
  
  !> Single precision
  integer, public, parameter::sp = selected_real_kind(6)
  !> Double precision
  integer, public, parameter::dp = selected_real_kind(15)
  !> Quad precision 
  integer, public, parameter::qp = selected_real_kind(32)

end module kinds
