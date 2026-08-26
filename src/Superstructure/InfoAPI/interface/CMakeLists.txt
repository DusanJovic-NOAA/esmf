set(SOURCEC )
set(SOURCEF ESMF_InfoDescribe.F90 ESMF_InfoSync.F90 ESMF_InfoCache.F90)
set(STOREH  )

target_sources(esmf PRIVATE ${SOURCEC} ${SOURCEF})
