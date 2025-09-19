@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption view for unmanaged head'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity zc_13065_um_head
  provider contract transactional_query
  as projection on zi_13065_um_head
{
  key Id,
      Text,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      LocalLastChangedAt,
      /* Associations */
      _item : redirected to composition child zc_13065_um_item
}
