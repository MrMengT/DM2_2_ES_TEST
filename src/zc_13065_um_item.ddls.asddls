@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption view for unmanaged item'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity zc_13065_um_item
  as projection on zi_13065_um_item
{
  key Id,
  key Itemno,
      Description,
      Note,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      LocalLastChangedAt,
      /* Associations */
      _head  : redirected to parent zc_13065_um_head,
      _subit : redirected to composition child zc_13065_um_subit
}
