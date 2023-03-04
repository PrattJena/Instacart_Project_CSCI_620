create table "bigDataProject".aisles
(
    aisle_id integer not null
        constraint aisles_df_pk
            primary key,
    aisle    varchar
);

alter table "bigDataProject".aisles
    owner to postgres;

create table "bigDataProject".departments
(
    department_id integer not null
        constraint departments_df_pk
            primary key,
    department    text
);

alter table "bigDataProject".departments
    owner to postgres;

create table "bigDataProject".order_products
(
    order_id          integer not null
        constraint order_products_orders_order_id_fk
            references "bigDataProject".orders,
    product_id        integer not null
        constraint order_products_products_product_id_fk
            references "bigDataProject".products,
    add_to_cart_order integer,
    reordered         integer,
    constraint order_products_pk
        primary key (order_id, product_id)
);

alter table "bigDataProject".order_products
    owner to postgres;

create table "bigDataProject".orders
(
    order_id               integer not null
        constraint orders_dff_pk
            primary key,
    user_id                integer,
    eval_set               text,
    order_number           integer,
    order_dow              integer,
    order_hour_of_day      integer,
    days_since_prior_order integer
);

alter table "bigDataProject".orders
    owner to postgres;

create table "bigDataProject".products
(
    product_id    integer not null
        constraint products_pk
            primary key,
    product_name  text,
    aisle_id      integer
        constraint products_aisles_aisle_id_fk
            references "bigDataProject".aisles,
    department_id integer
        constraint products_departments_department_id_fk
            references "bigDataProject".departments
);

alter table "bigDataProject".products
    owner to postgres;





