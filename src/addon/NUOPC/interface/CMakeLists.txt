set(SOURCEC NUOPC_F.C)
set(SOURCEF NUOPC_C.F90)
set(STOREH  NUOPC.h)

copy_storeh()

target_sources(esmf PRIVATE ${SOURCEC} ${SOURCEF})
