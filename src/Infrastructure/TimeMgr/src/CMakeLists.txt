set(SOURCEC ESMCI_BaseTime.C ESMCI_TimeInterval.C ESMCI_Time.C
            ESMCI_Calendar.C ESMCI_Alarm.C ESMCI_Clock.C)
set(SOURCEF )
set(STOREH  ESMCI_BaseTime.h ESMCI_TimeInterval.h ESMCI_Time.h
            ESMCI_Calendar.h ESMCI_Alarm.h ESMCI_Clock.h)

copy_storeh()

target_sources(esmf PRIVATE ${SOURCEC} ${SOURCEF})
