-- Run this in Supabase: SQL Editor → New query

create table if not exists scans (
  id bigint generated always as identity primary key,
  code text not null,
  created_at timestamptz not null default now()
);

-- Enable Row Level Security
alter table scans enable row level security;

-- Allow anyone with the anon key to read/insert/delete.
-- This is fine for a personal single-user tool; tighten later if needed.
create policy "Allow anon read" on scans
  for select using (true);

create policy "Allow anon insert" on scans
  for insert with check (true);

create policy "Allow anon delete" on scans
  for delete using (true);
