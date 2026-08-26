set(SOURCEC ESMCI_WebServNetEsmfClient.C
            ESMCI_WebServDataDesc.C
            ESMCI_WebServDataContent.C
            ESMCI_WebServDataMgr.C
            ESMCI_WebServClientInfo.C
            ESMCI_WebServCompSvrInfo.C
            ESMCI_WebServClientSocket.C
            ESMCI_WebServServerSocket.C
            ESMCI_WebServRegistrarClient.C
            ESMCI_WebServComponentSvr.C
            ESMCI_WebServCompSvrClient.C
            ESMCI_WebServSocketUtils.C
            ESMCI_WebServLowLevelSocket.C
            ESMCI_WebServCompSvrMgr.C
            ESMCI_WebServGRAMClient.C
            ESMCI_WebServForkClient.C
            ESMCI_WebServProcCtrl.C
            ESMCI_WebServProcCtrlClient.C
            ESMCI_WebServ_F.C)
set(SOURCEF ESMF_WebServ.F90 ESMF_WebServComponent_C.F90)

set(STOREH  ESMCI_WebServLowLevelSocket.h
            ESMCI_WebServServerSocket.h
            ESMCI_WebServClientSocket.h
            ESMCI_WebServNetEsmf.h
            ESMCI_WebServNetEsmfClient.h
            ESMCI_WebServClientInfo.h
            ESMCI_WebServCompSvrClient.h
            ESMCI_WebServProcCtrlClient.h
            ESMCI_WebServProcCtrl.h
            ESMCI_WebServDataDesc.h
            ESMCI_WebServDataContent.h
            ESMCI_WebServCompSvrMgr.h)

copy_storeh()

set_source_files_properties(${SOURCEC} DIRECTORY ${CMAKE_SOURCE_DIR} PROPERTIES INCLUDE_DIRECTORIES ${CMAKE_CURRENT_SOURCE_DIR}/../include)

target_sources(esmf PRIVATE ${SOURCEC} ${SOURCEF})
