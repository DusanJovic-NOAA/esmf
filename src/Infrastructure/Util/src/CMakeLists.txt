set(AUTOGEN ESMF_FortranWordsize.F90 ESMF_TypeKindGet.F90 ESMF_UtilSort.F90)
set(SOURCEC ESMCI_Util.C ESMCI_Fraction.C ESMCI_F90Interface.C ESMCI_CoordSys.C)
set(SOURCEF ESMF_UtilTypes.F90 ESMF_UtilString.F90 ESMF_LogErr.F90 ESMF_InitMacros.F90
            ESMF_IOUtil.F90
            ESMF_StaggerLocType.F90 ESMF_UtilCubedSphere.F90 ESMF_AttPackType.F90)

set(STOREH  ESMCI_Arg.h ESMF_Macros.inc ESMF.h ESMCI_Util.h
            ESMF_TypeKindRankMacros.hcppF90 ESMCI_Macros.h
            ESMCI_F90Interface.h ESMF_ErrReturnCodes.inc
            ESMF_LogMacros.inc ESMF_LogConstants.inc ESMCI_Fraction.h
            ESMF_TypeKindMacros.hcppF90 ESMF_InitMacros.inc ESMCI_CoordSys.h)

copy_storeh()

run_cppF90_to_F90()

target_sources(esmf PRIVATE ${SOURCEC} ${SOURCEF})
