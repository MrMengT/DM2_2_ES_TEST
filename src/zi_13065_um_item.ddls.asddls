@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface view for unmanaged item'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity zi_13065_um_item
  as select from zt13065_um_item
  association to parent zi_13065_um_head  as _head on $projection.Id = _head.Id
  composition [0..*] of zi_13065_um_subit as _subit
{
  key id                    as Id,
  key itemno                as Itemno,
      description           as Description,
      note                  as Note,
      local_last_changed_at as LocalLastChangedAt,

      _head,
      _subit
}
