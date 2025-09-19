@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption view for unmanaged sub item'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity zc_13065_um_subit
  as projection on zi_13065_um_subit
{
  key Id,
  key Itemno,
  key Subitemno,
      Cdate,
      Note,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      LocalLastChangedAt,
      /* Associations */
      _head : redirected to zc_13065_um_head,
      _item : redirected to parent zc_13065_um_item
}
