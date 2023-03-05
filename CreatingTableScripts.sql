create database instacart

create table "instacart".aisles
(
    aisle_id integer not null
        constraint aisles_df_pk
            primary key,
    aisle    varchar
);

alter table "instacart".aisles
    owner to postgres;

create table "instacart".departments
(
    department_id integer not null
        constraint departments_df_pk
            primary key,
    department    text
);

alter table "instacart".departments
    owner to postgres;

create table "instacart".users
(
    user_id integer not null
        constraint departments_df_pk
            primary key,
    user_name              text,
    user_address           text,
    city                   text,
    state                  char(2),
    pincode                integer,
    user_email             text
);

alter table "instacart".users
    owner to postgres;

create table "instacart".orders
(
    order_id               integer not null
        constraint orders_dff_pk
            primary key,
    user_id                integer
        constraint orders_users_user_id_fk
                references "instacart".users,
    order_number           integer,
    order_dow              integer,
    order_hour_of_day      integer,
    days_since_prior_order integer
);

alter table "instacart".orders
    owner to postgres;

create table "instacart".products
(
    product_id    integer not null
        constraint products_pk
            primary key,
    product_name  text,
    aisle_id      integer
        constraint products_aisles_aisle_id_fk
            references "instacart".aisles,
    department_id integer
        constraint products_departments_department_id_fk
            references "instacart".departments
);

alter table "instacart".products
    owner to postgres;

create table "instacart".order_products
(
    order_id          integer not null
        constraint order_products_orders_order_id_fk
            references "instacart".orders,
    product_id        integer not null
        constraint order_products_products_product_id_fk
            references "instacart".products,
    add_to_cart_order integer,
    reordered         integer,
    constraint order_products_pk
        primary key (order_id, product_id)
);

alter table "instacart".order_products
    owner to postgres;





