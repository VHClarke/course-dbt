# Week One Project

### How many users do we have?
#### Answer: 130
```
select count (distinct USER_ID) from stg_users
```

### On average, how many orders do we receive per hour?
#### Answer:  15 orders per hour
```
with orders_per_hour as (
     select
        hour(ORDER_CREATED_AT) as created_hour,
        count(order_guid) as orders
     from stg_orders
     group by 1
  )

  select avg(orders) from orders_per_hour;

```

### On average, how long does an order take from being placed to being delivered?
#### Answer: Approximately 93.4 hours
```
select avg(timediff(hour, ORDER_CREATED_AT, ORDER_DELIVERED_AT)) from stg_orders;

```

### How many users have only made one purchase? Two purchases? Three+ purchases?
#### Answer: One purchases = 25 | Two purchases = 28 | Three+ purchases = 71
```

  with number_orders_per_user as (
     select
        user_guid,
        count(order_guid) as orders
     from stg_orders
     group by 1
  )

  select
     case
        when orders < 3 then orders::varchar
        else '3+'
     end as number_orders,
     count(user_guid) as users
  from number_orders_per_user
  group by 1
  order by 1
  ;
```

### On average, how many unique sessions do we have per hour?
#### Answer: 39.5 unique sessions
```
placeholder  with unique_sessions_per_hour as (
     select
     hour(CREATED_AT) as created_hour,
     count(distinct SESSION_GUID) as unique_sessions
     from stg_events
     group by 1
  )

  select avg(unique_sessions) from unique_sessions_per_hour;
```