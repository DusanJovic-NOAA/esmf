set(SOURCEF
           dcopy.F90  ddot.F90  dger.F90  dnrm2.F90  drot.F90  dscal.F90  dswap.F90  dtrmm.F90
           dtrmv.F90  idamax.F90 dgemv.F90 dgemm.F90 dtrsm.F90 daxpy.F90  dsyr2k.F90
           dsyr2.F90  dsymv.F90)

target_sources(esmf PRIVATE ${SOURCEF})
