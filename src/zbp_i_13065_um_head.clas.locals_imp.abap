CLASS lcl_buffer DEFINITION CREATE PRIVATE.
  PUBLIC SECTION.
    TYPES:
      "Head
      tt_create_head            TYPE TABLE FOR CREATE zi_13065_um_head,
      tt_update_head            TYPE TABLE FOR UPDATE zi_13065_um_head,
      tt_delete_head            TYPE TABLE FOR DELETE zi_13065_um_head,
      tt_read_import_head       TYPE TABLE FOR READ IMPORT zi_13065_um_head,
      tt_read_result_head       TYPE TABLE FOR READ RESULT zi_13065_um_head,
      tt_read_import_head_item  TYPE TABLE FOR READ IMPORT zi_13065_um_head\_item,
      tt_read_result_head_item  TYPE TABLE FOR READ RESULT zi_13065_um_head\_item,
      tt_asso_link_head_item    TYPE TABLE FOR READ LINK zi_13065_um_head\_item,
      tt_create_head_item       TYPE TABLE FOR CREATE zi_13065_um_head\_item,

      "Item
      tt_update_item            TYPE TABLE FOR UPDATE zi_13065_um_item,
      tt_delete_item            TYPE TABLE FOR DELETE zi_13065_um_item,
      tt_read_import_item       TYPE TABLE FOR READ IMPORT zi_13065_um_item,
      tt_read_result_item       TYPE TABLE FOR READ RESULT zi_13065_um_item,
      tt_read_import_item_head  TYPE TABLE FOR READ IMPORT zi_13065_um_item\_head,
      tt_read_result_item_head  TYPE TABLE FOR READ RESULT zi_13065_um_item\_head,
      tt_asso_link_item_head    TYPE TABLE FOR READ LINK zi_13065_um_item\_head,
      tt_read_import_item_subit TYPE TABLE FOR READ IMPORT zi_13065_um_item\_subit,
      tt_read_result_item_subit TYPE TABLE FOR READ RESULT zi_13065_um_item\_subit,
      tt_asso_link_item_subit   TYPE TABLE FOR READ LINK zi_13065_um_item\_subit,
      tt_create_item_subit      TYPE TABLE FOR CREATE zi_13065_um_item\_subit,

      "SubItem
      tt_update_subit           TYPE TABLE FOR UPDATE zi_13065_um_subit,
      tt_delete_subit           TYPE TABLE FOR DELETE zi_13065_um_subit,
      tt_read_import_subit      TYPE TABLE FOR READ IMPORT zi_13065_um_subit,
      tt_read_result_subit      TYPE TABLE FOR READ RESULT zi_13065_um_subit,
      tt_read_import_subit_head TYPE TABLE FOR READ IMPORT zi_13065_um_subit\_head,
      tt_read_result_subit_head TYPE TABLE FOR READ RESULT zi_13065_um_subit\_head,
      tt_asso_link_subit_head   TYPE TABLE FOR READ LINK zi_13065_um_subit\_head,
      tt_read_import_subit_item TYPE TABLE FOR READ IMPORT zi_13065_um_subit\_item,
      tt_read_result_subit_item TYPE TABLE FOR READ RESULT zi_13065_um_subit\_item,
      tt_asso_link_subit_item   TYPE TABLE FOR READ LINK zi_13065_um_subit\_item.

    TYPES:
      tt_mapped_early   TYPE RESPONSE FOR MAPPED EARLY zi_13065_um_head,
      tt_failed_early   TYPE RESPONSE FOR FAILED EARLY zi_13065_um_head,
      tt_reported_early TYPE RESPONSE FOR REPORTED EARLY zi_13065_um_head,

      tt_mapped_late    TYPE RESPONSE FOR MAPPED LATE zi_13065_um_head,
      tt_failed_late    TYPE RESPONSE FOR FAILED LATE zi_13065_um_head,
      tt_reported_late  TYPE RESPONSE FOR REPORTED LATE zi_13065_um_head.

    TYPES:
      ty_um_head      TYPE zt13065_um_head,
      tt_um_head      TYPE STANDARD TABLE OF ty_um_head,
      ty_um_item      TYPE zt13065_um_item,
      tt_um_item      TYPE STANDARD TABLE OF ty_um_item,
      ty_um_subit     TYPE zt13065_um_subit,
      tt_um_subit     TYPE STANDARD TABLE OF ty_um_subit,

      ty_um_head_upd  TYPE zt13065_um_head WITH INDICATORS ind,
      tt_um_head_upd  TYPE STANDARD TABLE OF ty_um_head_upd,
      ty_um_item_upd  TYPE zt13065_um_item WITH INDICATORS ind,
      tt_um_item_upd  TYPE STANDARD TABLE OF ty_um_item_upd,
      ty_um_subit_upd TYPE zt13065_um_subit WITH INDICATORS ind,
      tt_um_subit_upd TYPE STANDARD TABLE OF ty_um_subit_upd.

    CLASS-METHODS get_instance
      RETURNING VALUE(ro_instance) TYPE REF TO lcl_buffer.

    METHODS:
      "Head part>>>
      create
        IMPORTING entities TYPE tt_create_head
        CHANGING  mapped   TYPE tt_mapped_early
                  failed   TYPE tt_failed_early
                  reported TYPE tt_reported_early,

      update
        IMPORTING entities TYPE tt_update_head
        CHANGING  mapped   TYPE tt_mapped_early
                  failed   TYPE tt_failed_early
                  reported TYPE tt_reported_early,

      delete
        IMPORTING keys     TYPE tt_delete_head
        CHANGING  mapped   TYPE tt_mapped_early
                  failed   TYPE tt_failed_early
                  reported TYPE tt_reported_early,

      read
        IMPORTING keys     TYPE tt_read_import_head
        CHANGING  result   TYPE tt_read_result_head
                  failed   TYPE tt_failed_early
                  reported TYPE tt_reported_early,
      rba_item
        IMPORTING keys_rba          TYPE tt_read_import_head_item
                  result_requested  TYPE c
        CHANGING  result            TYPE tt_read_result_head_item
                  association_links TYPE tt_asso_link_head_item
                  failed            TYPE tt_failed_early
                  reported          TYPE tt_reported_early,

      cba_item
        IMPORTING entities_cba TYPE tt_create_head_item
        CHANGING  mapped       TYPE tt_mapped_early
                  failed       TYPE tt_failed_early
                  reported     TYPE tt_reported_early,

      "Item part>>>
      update_item
        IMPORTING entities TYPE tt_update_item
        CHANGING  mapped   TYPE tt_mapped_early
                  failed   TYPE tt_failed_early
                  reported TYPE tt_reported_early,

      delete_item
        IMPORTING keys     TYPE tt_delete_item
        CHANGING  mapped   TYPE tt_mapped_early
                  failed   TYPE tt_failed_early
                  reported TYPE tt_reported_early,

      read_item IMPORTING keys     TYPE tt_read_import_item
                CHANGING  result   TYPE tt_read_result_item
                          failed   TYPE tt_failed_early
                          reported TYPE tt_reported_early,

      rba_item_head IMPORTING keys_rba          TYPE tt_read_import_item_head
                              result_requested  TYPE c
                    CHANGING  result            TYPE tt_read_result_item_head
                              association_links TYPE tt_asso_link_item_head
                              failed            TYPE tt_failed_early
                              reported          TYPE tt_reported_early,

      rba_item_subit IMPORTING keys_rba          TYPE tt_read_import_item_subit
                               result_requested  TYPE c
                     CHANGING  result            TYPE tt_read_result_item_subit
                               association_links TYPE tt_asso_link_item_subit
                               failed            TYPE tt_failed_early
                               reported          TYPE tt_reported_early,

      cba_subit
        IMPORTING entities_cba TYPE tt_create_item_subit
        CHANGING  mapped       TYPE tt_mapped_early
                  failed       TYPE tt_failed_early
                  reported     TYPE tt_reported_early,

      "Sub Item part>>>
      update_subit
        IMPORTING entities TYPE tt_update_subit
        CHANGING  mapped   TYPE tt_mapped_early
                  failed   TYPE tt_failed_early
                  reported TYPE tt_reported_early,

      delete_subit
        IMPORTING keys     TYPE tt_delete_subit
        CHANGING  mapped   TYPE tt_mapped_early
                  failed   TYPE tt_failed_early
                  reported TYPE tt_reported_early,

      read_subit IMPORTING keys     TYPE tt_read_import_subit
                 CHANGING  result   TYPE tt_read_result_subit
                           failed   TYPE tt_failed_early
                           reported TYPE tt_reported_early,

      rba_subit_head IMPORTING keys_rba          TYPE tt_read_import_subit_head
                               result_requested  TYPE c
                     CHANGING  result            TYPE tt_read_result_subit_head
                               association_links TYPE tt_asso_link_subit_head
                               failed            TYPE tt_failed_early
                               reported          TYPE tt_reported_early,

      rba_subit_item IMPORTING keys_rba          TYPE tt_read_import_subit_item
                               result_requested  TYPE c
                     CHANGING  result            TYPE tt_read_result_subit_item
                               association_links TYPE tt_asso_link_subit_item
                               failed            TYPE tt_failed_early
                               reported          TYPE tt_reported_early,

      "Save sequence
      save CHANGING reported TYPE tt_reported_late.
  PRIVATE SECTION.
    CLASS-DATA: go_instance  TYPE REF TO lcl_buffer,

                gt_head_ins  TYPE tt_um_head,
                gt_item_ins  TYPE tt_um_item,
                gt_subit_ins TYPE tt_um_subit,

                gt_head_upd  TYPE tt_um_head_upd,
                gt_item_upd  TYPE tt_um_item_upd,
                gt_subit_upd TYPE tt_um_subit_upd,

                gt_head_del  TYPE tt_um_head,
                gt_item_del  TYPE tt_um_item,
                gt_subit_del TYPE tt_um_subit.
ENDCLASS.

CLASS lhc_zi_13065_um_head DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR head RESULT result.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE head.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE head.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE head.

    METHODS read FOR READ
      IMPORTING keys FOR READ head RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK head.

    "! This method for EML read entity by association
    METHODS rba_item FOR READ
      IMPORTING keys_rba FOR READ head\_item FULL result_requested RESULT result LINK association_links.

    "! This method for EML create entity by association
    METHODS cba_item FOR MODIFY
      IMPORTING entities_cba FOR CREATE head\_item.

    METHODS test FOR MODIFY
      IMPORTING keys FOR ACTION head~test RESULT result.

    METHODS setdefaultvalue FOR DETERMINE ON MODIFY
      IMPORTING keys FOR head~setdefaultvalue.

    METHODS checkinput FOR VALIDATE ON SAVE
      IMPORTING keys FOR head~checkinput.

ENDCLASS.

CLASS lhc_zi_13065_um_head IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD create.
    lcl_buffer=>get_instance( )->create(
        EXPORTING
            entities = entities
        CHANGING
            mapped = mapped
            failed = failed
            reported = reported
     ).
  ENDMETHOD.

  METHOD update.
    lcl_buffer=>get_instance( )->update(
        EXPORTING
            entities = entities
        CHANGING
            mapped = mapped
            failed = failed
            reported = reported
     ).
  ENDMETHOD.

  METHOD delete.
    lcl_buffer=>get_instance( )->delete(
        EXPORTING
            keys = keys
        CHANGING
            mapped = mapped
            failed = failed
            reported = reported
     ).
  ENDMETHOD.

  METHOD read.
    lcl_buffer=>get_instance( )->read(
        EXPORTING
            keys = keys
        CHANGING
            result = result
            failed = failed
            reported = reported
     ).
  ENDMETHOD.

  METHOD lock.
    TRY.
        "Instantiate lock object
        DATA(lock) = cl_abap_lock_object_factory=>get_instance( iv_name = 'EZ13065_UM_HEAD' ).
      CATCH cx_abap_lock_failure INTO DATA(exception).
        RAISE SHORTDUMP exception.
    ENDTRY.

    LOOP AT keys ASSIGNING FIELD-SYMBOL(<key>).
      TRY.
          "enqueue travel instance
          lock->enqueue(
              it_parameter  = VALUE #( (  name = 'ID' value = REF #( <key>-id ) ) )
          ).
          "if foreign lock exists
        CATCH cx_abap_foreign_lock INTO DATA(foreign_lock).
          APPEND VALUE #( id = <key>-id ) TO failed-head.

          APPEND VALUE #( id = <key>-id
                          %msg = new_message_with_text( severity = if_abap_behv_message=>severity-error
                                                        text     = `Object locked!` )
                        ) TO reported-head.

        CATCH cx_abap_lock_failure INTO exception.
          RAISE SHORTDUMP exception.
      ENDTRY.
    ENDLOOP.
  ENDMETHOD.

  METHOD rba_item.
    lcl_buffer=>get_instance( )->rba_item(
        EXPORTING
            keys_rba = keys_rba
            result_requested = result_requested
        CHANGING
            result = result
            association_links = association_links
            failed = failed
            reported = reported
    ).
  ENDMETHOD.

  METHOD cba_item.
    lcl_buffer=>get_instance( )->cba_item(
        EXPORTING
            entities_cba = entities_cba
        CHANGING
            mapped = mapped
            failed = failed
            reported = reported
    ).
  ENDMETHOD.

  METHOD test.
    MODIFY ENTITIES OF zi_13065_um_head IN LOCAL MODE
        ENTITY head
        UPDATE FIELDS ( text )
        WITH VALUE #( FOR key IN keys ( %tky = key-%tky
                                        text = 'change by test button' ) )
        FAILED failed
        REPORTED reported.

    READ ENTITIES OF zi_13065_um_head IN LOCAL MODE
        ENTITY head
        ALL FIELDS WITH CORRESPONDING #( keys )
        RESULT DATA(results_new).

    result = VALUE #( FOR result_new IN results_new (
         %tky = result_new-%tky
         %param = result_new
     ) ).
  ENDMETHOD.

  METHOD setdefaultvalue.
    READ ENTITIES OF zi_13065_um_head IN LOCAL MODE
     ENTITY head
       FIELDS ( text )
       WITH CORRESPONDING #( keys )
     RESULT DATA(head_results)
     FAILED DATA(head_failed).

    DELETE head_results WHERE text IS NOT INITIAL.
    CHECK head_results IS NOT INITIAL.

    MODIFY ENTITIES OF zi_13065_um_head IN LOCAL MODE
      ENTITY head
        UPDATE FIELDS ( text )
        WITH VALUE #( FOR head_result IN head_results (
                          %tky   = head_result-%tky
                          text = 'Initial text' ) )
    REPORTED DATA(update_reported).

    "Set the changing parameter
    reported = CORRESPONDING #( DEEP update_reported ).
  ENDMETHOD.

  METHOD checkinput.
    READ ENTITIES OF zi_13065_um_head IN LOCAL MODE
        ENTITY head
        ALL FIELDS WITH CORRESPONDING #( keys )
        RESULT DATA(head_results).
    LOOP AT head_results INTO DATA(head_result).
      APPEND VALUE #(  %tky               = head_result-%tky
                       %state_area        = 'validate_text' ) TO reported-head.

      IF head_result-text IS INITIAL.
        APPEND VALUE #( %tky = head_result-%tky ) TO failed-head.

        APPEND VALUE #( %tky = head_result-%tky
                        %state_area = 'validate_text'
                        %msg = new_message_with_text( severity = if_abap_behv_message=>severity-error
                                                      text     = `Text is madatory!` )
                        %element-text = if_abap_behv=>mk-on
                      ) TO reported-head.

      ELSEIF head_result-text CA '0123456789'.
        APPEND VALUE #( %tky = head_result-%tky ) TO failed-head.

        APPEND VALUE #( %tky = head_result-%tky
                        %state_area = 'validate_text'
                        %msg = new_message_with_text( severity = if_abap_behv_message=>severity-error
                                                      text     = `The text cannot contain any number.` )
                        %element-text = if_abap_behv=>mk-on
                      ) TO reported-head.
      ENDIF.
    ENDLOOP.

    DELETE ADJACENT DUPLICATES FROM failed-head COMPARING ALL FIELDS.
  ENDMETHOD.

ENDCLASS.

CLASS lhc_zi_13065_um_item DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE item.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE item.

    METHODS read FOR READ
      IMPORTING keys FOR READ item RESULT result.

    METHODS rba_head FOR READ
      IMPORTING keys_rba FOR READ item\_head FULL result_requested RESULT result LINK association_links.

    METHODS rba_subit FOR READ
      IMPORTING keys_rba FOR READ item\_subit FULL result_requested RESULT result LINK association_links.

    METHODS cba_subit FOR MODIFY
      IMPORTING entities_cba FOR CREATE item\_subit.

ENDCLASS.

CLASS lhc_zi_13065_um_item IMPLEMENTATION.

  METHOD update.
    lcl_buffer=>get_instance( )->update_item(
      EXPORTING
          entities = entities
      CHANGING
          mapped = mapped
          failed = failed
          reported = reported
    ).
  ENDMETHOD.

  METHOD delete.
    lcl_buffer=>get_instance( )->delete_item(
        EXPORTING
            keys = keys
        CHANGING
            mapped = mapped
            failed = failed
            reported = reported
    ).
  ENDMETHOD.

  METHOD read.
    lcl_buffer=>get_instance( )->read_item(
        EXPORTING
            keys = keys
        CHANGING
            result = result
            failed = failed
            reported = reported
    ).
  ENDMETHOD.

  METHOD rba_head.
    lcl_buffer=>get_instance( )->rba_item_head(
        EXPORTING
            keys_rba = keys_rba
            result_requested = result_requested
        CHANGING
            result = result
            association_links = association_links
            failed = failed
            reported = reported
    ).
  ENDMETHOD.

  METHOD rba_subit.
    lcl_buffer=>get_instance( )->rba_item_subit(
        EXPORTING
            keys_rba = keys_rba
            result_requested = result_requested
        CHANGING
            result = result
            association_links = association_links
            failed = failed
            reported = reported
    ).
  ENDMETHOD.

  METHOD cba_subit.
    lcl_buffer=>get_instance( )->cba_subit(
        EXPORTING
            entities_cba = entities_cba
        CHANGING
            mapped = mapped
            failed = failed
            reported = reported
    ).
  ENDMETHOD.

ENDCLASS.

CLASS lhc_zi_13065_um_subit DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE subit.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE subit.

    METHODS read FOR READ
      IMPORTING keys FOR READ subit RESULT result.

    METHODS rba_head FOR READ
      IMPORTING keys_rba FOR READ subit\_head FULL result_requested RESULT result LINK association_links.

    METHODS rba_item FOR READ
      IMPORTING keys_rba FOR READ subit\_item FULL result_requested RESULT result LINK association_links.

ENDCLASS.

CLASS lhc_zi_13065_um_subit IMPLEMENTATION.

  METHOD update.
    lcl_buffer=>get_instance( )->update_subit(
        EXPORTING
            entities = entities
        CHANGING
            mapped = mapped
            failed = failed
            reported = reported
    ).
  ENDMETHOD.

  METHOD delete.
    lcl_buffer=>get_instance( )->delete_subit(
        EXPORTING
            keys = keys
        CHANGING
            mapped = mapped
            failed = failed
            reported = reported
    ).
  ENDMETHOD.

  METHOD read.
    lcl_buffer=>get_instance( )->read_subit(
        EXPORTING
            keys = keys
        CHANGING
            result = result
            failed = failed
            reported = reported
    ).
  ENDMETHOD.

  METHOD rba_head.
    lcl_buffer=>get_instance( )->rba_subit_head(
        EXPORTING
            keys_rba = keys_rba
            result_requested = result_requested
        CHANGING
            result = result
            association_links =  association_links
            failed = failed
            reported = reported
    ).
  ENDMETHOD.

  METHOD rba_item.
    lcl_buffer=>get_instance( )->rba_subit_item(
        EXPORTING
            keys_rba = keys_rba
            result_requested = result_requested
        CHANGING
            result = result
            association_links =  association_links
            failed = failed
            reported = reported
    ).
  ENDMETHOD.

ENDCLASS.

CLASS lsc_zi_13065_um_head DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_zi_13065_um_head IMPLEMENTATION.

  METHOD finalize.
  ENDMETHOD.

  METHOD check_before_save.
  ENDMETHOD.

  METHOD save.
    lcl_buffer=>get_instance( )->save(
      CHANGING
          reported = reported
   ).
  ENDMETHOD.

  METHOD cleanup.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.

CLASS lcl_buffer IMPLEMENTATION.
  METHOD get_instance.
    IF go_instance IS NOT BOUND.
      go_instance = NEW #( ).
    ENDIF.
    ro_instance = go_instance.
  ENDMETHOD.

  METHOD cba_item.
    LOOP AT entities_cba ASSIGNING FIELD-SYMBOL(<entitie_cba>).
      LOOP AT <entitie_cba>-%target ASSIGNING FIELD-SYMBOL(<target>).
        APPEND CORRESPONDING zt13065_um_item( <target> MAPPING FROM ENTITY ) TO gt_item_ins.
        APPEND VALUE #( %cid = <target>-%cid
                        %key = <target>-%key ) TO mapped-item.
      ENDLOOP.
    ENDLOOP.
  ENDMETHOD.

  METHOD cba_subit.
    LOOP AT entities_cba ASSIGNING FIELD-SYMBOL(<entitie_cba>).
      LOOP AT <entitie_cba>-%target ASSIGNING FIELD-SYMBOL(<target>).
        APPEND CORRESPONDING zt13065_um_subit( <target> MAPPING FROM ENTITY ) TO gt_subit_ins.
        APPEND VALUE #( %cid = <target>-%cid
                        %key = <target>-%key ) TO mapped-item.
      ENDLOOP.
    ENDLOOP.
  ENDMETHOD.

  METHOD create.
    gt_head_ins = CORRESPONDING #( entities MAPPING FROM ENTITY ).

    LOOP AT entities ASSIGNING FIELD-SYMBOL(<entities>).
      mapped-head = VALUE #( (
        %cid = <entities>-%cid
        %key = <entities>-%key
        %is_draft = <entities>-%is_draft
      ) ).
    ENDLOOP.
  ENDMETHOD.

  METHOD delete.
    gt_head_del = CORRESPONDING #(  keys MAPPING FROM ENTITY ).
  ENDMETHOD.

  METHOD delete_item.
    gt_item_del = CORRESPONDING #(  keys MAPPING FROM ENTITY ).
  ENDMETHOD.

  METHOD delete_subit.
    gt_subit_del = CORRESPONDING #(  keys MAPPING FROM ENTITY ).
  ENDMETHOD.

  METHOD rba_item.
    DATA item LIKE LINE OF result.

    SELECT *
      FROM zt13065_um_item
       FOR ALL ENTRIES IN @keys_rba
     WHERE id = @keys_rba-id
      INTO TABLE @DATA(lt_um_item).

    LOOP AT lt_um_item ASSIGNING FIELD-SYMBOL(<item>).
      INSERT
          VALUE #(
            source-%tky = VALUE #( id = <item>-id )
            target-%tky = VALUE #( id = <item>-id
                                   itemno = <item>-itemno ) )
          INTO TABLE association_links.

      IF result_requested = abap_true.
        item = CORRESPONDING #( <item> MAPPING TO ENTITY ).
        INSERT item INTO TABLE result.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD rba_item_head.
    DATA head LIKE LINE OF result.

    SELECT *
      FROM zt13065_um_head
       FOR ALL ENTRIES IN @keys_rba
     WHERE id = @keys_rba-id
      INTO TABLE @DATA(lt_um_head).

    LOOP AT keys_rba ASSIGNING FIELD-SYMBOL(<keys_rba>).
      READ TABLE lt_um_head INTO DATA(ls_um_head)
        WITH KEY id = <keys_rba>-id.

      INSERT
          VALUE #(
            source-%tky = <keys_rba>-%tky
            target-%tky = VALUE #( id = <keys_rba>-id ) )
          INTO TABLE association_links.

      IF result_requested = abap_true.
        head = CORRESPONDING #( ls_um_head MAPPING TO ENTITY ).
        INSERT head INTO TABLE result.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD rba_item_subit.
    DATA subit LIKE LINE OF result.

    SELECT *
      FROM zt13065_um_subit
       FOR ALL ENTRIES IN @keys_rba
     WHERE id = @keys_rba-id
       AND itemno = @keys_rba-itemno
      INTO TABLE @DATA(lt_um_subit).

    LOOP AT lt_um_subit ASSIGNING FIELD-SYMBOL(<subit>).
      INSERT
          VALUE #(
            source-%tky = VALUE #( id = <subit>-id )
            target-%tky = VALUE #( id = <subit>-id
                                   itemno = <subit>-itemno ) )
          INTO TABLE association_links.

      IF result_requested = abap_true.
        subit = CORRESPONDING #( <subit> MAPPING TO ENTITY ).
        INSERT subit INTO TABLE result.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD rba_subit_head.
    DATA head LIKE LINE OF result.

    SELECT *
      FROM zt13065_um_head
       FOR ALL ENTRIES IN @keys_rba
     WHERE id = @keys_rba-id
      INTO TABLE @DATA(lt_um_head).

    LOOP AT keys_rba ASSIGNING FIELD-SYMBOL(<keys_rba>).
      READ TABLE lt_um_head INTO DATA(ls_um_head)
        WITH KEY id = <keys_rba>-id.

      INSERT
          VALUE #(
            source-%tky = <keys_rba>-%tky
            target-%tky = VALUE #( id = <keys_rba>-id ) )
          INTO TABLE association_links.

      IF result_requested = abap_true.
        head = CORRESPONDING #( ls_um_head MAPPING TO ENTITY ).
        INSERT head INTO TABLE result.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD rba_subit_item.
    DATA item LIKE LINE OF result.

    SELECT *
      FROM zt13065_um_item
       FOR ALL ENTRIES IN @keys_rba
     WHERE id = @keys_rba-id
       AND itemno = @keys_rba-itemno
      INTO TABLE @DATA(lt_um_item).

    LOOP AT keys_rba ASSIGNING FIELD-SYMBOL(<keys_rba>).
      READ TABLE lt_um_item INTO DATA(ls_um_item)
        WITH KEY id = <keys_rba>-id
                 itemno = <keys_rba>-itemno.

      INSERT
          VALUE #(
            source-%tky = <keys_rba>-%tky
            target-%tky = VALUE #( id = <keys_rba>-id
                                   itemno = <keys_rba>-itemno ) )
          INTO TABLE association_links.

      IF result_requested = abap_true.
        item = CORRESPONDING #( ls_um_item MAPPING TO ENTITY ).
        INSERT item INTO TABLE result.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD read.
    SELECT *
      FROM zt13065_um_head
       FOR ALL ENTRIES IN @keys
     WHERE id = @keys-id
      INTO TABLE @DATA(lt_um_head).

    "Mapping selected data to result
    result = CORRESPONDING #( lt_um_head MAPPING TO ENTITY ).
  ENDMETHOD.

  METHOD read_item.
    SELECT *
      FROM zt13065_um_item
       FOR ALL ENTRIES IN @keys
     WHERE id = @keys-id
       AND itemno = @keys-itemno
      INTO TABLE @DATA(lt_um_item).

    "Mapping selected data to result
    result = CORRESPONDING #( lt_um_item MAPPING TO ENTITY ).
  ENDMETHOD.

  METHOD read_subit.
    SELECT *
      FROM zt13065_um_subit
       FOR ALL ENTRIES IN @keys
     WHERE id = @keys-id
       AND itemno = @keys-itemno
       AND subitemno = @keys-subitemno
      INTO TABLE @DATA(lt_um_subit).

    "Mapping selected data to result
    result = CORRESPONDING #( lt_um_subit MAPPING TO ENTITY ).
  ENDMETHOD.

  METHOD update.
    gt_head_upd = VALUE #( FOR entitie IN entities (
        id = entitie-id
        ind-id = entitie-%control-id

        text = entitie-text
        ind-text = entitie-%control-text

        local_last_changed_at = entitie-locallastchangedat
        ind-local_last_changed_at = entitie-%control-locallastchangedat
     ) ).
  ENDMETHOD.

  METHOD update_item.
    gt_item_upd = VALUE #( FOR entitie IN entities (
        id = entitie-id
        ind-id = entitie-%control-id

        itemno = entitie-itemno
        ind-itemno = entitie-%control-itemno

        description = entitie-description
        ind-description = entitie-%control-description

        note = entitie-note
        ind-note = entitie-%control-note

        local_last_changed_at = entitie-locallastchangedat
        ind-local_last_changed_at = entitie-%control-locallastchangedat
     ) ).
  ENDMETHOD.

  METHOD update_subit.
    gt_subit_upd = VALUE #( FOR entitie IN entities (
        id = entitie-id
        ind-id = entitie-%control-id

        itemno = entitie-itemno
        ind-itemno = entitie-%control-itemno

        subitemno = entitie-subitemno
        ind-subitemno = entitie-%control-subitemno

        note = entitie-note
        ind-note = entitie-%control-note

        cdate = entitie-cdate
        ind-cdate = entitie-%control-cdate

        local_last_changed_at = entitie-locallastchangedat
        ind-local_last_changed_at = entitie-%control-locallastchangedat
     ) ).
  ENDMETHOD.

  METHOD save.
    "Head
    IF gt_head_ins IS NOT INITIAL.
      INSERT zt13065_um_head FROM TABLE @gt_head_ins ACCEPTING DUPLICATE KEYS.
    ENDIF.

    IF gt_head_upd IS NOT INITIAL.
      UPDATE zt13065_um_head FROM TABLE @gt_head_upd INDICATORS SET STRUCTURE ind.
    ENDIF.

    IF gt_head_del IS NOT INITIAL.
      DELETE zt13065_um_head FROM TABLE @gt_head_del.
    ENDIF.

    "Item
    IF gt_item_ins IS NOT INITIAL.
      INSERT zt13065_um_item FROM TABLE @gt_item_ins ACCEPTING DUPLICATE KEYS.
    ENDIF.

    IF gt_item_upd IS NOT INITIAL.
      UPDATE zt13065_um_item FROM TABLE @gt_item_upd INDICATORS SET STRUCTURE ind.
    ENDIF.

    IF gt_item_del IS NOT INITIAL.
      DELETE zt13065_um_item FROM TABLE @gt_item_del.
    ENDIF.

    "Sub Item
    IF gt_subit_ins IS NOT INITIAL.
      INSERT zt13065_um_subit FROM TABLE @gt_subit_ins ACCEPTING DUPLICATE KEYS.
    ENDIF.

    IF gt_subit_upd IS NOT INITIAL.
      UPDATE zt13065_um_subit FROM TABLE @gt_subit_upd INDICATORS SET STRUCTURE ind.
    ENDIF.

    IF gt_subit_del IS NOT INITIAL.
      DELETE zt13065_um_subit FROM TABLE @gt_subit_del.
    ENDIF.
  ENDMETHOD.

ENDCLASS.
