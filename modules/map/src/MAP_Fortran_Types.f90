!STARTOFREGISTRYGENERATEDFILE 'MAP_Fortran_Types.f90'
!
! WARNING This file is generated automatically by the FAST registry.
! Do not edit.  Your changes to this file will be lost.
!
! FAST Registry
!*********************************************************************************************************************************
! MAP_Fortran_Types
!.................................................................................................................................
! This file is part of MAP_Fortran.
!
! Copyright (C) 2012-2016 National Renewable Energy Laboratory
!
! Licensed under the Apache License, Version 2.0 (the "License");
! you may not use this file except in compliance with the License.
! You may obtain a copy of the License at
!
!     http://www.apache.org/licenses/LICENSE-2.0
!
! Unless required by applicable law or agreed to in writing, software
! distributed under the License is distributed on an "AS IS" BASIS,
! WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
! See the License for the specific language governing permissions and
! limitations under the License.
!
!
! W A R N I N G : This file was automatically generated from the FAST registry.  Changes made to this file may be lost.
!
!*********************************************************************************************************************************
!> This module contains the user-defined types needed in MAP_Fortran. It also contains copy, destroy, pack, and
!! unpack routines associated with each defined data type. This code is automatically generated by the FAST Registry.
MODULE MAP_Fortran_Types
!---------------------------------------------------------------------------------------------------------------------------------
USE NWTC_Library
IMPLICIT NONE
! =========  Lin_InitInputType  =======
  TYPE, PUBLIC :: Lin_InitInputType
    LOGICAL  :: linearize = .false.      !< Flag that tells this module if the glue code wants to linearize.  (fortran-only) [-]
  END TYPE Lin_InitInputType
! =======================
! =========  Lin_InitOutputType  =======
  TYPE, PUBLIC :: Lin_InitOutputType
    CHARACTER(200) , DIMENSION(:), ALLOCATABLE  :: LinNames_y      !< second line of output file contents: units (fortran-only) [-]
    CHARACTER(200) , DIMENSION(:), ALLOCATABLE  :: LinNames_u      !< Names of the inputs used in linearization (fortran-only) [-]
    LOGICAL , DIMENSION(:), ALLOCATABLE  :: IsLoad_u      !< Flag that tells FAST if the inputs used in linearization are loads (for preconditioning matrix) (fortran-only) [-]
  END TYPE Lin_InitOutputType
! =======================
! =========  Lin_ParamType  =======
  TYPE, PUBLIC :: Lin_ParamType
    INTEGER(IntKi) , DIMENSION(:,:), ALLOCATABLE  :: Jac_u_indx      !< matrix to help fill/pack the u vector in computing the jacobian (fortran-only) [-]
    REAL(R8Ki)  :: du      !< determines size of the translational displacement perturbation for u (inputs) (fortran-only) [-]
    INTEGER(IntKi)  :: Jac_ny      !< number of outputs in jacobian matrix (fortran-only) [-]
  END TYPE Lin_ParamType
! =======================
CONTAINS
 SUBROUTINE MAP_Fortran_CopyLin_InitInputType( SrcLin_InitInputTypeData, DstLin_InitInputTypeData, CtrlCode, ErrStat, ErrMsg )
   TYPE(Lin_InitInputType), INTENT(IN) :: SrcLin_InitInputTypeData
   TYPE(Lin_InitInputType), INTENT(INOUT) :: DstLin_InitInputTypeData
   INTEGER(IntKi),  INTENT(IN   ) :: CtrlCode
   INTEGER(IntKi),  INTENT(  OUT) :: ErrStat
   CHARACTER(*),    INTENT(  OUT) :: ErrMsg
! Local 
   INTEGER(IntKi)                 :: i,j,k
   INTEGER(IntKi)                 :: i1, i1_l, i1_u  !  bounds (upper/lower) for an array dimension 1
   INTEGER(IntKi)                 :: i2, i2_l, i2_u  !  bounds (upper/lower) for an array dimension 2
   INTEGER(IntKi)                 :: ErrStat2
   CHARACTER(ErrMsgLen)           :: ErrMsg2
   CHARACTER(*), PARAMETER        :: RoutineName = 'MAP_Fortran_CopyLin_InitInputType'
! 
   ErrStat = ErrID_None
   ErrMsg  = ""
    DstLin_InitInputTypeData%linearize = SrcLin_InitInputTypeData%linearize
 END SUBROUTINE MAP_Fortran_CopyLin_InitInputType

 SUBROUTINE MAP_Fortran_DestroyLin_InitInputType( Lin_InitInputTypeData, ErrStat, ErrMsg )
  TYPE(Lin_InitInputType), INTENT(INOUT) :: Lin_InitInputTypeData
  INTEGER(IntKi),  INTENT(  OUT) :: ErrStat
  CHARACTER(*),    INTENT(  OUT) :: ErrMsg
  CHARACTER(*),    PARAMETER :: RoutineName = 'MAP_Fortran_DestroyLin_InitInputType'
  INTEGER(IntKi)                 :: i, i1, i2, i3, i4, i5 
! 
  ErrStat = ErrID_None
  ErrMsg  = ""
 END SUBROUTINE MAP_Fortran_DestroyLin_InitInputType

 SUBROUTINE MAP_Fortran_PackLin_InitInputType( ReKiBuf, DbKiBuf, IntKiBuf, Indata, ErrStat, ErrMsg, SizeOnly )
  REAL(ReKi),       ALLOCATABLE, INTENT(  OUT) :: ReKiBuf(:)
  REAL(DbKi),       ALLOCATABLE, INTENT(  OUT) :: DbKiBuf(:)
  INTEGER(IntKi),   ALLOCATABLE, INTENT(  OUT) :: IntKiBuf(:)
  TYPE(Lin_InitInputType),  INTENT(IN) :: InData
  INTEGER(IntKi),   INTENT(  OUT) :: ErrStat
  CHARACTER(*),     INTENT(  OUT) :: ErrMsg
  LOGICAL,OPTIONAL, INTENT(IN   ) :: SizeOnly
    ! Local variables
  INTEGER(IntKi)                 :: Re_BufSz
  INTEGER(IntKi)                 :: Re_Xferred
  INTEGER(IntKi)                 :: Db_BufSz
  INTEGER(IntKi)                 :: Db_Xferred
  INTEGER(IntKi)                 :: Int_BufSz
  INTEGER(IntKi)                 :: Int_Xferred
  INTEGER(IntKi)                 :: i,i1,i2,i3,i4,i5
  LOGICAL                        :: OnlySize ! if present and true, do not pack, just allocate buffers
  INTEGER(IntKi)                 :: ErrStat2
  CHARACTER(ErrMsgLen)           :: ErrMsg2
  CHARACTER(*), PARAMETER        :: RoutineName = 'MAP_Fortran_PackLin_InitInputType'
 ! buffers to store subtypes, if any
  REAL(ReKi),      ALLOCATABLE   :: Re_Buf(:)
  REAL(DbKi),      ALLOCATABLE   :: Db_Buf(:)
  INTEGER(IntKi),  ALLOCATABLE   :: Int_Buf(:)

  OnlySize = .FALSE.
  IF ( PRESENT(SizeOnly) ) THEN
    OnlySize = SizeOnly
  ENDIF
    !
  ErrStat = ErrID_None
  ErrMsg  = ""
  Re_BufSz  = 0
  Db_BufSz  = 0
  Int_BufSz  = 0
      Int_BufSz  = Int_BufSz  + 1  ! linearize
  IF ( Re_BufSz  .GT. 0 ) THEN 
     ALLOCATE( ReKiBuf(  Re_BufSz  ), STAT=ErrStat2 )
     IF (ErrStat2 /= 0) THEN 
       CALL SetErrStat(ErrID_Fatal, 'Error allocating ReKiBuf.', ErrStat, ErrMsg,RoutineName)
       RETURN
     END IF
  END IF
  IF ( Db_BufSz  .GT. 0 ) THEN 
     ALLOCATE( DbKiBuf(  Db_BufSz  ), STAT=ErrStat2 )
     IF (ErrStat2 /= 0) THEN 
       CALL SetErrStat(ErrID_Fatal, 'Error allocating DbKiBuf.', ErrStat, ErrMsg,RoutineName)
       RETURN
     END IF
  END IF
  IF ( Int_BufSz  .GT. 0 ) THEN 
     ALLOCATE( IntKiBuf(  Int_BufSz  ), STAT=ErrStat2 )
     IF (ErrStat2 /= 0) THEN 
       CALL SetErrStat(ErrID_Fatal, 'Error allocating IntKiBuf.', ErrStat, ErrMsg,RoutineName)
       RETURN
     END IF
  END IF
  IF(OnlySize) RETURN ! return early if only trying to allocate buffers (not pack them)

  Re_Xferred  = 1
  Db_Xferred  = 1
  Int_Xferred = 1

      IntKiBuf ( Int_Xferred:Int_Xferred+1-1 ) = TRANSFER( InData%linearize , IntKiBuf(1), 1)
      Int_Xferred   = Int_Xferred   + 1
 END SUBROUTINE MAP_Fortran_PackLin_InitInputType

 SUBROUTINE MAP_Fortran_UnPackLin_InitInputType( ReKiBuf, DbKiBuf, IntKiBuf, Outdata, ErrStat, ErrMsg )
  REAL(ReKi),      ALLOCATABLE, INTENT(IN   ) :: ReKiBuf(:)
  REAL(DbKi),      ALLOCATABLE, INTENT(IN   ) :: DbKiBuf(:)
  INTEGER(IntKi),  ALLOCATABLE, INTENT(IN   ) :: IntKiBuf(:)
  TYPE(Lin_InitInputType), INTENT(INOUT) :: OutData
  INTEGER(IntKi),  INTENT(  OUT) :: ErrStat
  CHARACTER(*),    INTENT(  OUT) :: ErrMsg
    ! Local variables
  INTEGER(IntKi)                 :: Buf_size
  INTEGER(IntKi)                 :: Re_Xferred
  INTEGER(IntKi)                 :: Db_Xferred
  INTEGER(IntKi)                 :: Int_Xferred
  INTEGER(IntKi)                 :: i
  LOGICAL                        :: mask0
  LOGICAL, ALLOCATABLE           :: mask1(:)
  LOGICAL, ALLOCATABLE           :: mask2(:,:)
  LOGICAL, ALLOCATABLE           :: mask3(:,:,:)
  LOGICAL, ALLOCATABLE           :: mask4(:,:,:,:)
  LOGICAL, ALLOCATABLE           :: mask5(:,:,:,:,:)
  INTEGER(IntKi)                 :: i1, i1_l, i1_u  !  bounds (upper/lower) for an array dimension 1
  INTEGER(IntKi)                 :: i2, i2_l, i2_u  !  bounds (upper/lower) for an array dimension 2
  INTEGER(IntKi)                 :: ErrStat2
  CHARACTER(ErrMsgLen)           :: ErrMsg2
  CHARACTER(*), PARAMETER        :: RoutineName = 'MAP_Fortran_UnPackLin_InitInputType'
 ! buffers to store meshes, if any
  REAL(ReKi),      ALLOCATABLE   :: Re_Buf(:)
  REAL(DbKi),      ALLOCATABLE   :: Db_Buf(:)
  INTEGER(IntKi),  ALLOCATABLE   :: Int_Buf(:)
    !
  ErrStat = ErrID_None
  ErrMsg  = ""
  Re_Xferred  = 1
  Db_Xferred  = 1
  Int_Xferred  = 1
      OutData%linearize = TRANSFER( IntKiBuf( Int_Xferred ), mask0 )
      Int_Xferred   = Int_Xferred + 1
 END SUBROUTINE MAP_Fortran_UnPackLin_InitInputType

 SUBROUTINE MAP_Fortran_CopyLin_InitOutputType( SrcLin_InitOutputTypeData, DstLin_InitOutputTypeData, CtrlCode, ErrStat, ErrMsg )
   TYPE(Lin_InitOutputType), INTENT(IN) :: SrcLin_InitOutputTypeData
   TYPE(Lin_InitOutputType), INTENT(INOUT) :: DstLin_InitOutputTypeData
   INTEGER(IntKi),  INTENT(IN   ) :: CtrlCode
   INTEGER(IntKi),  INTENT(  OUT) :: ErrStat
   CHARACTER(*),    INTENT(  OUT) :: ErrMsg
! Local 
   INTEGER(IntKi)                 :: i,j,k
   INTEGER(IntKi)                 :: i1, i1_l, i1_u  !  bounds (upper/lower) for an array dimension 1
   INTEGER(IntKi)                 :: ErrStat2
   CHARACTER(ErrMsgLen)           :: ErrMsg2
   CHARACTER(*), PARAMETER        :: RoutineName = 'MAP_Fortran_CopyLin_InitOutputType'
! 
   ErrStat = ErrID_None
   ErrMsg  = ""
IF (ALLOCATED(SrcLin_InitOutputTypeData%LinNames_y)) THEN
  i1_l = LBOUND(SrcLin_InitOutputTypeData%LinNames_y,1)
  i1_u = UBOUND(SrcLin_InitOutputTypeData%LinNames_y,1)
  IF (.NOT. ALLOCATED(DstLin_InitOutputTypeData%LinNames_y)) THEN 
    ALLOCATE(DstLin_InitOutputTypeData%LinNames_y(i1_l:i1_u),STAT=ErrStat2)
    IF (ErrStat2 /= 0) THEN 
      CALL SetErrStat(ErrID_Fatal, 'Error allocating DstLin_InitOutputTypeData%LinNames_y.', ErrStat, ErrMsg,RoutineName)
      RETURN
    END IF
  END IF
    DstLin_InitOutputTypeData%LinNames_y = SrcLin_InitOutputTypeData%LinNames_y
ENDIF
IF (ALLOCATED(SrcLin_InitOutputTypeData%LinNames_u)) THEN
  i1_l = LBOUND(SrcLin_InitOutputTypeData%LinNames_u,1)
  i1_u = UBOUND(SrcLin_InitOutputTypeData%LinNames_u,1)
  IF (.NOT. ALLOCATED(DstLin_InitOutputTypeData%LinNames_u)) THEN 
    ALLOCATE(DstLin_InitOutputTypeData%LinNames_u(i1_l:i1_u),STAT=ErrStat2)
    IF (ErrStat2 /= 0) THEN 
      CALL SetErrStat(ErrID_Fatal, 'Error allocating DstLin_InitOutputTypeData%LinNames_u.', ErrStat, ErrMsg,RoutineName)
      RETURN
    END IF
  END IF
    DstLin_InitOutputTypeData%LinNames_u = SrcLin_InitOutputTypeData%LinNames_u
ENDIF
IF (ALLOCATED(SrcLin_InitOutputTypeData%IsLoad_u)) THEN
  i1_l = LBOUND(SrcLin_InitOutputTypeData%IsLoad_u,1)
  i1_u = UBOUND(SrcLin_InitOutputTypeData%IsLoad_u,1)
  IF (.NOT. ALLOCATED(DstLin_InitOutputTypeData%IsLoad_u)) THEN 
    ALLOCATE(DstLin_InitOutputTypeData%IsLoad_u(i1_l:i1_u),STAT=ErrStat2)
    IF (ErrStat2 /= 0) THEN 
      CALL SetErrStat(ErrID_Fatal, 'Error allocating DstLin_InitOutputTypeData%IsLoad_u.', ErrStat, ErrMsg,RoutineName)
      RETURN
    END IF
  END IF
    DstLin_InitOutputTypeData%IsLoad_u = SrcLin_InitOutputTypeData%IsLoad_u
ENDIF
 END SUBROUTINE MAP_Fortran_CopyLin_InitOutputType

 SUBROUTINE MAP_Fortran_DestroyLin_InitOutputType( Lin_InitOutputTypeData, ErrStat, ErrMsg )
  TYPE(Lin_InitOutputType), INTENT(INOUT) :: Lin_InitOutputTypeData
  INTEGER(IntKi),  INTENT(  OUT) :: ErrStat
  CHARACTER(*),    INTENT(  OUT) :: ErrMsg
  CHARACTER(*),    PARAMETER :: RoutineName = 'MAP_Fortran_DestroyLin_InitOutputType'
  INTEGER(IntKi)                 :: i, i1, i2, i3, i4, i5 
! 
  ErrStat = ErrID_None
  ErrMsg  = ""
IF (ALLOCATED(Lin_InitOutputTypeData%LinNames_y)) THEN
  DEALLOCATE(Lin_InitOutputTypeData%LinNames_y)
ENDIF
IF (ALLOCATED(Lin_InitOutputTypeData%LinNames_u)) THEN
  DEALLOCATE(Lin_InitOutputTypeData%LinNames_u)
ENDIF
IF (ALLOCATED(Lin_InitOutputTypeData%IsLoad_u)) THEN
  DEALLOCATE(Lin_InitOutputTypeData%IsLoad_u)
ENDIF
 END SUBROUTINE MAP_Fortran_DestroyLin_InitOutputType

 SUBROUTINE MAP_Fortran_PackLin_InitOutputType( ReKiBuf, DbKiBuf, IntKiBuf, Indata, ErrStat, ErrMsg, SizeOnly )
  REAL(ReKi),       ALLOCATABLE, INTENT(  OUT) :: ReKiBuf(:)
  REAL(DbKi),       ALLOCATABLE, INTENT(  OUT) :: DbKiBuf(:)
  INTEGER(IntKi),   ALLOCATABLE, INTENT(  OUT) :: IntKiBuf(:)
  TYPE(Lin_InitOutputType),  INTENT(IN) :: InData
  INTEGER(IntKi),   INTENT(  OUT) :: ErrStat
  CHARACTER(*),     INTENT(  OUT) :: ErrMsg
  LOGICAL,OPTIONAL, INTENT(IN   ) :: SizeOnly
    ! Local variables
  INTEGER(IntKi)                 :: Re_BufSz
  INTEGER(IntKi)                 :: Re_Xferred
  INTEGER(IntKi)                 :: Db_BufSz
  INTEGER(IntKi)                 :: Db_Xferred
  INTEGER(IntKi)                 :: Int_BufSz
  INTEGER(IntKi)                 :: Int_Xferred
  INTEGER(IntKi)                 :: i,i1,i2,i3,i4,i5
  LOGICAL                        :: OnlySize ! if present and true, do not pack, just allocate buffers
  INTEGER(IntKi)                 :: ErrStat2
  CHARACTER(ErrMsgLen)           :: ErrMsg2
  CHARACTER(*), PARAMETER        :: RoutineName = 'MAP_Fortran_PackLin_InitOutputType'
 ! buffers to store subtypes, if any
  REAL(ReKi),      ALLOCATABLE   :: Re_Buf(:)
  REAL(DbKi),      ALLOCATABLE   :: Db_Buf(:)
  INTEGER(IntKi),  ALLOCATABLE   :: Int_Buf(:)

  OnlySize = .FALSE.
  IF ( PRESENT(SizeOnly) ) THEN
    OnlySize = SizeOnly
  ENDIF
    !
  ErrStat = ErrID_None
  ErrMsg  = ""
  Re_BufSz  = 0
  Db_BufSz  = 0
  Int_BufSz  = 0
  Int_BufSz   = Int_BufSz   + 1     ! LinNames_y allocated yes/no
  IF ( ALLOCATED(InData%LinNames_y) ) THEN
    Int_BufSz   = Int_BufSz   + 2*1  ! LinNames_y upper/lower bounds for each dimension
      Int_BufSz  = Int_BufSz  + SIZE(InData%LinNames_y)*LEN(InData%LinNames_y)  ! LinNames_y
  END IF
  Int_BufSz   = Int_BufSz   + 1     ! LinNames_u allocated yes/no
  IF ( ALLOCATED(InData%LinNames_u) ) THEN
    Int_BufSz   = Int_BufSz   + 2*1  ! LinNames_u upper/lower bounds for each dimension
      Int_BufSz  = Int_BufSz  + SIZE(InData%LinNames_u)*LEN(InData%LinNames_u)  ! LinNames_u
  END IF
  Int_BufSz   = Int_BufSz   + 1     ! IsLoad_u allocated yes/no
  IF ( ALLOCATED(InData%IsLoad_u) ) THEN
    Int_BufSz   = Int_BufSz   + 2*1  ! IsLoad_u upper/lower bounds for each dimension
      Int_BufSz  = Int_BufSz  + SIZE(InData%IsLoad_u)  ! IsLoad_u
  END IF
  IF ( Re_BufSz  .GT. 0 ) THEN 
     ALLOCATE( ReKiBuf(  Re_BufSz  ), STAT=ErrStat2 )
     IF (ErrStat2 /= 0) THEN 
       CALL SetErrStat(ErrID_Fatal, 'Error allocating ReKiBuf.', ErrStat, ErrMsg,RoutineName)
       RETURN
     END IF
  END IF
  IF ( Db_BufSz  .GT. 0 ) THEN 
     ALLOCATE( DbKiBuf(  Db_BufSz  ), STAT=ErrStat2 )
     IF (ErrStat2 /= 0) THEN 
       CALL SetErrStat(ErrID_Fatal, 'Error allocating DbKiBuf.', ErrStat, ErrMsg,RoutineName)
       RETURN
     END IF
  END IF
  IF ( Int_BufSz  .GT. 0 ) THEN 
     ALLOCATE( IntKiBuf(  Int_BufSz  ), STAT=ErrStat2 )
     IF (ErrStat2 /= 0) THEN 
       CALL SetErrStat(ErrID_Fatal, 'Error allocating IntKiBuf.', ErrStat, ErrMsg,RoutineName)
       RETURN
     END IF
  END IF
  IF(OnlySize) RETURN ! return early if only trying to allocate buffers (not pack them)

  Re_Xferred  = 1
  Db_Xferred  = 1
  Int_Xferred = 1

  IF ( .NOT. ALLOCATED(InData%LinNames_y) ) THEN
    IntKiBuf( Int_Xferred ) = 0
    Int_Xferred = Int_Xferred + 1
  ELSE
    IntKiBuf( Int_Xferred ) = 1
    Int_Xferred = Int_Xferred + 1
    IntKiBuf( Int_Xferred    ) = LBOUND(InData%LinNames_y,1)
    IntKiBuf( Int_Xferred + 1) = UBOUND(InData%LinNames_y,1)
    Int_Xferred = Int_Xferred + 2

    DO i1 = LBOUND(InData%LinNames_y,1), UBOUND(InData%LinNames_y,1)
        DO I = 1, LEN(InData%LinNames_y)
          IntKiBuf(Int_Xferred) = ICHAR(InData%LinNames_y(i1)(I:I), IntKi)
          Int_Xferred = Int_Xferred   + 1
        END DO ! I
    END DO !i1
  END IF
  IF ( .NOT. ALLOCATED(InData%LinNames_u) ) THEN
    IntKiBuf( Int_Xferred ) = 0
    Int_Xferred = Int_Xferred + 1
  ELSE
    IntKiBuf( Int_Xferred ) = 1
    Int_Xferred = Int_Xferred + 1
    IntKiBuf( Int_Xferred    ) = LBOUND(InData%LinNames_u,1)
    IntKiBuf( Int_Xferred + 1) = UBOUND(InData%LinNames_u,1)
    Int_Xferred = Int_Xferred + 2

    DO i1 = LBOUND(InData%LinNames_u,1), UBOUND(InData%LinNames_u,1)
        DO I = 1, LEN(InData%LinNames_u)
          IntKiBuf(Int_Xferred) = ICHAR(InData%LinNames_u(i1)(I:I), IntKi)
          Int_Xferred = Int_Xferred   + 1
        END DO ! I
    END DO !i1
  END IF
  IF ( .NOT. ALLOCATED(InData%IsLoad_u) ) THEN
    IntKiBuf( Int_Xferred ) = 0
    Int_Xferred = Int_Xferred + 1
  ELSE
    IntKiBuf( Int_Xferred ) = 1
    Int_Xferred = Int_Xferred + 1
    IntKiBuf( Int_Xferred    ) = LBOUND(InData%IsLoad_u,1)
    IntKiBuf( Int_Xferred + 1) = UBOUND(InData%IsLoad_u,1)
    Int_Xferred = Int_Xferred + 2

      IF (SIZE(InData%IsLoad_u)>0) IntKiBuf ( Int_Xferred:Int_Xferred+SIZE(InData%IsLoad_u)-1 ) = TRANSFER(PACK( InData%IsLoad_u ,.TRUE.), IntKiBuf(1), SIZE(InData%IsLoad_u))
      Int_Xferred   = Int_Xferred   + SIZE(InData%IsLoad_u)
  END IF
 END SUBROUTINE MAP_Fortran_PackLin_InitOutputType

 SUBROUTINE MAP_Fortran_UnPackLin_InitOutputType( ReKiBuf, DbKiBuf, IntKiBuf, Outdata, ErrStat, ErrMsg )
  REAL(ReKi),      ALLOCATABLE, INTENT(IN   ) :: ReKiBuf(:)
  REAL(DbKi),      ALLOCATABLE, INTENT(IN   ) :: DbKiBuf(:)
  INTEGER(IntKi),  ALLOCATABLE, INTENT(IN   ) :: IntKiBuf(:)
  TYPE(Lin_InitOutputType), INTENT(INOUT) :: OutData
  INTEGER(IntKi),  INTENT(  OUT) :: ErrStat
  CHARACTER(*),    INTENT(  OUT) :: ErrMsg
    ! Local variables
  INTEGER(IntKi)                 :: Buf_size
  INTEGER(IntKi)                 :: Re_Xferred
  INTEGER(IntKi)                 :: Db_Xferred
  INTEGER(IntKi)                 :: Int_Xferred
  INTEGER(IntKi)                 :: i
  LOGICAL                        :: mask0
  LOGICAL, ALLOCATABLE           :: mask1(:)
  LOGICAL, ALLOCATABLE           :: mask2(:,:)
  LOGICAL, ALLOCATABLE           :: mask3(:,:,:)
  LOGICAL, ALLOCATABLE           :: mask4(:,:,:,:)
  LOGICAL, ALLOCATABLE           :: mask5(:,:,:,:,:)
  INTEGER(IntKi)                 :: i1, i1_l, i1_u  !  bounds (upper/lower) for an array dimension 1
  INTEGER(IntKi)                 :: ErrStat2
  CHARACTER(ErrMsgLen)           :: ErrMsg2
  CHARACTER(*), PARAMETER        :: RoutineName = 'MAP_Fortran_UnPackLin_InitOutputType'
 ! buffers to store meshes, if any
  REAL(ReKi),      ALLOCATABLE   :: Re_Buf(:)
  REAL(DbKi),      ALLOCATABLE   :: Db_Buf(:)
  INTEGER(IntKi),  ALLOCATABLE   :: Int_Buf(:)
    !
  ErrStat = ErrID_None
  ErrMsg  = ""
  Re_Xferred  = 1
  Db_Xferred  = 1
  Int_Xferred  = 1
  IF ( IntKiBuf( Int_Xferred ) == 0 ) THEN  ! LinNames_y not allocated
    Int_Xferred = Int_Xferred + 1
  ELSE
    Int_Xferred = Int_Xferred + 1
    i1_l = IntKiBuf( Int_Xferred    )
    i1_u = IntKiBuf( Int_Xferred + 1)
    Int_Xferred = Int_Xferred + 2
    IF (ALLOCATED(OutData%LinNames_y)) DEALLOCATE(OutData%LinNames_y)
    ALLOCATE(OutData%LinNames_y(i1_l:i1_u),STAT=ErrStat2)
    IF (ErrStat2 /= 0) THEN 
       CALL SetErrStat(ErrID_Fatal, 'Error allocating OutData%LinNames_y.', ErrStat, ErrMsg,RoutineName)
       RETURN
    END IF
    ALLOCATE(mask1(i1_l:i1_u),STAT=ErrStat2)
    IF (ErrStat2 /= 0) THEN 
       CALL SetErrStat(ErrID_Fatal, 'Error allocating mask1.', ErrStat, ErrMsg,RoutineName)
       RETURN
    END IF
    mask1 = .TRUE. 
    DO i1 = LBOUND(OutData%LinNames_y,1), UBOUND(OutData%LinNames_y,1)
        DO I = 1, LEN(OutData%LinNames_y)
          OutData%LinNames_y(i1)(I:I) = CHAR(IntKiBuf(Int_Xferred))
          Int_Xferred = Int_Xferred   + 1
        END DO ! I
    END DO !i1
    DEALLOCATE(mask1)
  END IF
  IF ( IntKiBuf( Int_Xferred ) == 0 ) THEN  ! LinNames_u not allocated
    Int_Xferred = Int_Xferred + 1
  ELSE
    Int_Xferred = Int_Xferred + 1
    i1_l = IntKiBuf( Int_Xferred    )
    i1_u = IntKiBuf( Int_Xferred + 1)
    Int_Xferred = Int_Xferred + 2
    IF (ALLOCATED(OutData%LinNames_u)) DEALLOCATE(OutData%LinNames_u)
    ALLOCATE(OutData%LinNames_u(i1_l:i1_u),STAT=ErrStat2)
    IF (ErrStat2 /= 0) THEN 
       CALL SetErrStat(ErrID_Fatal, 'Error allocating OutData%LinNames_u.', ErrStat, ErrMsg,RoutineName)
       RETURN
    END IF
    ALLOCATE(mask1(i1_l:i1_u),STAT=ErrStat2)
    IF (ErrStat2 /= 0) THEN 
       CALL SetErrStat(ErrID_Fatal, 'Error allocating mask1.', ErrStat, ErrMsg,RoutineName)
       RETURN
    END IF
    mask1 = .TRUE. 
    DO i1 = LBOUND(OutData%LinNames_u,1), UBOUND(OutData%LinNames_u,1)
        DO I = 1, LEN(OutData%LinNames_u)
          OutData%LinNames_u(i1)(I:I) = CHAR(IntKiBuf(Int_Xferred))
          Int_Xferred = Int_Xferred   + 1
        END DO ! I
    END DO !i1
    DEALLOCATE(mask1)
  END IF
  IF ( IntKiBuf( Int_Xferred ) == 0 ) THEN  ! IsLoad_u not allocated
    Int_Xferred = Int_Xferred + 1
  ELSE
    Int_Xferred = Int_Xferred + 1
    i1_l = IntKiBuf( Int_Xferred    )
    i1_u = IntKiBuf( Int_Xferred + 1)
    Int_Xferred = Int_Xferred + 2
    IF (ALLOCATED(OutData%IsLoad_u)) DEALLOCATE(OutData%IsLoad_u)
    ALLOCATE(OutData%IsLoad_u(i1_l:i1_u),STAT=ErrStat2)
    IF (ErrStat2 /= 0) THEN 
       CALL SetErrStat(ErrID_Fatal, 'Error allocating OutData%IsLoad_u.', ErrStat, ErrMsg,RoutineName)
       RETURN
    END IF
    ALLOCATE(mask1(i1_l:i1_u),STAT=ErrStat2)
    IF (ErrStat2 /= 0) THEN 
       CALL SetErrStat(ErrID_Fatal, 'Error allocating mask1.', ErrStat, ErrMsg,RoutineName)
       RETURN
    END IF
    mask1 = .TRUE. 
      IF (SIZE(OutData%IsLoad_u)>0) OutData%IsLoad_u = UNPACK( TRANSFER( IntKiBuf ( Int_Xferred:Int_Xferred+(SIZE(OutData%IsLoad_u))-1 ), OutData%IsLoad_u), mask1,.TRUE.)
      Int_Xferred   = Int_Xferred   + SIZE(OutData%IsLoad_u)
    DEALLOCATE(mask1)
  END IF
 END SUBROUTINE MAP_Fortran_UnPackLin_InitOutputType

 SUBROUTINE MAP_Fortran_CopyLin_ParamType( SrcLin_ParamTypeData, DstLin_ParamTypeData, CtrlCode, ErrStat, ErrMsg )
   TYPE(Lin_ParamType), INTENT(IN) :: SrcLin_ParamTypeData
   TYPE(Lin_ParamType), INTENT(INOUT) :: DstLin_ParamTypeData
   INTEGER(IntKi),  INTENT(IN   ) :: CtrlCode
   INTEGER(IntKi),  INTENT(  OUT) :: ErrStat
   CHARACTER(*),    INTENT(  OUT) :: ErrMsg
! Local 
   INTEGER(IntKi)                 :: i,j,k
   INTEGER(IntKi)                 :: i1, i1_l, i1_u  !  bounds (upper/lower) for an array dimension 1
   INTEGER(IntKi)                 :: i2, i2_l, i2_u  !  bounds (upper/lower) for an array dimension 2
   INTEGER(IntKi)                 :: ErrStat2
   CHARACTER(ErrMsgLen)           :: ErrMsg2
   CHARACTER(*), PARAMETER        :: RoutineName = 'MAP_Fortran_CopyLin_ParamType'
! 
   ErrStat = ErrID_None
   ErrMsg  = ""
IF (ALLOCATED(SrcLin_ParamTypeData%Jac_u_indx)) THEN
  i1_l = LBOUND(SrcLin_ParamTypeData%Jac_u_indx,1)
  i1_u = UBOUND(SrcLin_ParamTypeData%Jac_u_indx,1)
  i2_l = LBOUND(SrcLin_ParamTypeData%Jac_u_indx,2)
  i2_u = UBOUND(SrcLin_ParamTypeData%Jac_u_indx,2)
  IF (.NOT. ALLOCATED(DstLin_ParamTypeData%Jac_u_indx)) THEN 
    ALLOCATE(DstLin_ParamTypeData%Jac_u_indx(i1_l:i1_u,i2_l:i2_u),STAT=ErrStat2)
    IF (ErrStat2 /= 0) THEN 
      CALL SetErrStat(ErrID_Fatal, 'Error allocating DstLin_ParamTypeData%Jac_u_indx.', ErrStat, ErrMsg,RoutineName)
      RETURN
    END IF
  END IF
    DstLin_ParamTypeData%Jac_u_indx = SrcLin_ParamTypeData%Jac_u_indx
ENDIF
    DstLin_ParamTypeData%du = SrcLin_ParamTypeData%du
    DstLin_ParamTypeData%Jac_ny = SrcLin_ParamTypeData%Jac_ny
 END SUBROUTINE MAP_Fortran_CopyLin_ParamType

 SUBROUTINE MAP_Fortran_DestroyLin_ParamType( Lin_ParamTypeData, ErrStat, ErrMsg )
  TYPE(Lin_ParamType), INTENT(INOUT) :: Lin_ParamTypeData
  INTEGER(IntKi),  INTENT(  OUT) :: ErrStat
  CHARACTER(*),    INTENT(  OUT) :: ErrMsg
  CHARACTER(*),    PARAMETER :: RoutineName = 'MAP_Fortran_DestroyLin_ParamType'
  INTEGER(IntKi)                 :: i, i1, i2, i3, i4, i5 
! 
  ErrStat = ErrID_None
  ErrMsg  = ""
IF (ALLOCATED(Lin_ParamTypeData%Jac_u_indx)) THEN
  DEALLOCATE(Lin_ParamTypeData%Jac_u_indx)
ENDIF
 END SUBROUTINE MAP_Fortran_DestroyLin_ParamType

 SUBROUTINE MAP_Fortran_PackLin_ParamType( ReKiBuf, DbKiBuf, IntKiBuf, Indata, ErrStat, ErrMsg, SizeOnly )
  REAL(ReKi),       ALLOCATABLE, INTENT(  OUT) :: ReKiBuf(:)
  REAL(DbKi),       ALLOCATABLE, INTENT(  OUT) :: DbKiBuf(:)
  INTEGER(IntKi),   ALLOCATABLE, INTENT(  OUT) :: IntKiBuf(:)
  TYPE(Lin_ParamType),  INTENT(IN) :: InData
  INTEGER(IntKi),   INTENT(  OUT) :: ErrStat
  CHARACTER(*),     INTENT(  OUT) :: ErrMsg
  LOGICAL,OPTIONAL, INTENT(IN   ) :: SizeOnly
    ! Local variables
  INTEGER(IntKi)                 :: Re_BufSz
  INTEGER(IntKi)                 :: Re_Xferred
  INTEGER(IntKi)                 :: Db_BufSz
  INTEGER(IntKi)                 :: Db_Xferred
  INTEGER(IntKi)                 :: Int_BufSz
  INTEGER(IntKi)                 :: Int_Xferred
  INTEGER(IntKi)                 :: i,i1,i2,i3,i4,i5
  LOGICAL                        :: OnlySize ! if present and true, do not pack, just allocate buffers
  INTEGER(IntKi)                 :: ErrStat2
  CHARACTER(ErrMsgLen)           :: ErrMsg2
  CHARACTER(*), PARAMETER        :: RoutineName = 'MAP_Fortran_PackLin_ParamType'
 ! buffers to store subtypes, if any
  REAL(ReKi),      ALLOCATABLE   :: Re_Buf(:)
  REAL(DbKi),      ALLOCATABLE   :: Db_Buf(:)
  INTEGER(IntKi),  ALLOCATABLE   :: Int_Buf(:)

  OnlySize = .FALSE.
  IF ( PRESENT(SizeOnly) ) THEN
    OnlySize = SizeOnly
  ENDIF
    !
  ErrStat = ErrID_None
  ErrMsg  = ""
  Re_BufSz  = 0
  Db_BufSz  = 0
  Int_BufSz  = 0
  Int_BufSz   = Int_BufSz   + 1     ! Jac_u_indx allocated yes/no
  IF ( ALLOCATED(InData%Jac_u_indx) ) THEN
    Int_BufSz   = Int_BufSz   + 2*2  ! Jac_u_indx upper/lower bounds for each dimension
      Int_BufSz  = Int_BufSz  + SIZE(InData%Jac_u_indx)  ! Jac_u_indx
  END IF
      Db_BufSz   = Db_BufSz   + 1  ! du
      Int_BufSz  = Int_BufSz  + 1  ! Jac_ny
  IF ( Re_BufSz  .GT. 0 ) THEN 
     ALLOCATE( ReKiBuf(  Re_BufSz  ), STAT=ErrStat2 )
     IF (ErrStat2 /= 0) THEN 
       CALL SetErrStat(ErrID_Fatal, 'Error allocating ReKiBuf.', ErrStat, ErrMsg,RoutineName)
       RETURN
     END IF
  END IF
  IF ( Db_BufSz  .GT. 0 ) THEN 
     ALLOCATE( DbKiBuf(  Db_BufSz  ), STAT=ErrStat2 )
     IF (ErrStat2 /= 0) THEN 
       CALL SetErrStat(ErrID_Fatal, 'Error allocating DbKiBuf.', ErrStat, ErrMsg,RoutineName)
       RETURN
     END IF
  END IF
  IF ( Int_BufSz  .GT. 0 ) THEN 
     ALLOCATE( IntKiBuf(  Int_BufSz  ), STAT=ErrStat2 )
     IF (ErrStat2 /= 0) THEN 
       CALL SetErrStat(ErrID_Fatal, 'Error allocating IntKiBuf.', ErrStat, ErrMsg,RoutineName)
       RETURN
     END IF
  END IF
  IF(OnlySize) RETURN ! return early if only trying to allocate buffers (not pack them)

  Re_Xferred  = 1
  Db_Xferred  = 1
  Int_Xferred = 1

  IF ( .NOT. ALLOCATED(InData%Jac_u_indx) ) THEN
    IntKiBuf( Int_Xferred ) = 0
    Int_Xferred = Int_Xferred + 1
  ELSE
    IntKiBuf( Int_Xferred ) = 1
    Int_Xferred = Int_Xferred + 1
    IntKiBuf( Int_Xferred    ) = LBOUND(InData%Jac_u_indx,1)
    IntKiBuf( Int_Xferred + 1) = UBOUND(InData%Jac_u_indx,1)
    Int_Xferred = Int_Xferred + 2
    IntKiBuf( Int_Xferred    ) = LBOUND(InData%Jac_u_indx,2)
    IntKiBuf( Int_Xferred + 1) = UBOUND(InData%Jac_u_indx,2)
    Int_Xferred = Int_Xferred + 2

      IF (SIZE(InData%Jac_u_indx)>0) IntKiBuf ( Int_Xferred:Int_Xferred+(SIZE(InData%Jac_u_indx))-1 ) = PACK(InData%Jac_u_indx,.TRUE.)
      Int_Xferred   = Int_Xferred   + SIZE(InData%Jac_u_indx)
  END IF
      DbKiBuf ( Db_Xferred:Db_Xferred+(1)-1 ) = InData%du
      Db_Xferred   = Db_Xferred   + 1
      IntKiBuf ( Int_Xferred:Int_Xferred+(1)-1 ) = InData%Jac_ny
      Int_Xferred   = Int_Xferred   + 1
 END SUBROUTINE MAP_Fortran_PackLin_ParamType

 SUBROUTINE MAP_Fortran_UnPackLin_ParamType( ReKiBuf, DbKiBuf, IntKiBuf, Outdata, ErrStat, ErrMsg )
  REAL(ReKi),      ALLOCATABLE, INTENT(IN   ) :: ReKiBuf(:)
  REAL(DbKi),      ALLOCATABLE, INTENT(IN   ) :: DbKiBuf(:)
  INTEGER(IntKi),  ALLOCATABLE, INTENT(IN   ) :: IntKiBuf(:)
  TYPE(Lin_ParamType), INTENT(INOUT) :: OutData
  INTEGER(IntKi),  INTENT(  OUT) :: ErrStat
  CHARACTER(*),    INTENT(  OUT) :: ErrMsg
    ! Local variables
  INTEGER(IntKi)                 :: Buf_size
  INTEGER(IntKi)                 :: Re_Xferred
  INTEGER(IntKi)                 :: Db_Xferred
  INTEGER(IntKi)                 :: Int_Xferred
  INTEGER(IntKi)                 :: i
  LOGICAL                        :: mask0
  LOGICAL, ALLOCATABLE           :: mask1(:)
  LOGICAL, ALLOCATABLE           :: mask2(:,:)
  LOGICAL, ALLOCATABLE           :: mask3(:,:,:)
  LOGICAL, ALLOCATABLE           :: mask4(:,:,:,:)
  LOGICAL, ALLOCATABLE           :: mask5(:,:,:,:,:)
  INTEGER(IntKi)                 :: i1, i1_l, i1_u  !  bounds (upper/lower) for an array dimension 1
  INTEGER(IntKi)                 :: i2, i2_l, i2_u  !  bounds (upper/lower) for an array dimension 2
  INTEGER(IntKi)                 :: ErrStat2
  CHARACTER(ErrMsgLen)           :: ErrMsg2
  CHARACTER(*), PARAMETER        :: RoutineName = 'MAP_Fortran_UnPackLin_ParamType'
 ! buffers to store meshes, if any
  REAL(ReKi),      ALLOCATABLE   :: Re_Buf(:)
  REAL(DbKi),      ALLOCATABLE   :: Db_Buf(:)
  INTEGER(IntKi),  ALLOCATABLE   :: Int_Buf(:)
    !
  ErrStat = ErrID_None
  ErrMsg  = ""
  Re_Xferred  = 1
  Db_Xferred  = 1
  Int_Xferred  = 1
  IF ( IntKiBuf( Int_Xferred ) == 0 ) THEN  ! Jac_u_indx not allocated
    Int_Xferred = Int_Xferred + 1
  ELSE
    Int_Xferred = Int_Xferred + 1
    i1_l = IntKiBuf( Int_Xferred    )
    i1_u = IntKiBuf( Int_Xferred + 1)
    Int_Xferred = Int_Xferred + 2
    i2_l = IntKiBuf( Int_Xferred    )
    i2_u = IntKiBuf( Int_Xferred + 1)
    Int_Xferred = Int_Xferred + 2
    IF (ALLOCATED(OutData%Jac_u_indx)) DEALLOCATE(OutData%Jac_u_indx)
    ALLOCATE(OutData%Jac_u_indx(i1_l:i1_u,i2_l:i2_u),STAT=ErrStat2)
    IF (ErrStat2 /= 0) THEN 
       CALL SetErrStat(ErrID_Fatal, 'Error allocating OutData%Jac_u_indx.', ErrStat, ErrMsg,RoutineName)
       RETURN
    END IF
    ALLOCATE(mask2(i1_l:i1_u,i2_l:i2_u),STAT=ErrStat2)
    IF (ErrStat2 /= 0) THEN 
       CALL SetErrStat(ErrID_Fatal, 'Error allocating mask2.', ErrStat, ErrMsg,RoutineName)
       RETURN
    END IF
    mask2 = .TRUE. 
      IF (SIZE(OutData%Jac_u_indx)>0) OutData%Jac_u_indx = UNPACK( IntKiBuf ( Int_Xferred:Int_Xferred+(SIZE(OutData%Jac_u_indx))-1 ), mask2, 0_IntKi )
      Int_Xferred   = Int_Xferred   + SIZE(OutData%Jac_u_indx)
    DEALLOCATE(mask2)
  END IF
      OutData%du = REAL( DbKiBuf( Db_Xferred ), R8Ki) 
      Db_Xferred   = Db_Xferred + 1
      OutData%Jac_ny = IntKiBuf( Int_Xferred ) 
      Int_Xferred   = Int_Xferred + 1
 END SUBROUTINE MAP_Fortran_UnPackLin_ParamType

END MODULE MAP_Fortran_Types
!ENDOFREGISTRYGENERATEDFILE
