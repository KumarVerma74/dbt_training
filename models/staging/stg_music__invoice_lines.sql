select
    InvoiceLineId as invoice_lineid,
    InvoiceId as invoice_id,
    TrackId as track_id,
    UnitPrice as invoice_lineitem_revenue_usd,
    Quantity as Quantity

from {{ source('music', 'invoiceline') }}
