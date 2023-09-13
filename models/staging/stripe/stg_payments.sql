select  id as payment_id,
        orderid as order_id,
        paymentmethod as payment_method,
        status,
        -- amount is stored in cents, convert it to dollars
        case when status = 'fail' then 0
             when status = 'success' then amount / 100
        end as amount,
        created as created_at
from {{ source('stripe','payment') }}