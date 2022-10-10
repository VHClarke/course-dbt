# Week One Project

### How many users do we have?
#### Answer: 130
```
select count (distinct USER_ID) from stg_users
```
#### Answer:  15 orders per hour
### On average, how many orders do we receive per hour?

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
#### Answer:
```
placeholder

```

### How many users have only made one purchase? Two purchases? Three+ purchases?
#### Answer:
```
placeholder

```

### On average, how many unique sessions do we have per hour?
#### Answer:
```
placeholder

```