@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface view for unmanaged sub item'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity zi_13065_um_subit
  as select from zt13065_um_subit
  association to parent zi_13065_um_item as _item on  $projection.Id     = _item.Id
                                                  and $projection.Itemno = _item.Itemno
  association to zi_13065_um_head        as _head on  $projection.Id = _head.Id
{
  key id                    as Id,
  key itemno                as Itemno,
  key subitemno             as Subitemno,
      cdate                 as Cdate,
      note                  as Note,
      local_last_changed_at as LocalLastChangedAt,

      _item,
      _head
}
