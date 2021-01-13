!> Project demonstrating FORD and Doyxgen documentation
!> Reference: https://github.com/Fortran-FOSS-Programmers/ford/wiki/Writing-Documentation
program main
  use kinds, only: dp
  use routines
  implicit none

  !> pi
  real(dp), parameter::pi = 4._dp * atan(1._dp)

  !> Plank's constant in S.I. units 
  real(dp), parameter :: hbar = 1.0545718e-34_dp

  ! Stub main

end program main
