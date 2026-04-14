-- הרץ את זה ב-Supabase SQL Editor

create table if not exists transactions (
  id text primary key,
  title text,
  amount numeric,
  type text,
  category text,
  date text,
  is_recurring boolean default false,
  frequency text,
  end_date text,
  installments jsonb,
  created_at timestamptz default now()
);

create table if not exists loans (
  id text primary key,
  purpose text,
  is_leverage boolean default false,
  disbursement_date text,
  final_repayment_date text,
  interest_rate numeric default 0,
  indexation_type text default 'NONE',
  principal_amount numeric,
  created_at timestamptz default now()
);

create table if not exists buckets (
  id text primary key,
  name text,
  icon text,
  current_amount numeric default 0,
  target_amount numeric default 0,
  fund_name text,
  fund_number text,
  deposit_date text,
  bucket_txs jsonb default '[]',
  created_at timestamptz default now()
);

-- עמודות חדשות לטבלה קיימת
alter table buckets add column if not exists fund_name text;
alter table buckets add column if not exists fund_number text;
alter table buckets add column if not exists deposit_date text;
alter table buckets add column if not exists bucket_txs jsonb default '[]';

create table if not exists config (
  id integer primary key default 1,
  bank_balance numeric default 0,
  profit_rate numeric default 10,
  pin_code text default '',
  currency text default 'ILS',
  categories jsonb default '["מזון","פנאי","מגורים","תחבורה","בריאות","חינוך","משכורת","עסקים","חיסכון","אחר"]'::jsonb
);

-- שורת config ברירת מחדל
insert into config (id) values (1) on conflict (id) do nothing;

-- ביטול RLS (אפליקציה עם משתמש יחיד)
alter table transactions disable row level security;
alter table loans disable row level security;
alter table buckets disable row level security;
alter table config disable row level security;
