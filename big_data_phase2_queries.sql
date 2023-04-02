SELECT pd.product_name, COUNT(*) as frequency
FROM "bigDataProject".products as pd,"bigDataProject".order_products as op
where op.product_id = pd.product_id
GROUP BY pd.product_id
ORDER BY frequency DESC
LIMIT 15;

select cd.user_name,count(*) as frequency
from "bigDataProject".client_data as cd,"bigDataProject".order_products as op,"bigDataProject".products as pd,"bigDataProject".orders as ord
where op.product_id=pd.product_id and
    ord.order_id=op.order_id and
    ord.user_id=cd.user_id
group by cd.user_name
ORDER BY frequency DESC
LIMIT 5;

SELECT pd.aisle_id
FROM "bigDataProject".aisles AS ai, "bigDataProject".products AS pd
where ai.aisle_id=pd.aisle_id
GROUP BY pd.aisle_id
HAVING COUNT(*) = (
  SELECT MAX(frequency)
  FROM (
     select pd.aisle_id,count(*) as frequency
    from "bigDataProject".aisles as ai,"bigDataProject".products as pd
    where ai.aisle_id=pd.aisle_id
    group by pd.aisle_id
  ) AS freq_table
);

select distinct cd.user_name,cd.user_email
from "bigDataProject".client_data as cd,"bigDataProject".order_products as op,"bigDataProject".orders as od
where cd.user_name like 'Sh%' and
      od.user_id=cd.user_id and
      op.product_id=4;

select pd.product_name
from "bigDataProject".products as pd,"bigDataProject".departments as d
where d.department like 'snacks'
and pd.department_id=d.department_id


















