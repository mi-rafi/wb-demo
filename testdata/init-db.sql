CREATE TABLE IF NOT EXISTS order (
  order_uid TEXT PRIMARY KEY,
  track_number TEXT NOT NULL,
  entry_order TEXT,
  locale TEXT NOT NULL,
  internal_signature TEXT,
  customer_id TEXT NOT NULL,
  delivery_service TEXT NOT NULL,
  shardkey TEXT NOT NULL, 
  sm_id INTEGER NOT NULL,
  date_created TIMESTAMP NOT NULL,
  oof_shard TEXT
);

CREATE TABLE delivery (
  name_del TEXT,
  phone TEXT ,
  zip TEXT,
  city TEXT,
  address_del TEXT,
  region TEXT,
  email TEXT,
  PRIMARY KEY (id),
  FOREIGN KEY (generic_id) REFERENCES generic(sm_id)
);

CREATE TABLE generic_payment (
  generic_sm_id INTEGER,
  transaction TEXT,
  request_id TEXT,
  currency TEXT,
  provider TEXT,
  amount INTEGER,
  payment_dt INTEGER,
  bank TEXT,
  delivery_cost INTEGER,
  goods_total INTEGER,
  custom_fee INTEGER,
  PRIMARY KEY (request_id),
  FOREIGN KEY (generic_id) REFERENCES generic(sm_id)
);

CREATE TABLE generic_items (
  generic_sm_id INTEGER,
  chrt_id INTEGER,
  track_number TEXT,
  price INTEGER,
  rid TEXT,
  name TEXT,
  sale INTEGER,
  size TEXT,
  total_price INTEGER,
  nm_id INTEGER,
  brand TEXT,
  status INTEGER,
  PRIMARY KEY (nm_id),
  FOREIGN KEY (generic_id) REFERENCES generic(sm_id)
);