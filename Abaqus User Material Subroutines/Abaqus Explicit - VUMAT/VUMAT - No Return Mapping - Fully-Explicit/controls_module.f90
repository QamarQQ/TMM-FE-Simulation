!=======================================================================
! User Material Subroutine for Isotropic Elasto-Visco-Plasticity
! CDD-based Material Model
!
! Author: Seyed Amir Hossein Motaman
! Steel Institute (IEHK), RWTH Aachen University
!
! References:
!    Motaman, S.A.H.; Prahl, U.; 2019.
!    Microstructural constitutive model for polycrystal viscoplasticity
!    in cold and warm regimes based on continuum dislocation dynamics.
!    Journal of the Mechanics and Physics of Solids 122, 205–243.
!    doi: https://doi.org/10.1016/j.jmps.2018.09.002
!
!    Motaman, S.A.H.; Schacht K.; Haase, C.; Prahl, U.; 2019.
!    Thermo-micro-mechanical simulation of metal forming processes.
!    International Journal of Solids and Structures.
!    doi: https://doi.org/10.1016/j.ijsolstr.2019.05.028
!=======================================================================

!***********************************************************************
! module header
  module controls

!-----------------------------------------------------------------------
!    setting precision controlling parameters
     implicit none

!    setting precision for real and integer kinds
     integer,                     parameter, public :: & 
         pReal = 8, &
         pInt  = 4

!-----------------------------------------------------------------------
!    assignment of numerics controlling parameters
     real(pReal),                 parameter, public :: &
         chi      = 1.0e-6                                               ! normalized tolerance for return mapping newton-raphson loop

     integer(pInt),               parameter, public :: &
         k_NR_max = 20                                                   ! maximum loop iterations in newton-raphson (NR) scheme

!-----------------------------------------------------------------------
!    assignment of parameters for extraction of material constants
     character(len = 64),         parameter, public :: &
         directory_separator     = '/', &                                ! directory separator character
         material_data_file_name = 'material_data.inp', &                ! the name of phase data input file
         delimiters              = '= :	,'                               ! delimiter characters for parsing input file lines

     integer(pInt),               parameter, public :: &
         n_materials  = 2, &                                             ! maximum number of different materials
         n_parameters = 80                                               ! maximum number of properties of different materials

!-----------------------------------------------------------------------
!    assignment of other parameters
     real(pReal),                 parameter, public :: &
         T_abs0 = -273.15e0, &                                           ! absolute zero temperature [C]
         xi     = 1.0e-2                                                 ! the parameter controlling the minimum equivalent plastic strain rate [s^-1]

  end module controls