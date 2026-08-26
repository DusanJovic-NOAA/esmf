set(SOURCEF NUOPC_FreeFormatDef.F90
            NUOPC_FieldDictionaryDef.F90 NUOPC_FieldDictionaryApi.F90
            NUOPC_Auxiliary.F90 NUOPC_Base.F90
            NUOPC_Compliance_Base.F90
            NUOPC_Compliance_Driver.F90 NUOPC_Compliance_Model.F90
            NUOPC_Compliance_Connector.F90
            NUOPC_RunSequenceDef.F90 NUOPC_Comp.F90 NUOPC.F90
            NUOPC_ModelBase.F90 NUOPC_Model.F90
            NUOPC_Mediator.F90
            NUOPC_Driver.F90
            NUOPC_Connector.F90)

target_sources(esmf PRIVATE ${SOURCEF})
