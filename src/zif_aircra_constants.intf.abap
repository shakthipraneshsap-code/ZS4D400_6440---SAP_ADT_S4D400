INTERFACE zif_aircra_constants
  PUBLIC .

  " Status
  CONSTANTS:
    gc_status_new       TYPE zaircra_wo-status VALUE 'NEW',
    gc_status_approved  TYPE zaircra_wo-status VALUE 'APPROVED',
    gc_status_completed TYPE zaircra_wo-status VALUE 'COMPLETED'.

  " Priority
  CONSTANTS:
    gc_priority_low    TYPE zaircra_wo-priority VALUE 'LOW',
    gc_priority_medium TYPE zaircra_wo-priority VALUE 'MEDIUM',
    gc_priority_high   TYPE zaircra_wo-priority VALUE 'HIGH'.

ENDINTERFACE.
