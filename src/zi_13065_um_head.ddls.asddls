@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface view for unmanaged header'
@Metadata.ignorePropagatedAnnotations: true
define root view entity zi_13065_um_head
  as select from zt13065_um_head
  composition [0..*] of zi_13065_um_item as _item
{

  key id                    as Id,
      text                  as Text,
      local_last_changed_at as LocalLastChangedAt,

      _item
}
