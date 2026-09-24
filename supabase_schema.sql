-- CONTINENTAL FLYWAY v3.1 — Supabase schema
-- Run in Supabase SQL Editor. Never place the service_role key in website files.

create extension if not exists pgcrypto;

create table if not exists public.admins (
  id uuid primary key references auth.users(id) on delete cascade,
  name text,
  role text default 'admin',
  created_at timestamptz not null default now()
);

create table if not exists public.jobs (
  id uuid primary key default gen_random_uuid(),
  title text not null,
  country text not null,
  category text,
  employment_type text,
  location text,
  salary text,
  description text,
  is_active boolean not null default true,
  created_at timestamptz not null default now()
);

create table if not exists public.inquiries (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  phone text not null,
  email text,
  type text,
  subject text,
  message text not null,
  status text not null default 'new',
  created_at timestamptz not null default now()
);

create table if not exists public.applications (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  phone text not null,
  email text,
  job_id uuid references public.jobs(id) on delete set null,
  job_title text,
  country text,
  message text,
  cv_url text,
  status text not null default 'new',
  created_at timestamptz not null default now()
);

alter table public.admins enable row level security;
alter table public.jobs enable row level security;
alter table public.inquiries enable row level security;
alter table public.applications enable row level security;

-- Public can read active jobs.
drop policy if exists "public read active jobs" on public.jobs;
create policy "public read active jobs" on public.jobs
for select to anon, authenticated using (is_active = true);

-- Admin helper.
create or replace function public.is_admin()
returns boolean
language sql
stable
security definer
set search_path = public
as $$
  select exists (select 1 from public.admins a where a.id = auth.uid());
$$;

-- Admins can read/write protected tables.
drop policy if exists "admins read admins" on public.admins;
create policy "admins read admins" on public.admins for select to authenticated using (id = auth.uid() or public.is_admin());

drop policy if exists "admins manage jobs" on public.jobs;
create policy "admins manage jobs" on public.jobs for all to authenticated using (public.is_admin()) with check (public.is_admin());

drop policy if exists "admins read inquiries" on public.inquiries;
create policy "admins read inquiries" on public.inquiries for select to authenticated using (public.is_admin());
drop policy if exists "admins update inquiries" on public.inquiries;
create policy "admins update inquiries" on public.inquiries for update to authenticated using (public.is_admin()) with check (public.is_admin());

drop policy if exists "admins read applications" on public.applications;
create policy "admins read applications" on public.applications for select to authenticated using (public.is_admin());
drop policy if exists "admins update applications" on public.applications;
create policy "admins update applications" on public.applications for update to authenticated using (public.is_admin()) with check (public.is_admin());

-- Public inquiry submission.
drop policy if exists "public create inquiries" on public.inquiries;
create policy "public create inquiries" on public.inquiries for insert to anon, authenticated with check (true);

-- Public application submission.
drop policy if exists "public create applications" on public.applications;
create policy "public create applications" on public.applications for insert to anon, authenticated with check (true);

-- IMPORTANT:
-- After creating an Admin user in Supabase Authentication, insert that user's UUID:
-- insert into public.admins (id,name,role) values ('YOUR-AUTH-USER-UUID','MD Easin Arafat','admin');
