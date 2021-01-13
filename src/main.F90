!> Project demonstrating FORD documentation
! https://github.com/Fortran-FOSS-Programmers/ford/wiki/Writing-Documentation


program main
  implicit none

  !> Single precision
  integer,parameter::sp = selected_real_kind(6)
  !> Double precision
  integer,parameter::dp = selected_real_kind(15)
  !> Quad precision 
  integer,parameter::qp = selected_real_kind(32)
  
  !> pi
  real(dp), parameter::pi = 4._dp * atan(1._dp)

  !> Plank's constant in S.I. units 
  real(dp), parameter :: hbar = 1.0545718e-34_dp

  
contains

  ! Standard Ford documentation style
  ! docmark = !!
  ! Documentation is placed beneath the code being documented
  ! i.e. the opposite from Doxygen 
  ! Latex is treated with MathJax

  function norm(a) result(norm_of_a)
    !! Compute the norm of the vector a
    !! \[ |\math{a}| = \sqrt{ \mathbf{a} \cdot \mathbf{a} } \]
    
    real(dp), intent(in) :: a(:)
    !! Vector a
    real(dp) :: norm_of_a
    !! norm of vector a
    
    norm_of_a = sqrt(dot_product(a, a))
  end function norm

  
  ! Non-standard Ford documentation style, available since v 1.0.0
  ! This is my preferred style 
  ! Documentation is placed above the code that's being documented.
  ! predocmark = !>
  ! Additionally, this documentation can also be parsed by Doxygen 
  
  !> @brief Construct distance matrix                                                             
  !>                                                                                              
  !> Given a set of atomic positions, construct a distance matrix:
  !> 
  !> \begin(equation}
  !>    d_{ij} = |\mathbf{r}_j - \mathbf{r}_i|,
  !> \end{equation}
  !> 
  !> where $$\mathbf{r}$$ is the position of atom $$i$$.
  !> 
  !> @param positions atomic positions                                                            
  !> @return d distance matrix   
  function distance_matrix(positions) result(d)
    real(dp), intent(in) :: positions(:,:)
    real(dp), allocatable :: d(:,:)
    integer :: ia, ja, n_atoms
    
    n_atoms = size(positions, 2)
    allocate(d(n_atoms, n_atoms))
    
    do ia = 1, n_atoms
       do ja = ia, n_atoms
          d(ia, ja) = norm(positions(ja, :) - positions(ia, :))
          d(ja, ia) = d(ia, ja)
       enddo
    enddo
    
  end function distance_matrix

  
  
  
  ! And where one documents each variable
  
  
end program main
