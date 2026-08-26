
set(SOURCEC	ESMCI_Base.C ESMCI_Info.C ESMC_InfoCDef.C ESMC_InfoCDefGeneric.C)
set(SOURCEF )
set(SOURCEH )
set(STOREH  ESMCI_Base.h nlohmann/json/json.hpp ESMCI_Info.h)

copy_storeh()

target_sources(esmf PRIVATE ${SOURCEC})
