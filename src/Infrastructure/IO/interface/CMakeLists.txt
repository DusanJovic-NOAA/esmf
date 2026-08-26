set(AUTOGEN ESMF_IO_NCPutGet.F90)
set(SOURCEC ESMCI_IO_NetCDF_F.C ESMC_IOScrip2ESMF.C
            ESMCI_IO_F.C ESMC_IO_Gridspec.C ESMC_IO_Scrip.C
            ESMCI_IO_YAML_F.C)
set(SOURCEF ESMF_IO_NetCDF.F90 ESMF_IOUGrid.F90 ESMF_IOGridspec.F90
            ESMF_IOGridmosaic.F90 ESMF_IOScrip.F90
            ESMF_IOFileTypeCheck.F90
            ESMF_IO.F90 ESMF_IO_Gridspec_C.F90 ESMF_IO_Scrip_C.F90
            ESMF_IO_YAML.F90)

run_cppF90_to_F90()

target_sources(esmf PRIVATE ${SOURCEC} ${SOURCEF})
