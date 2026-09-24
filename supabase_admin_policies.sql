-- Run this only if admin RLS policies have not already been created.
create or replace function public.is_admin() returns boolean language sql security definer set search_path = public as $$
  select exists(select 1 from public.profiles where id=auth.uid() and role='admin');
$$;

alter table public.profiles enable row level security;

create policy "Admins can read all profiles" on public.profiles for select using (public.is_admin() or id=auth.uid());
create policy "Admins can update all profiles" on public.profiles for update using (public.is_admin() or id=auth.uid()) with check (public.is_admin() or id=auth.uid());

create policy "Admins can manage jobs" on public.job_vacancies for all using (public.is_admin()) with check (public.is_admin());
create policy "Admins can read ticket requests" on public.ticket_requests for select using (public.is_admin());
create policy "Admins can update ticket requests" on public.ticket_requests for update using (public.is_admin()) with check (public.is_admin());
create policy "Admins can read hotel requests" on public.hotel_requests for select using (public.is_admin());
create policy "Admins can update hotel requests" on public.hotel_requests for update using (public.is_admin()) with check (public.is_admin());
create policy "Admins can read visa requests" on public.visa_requests for select using (public.is_admin());
create policy "Admins can update visa requests" on public.visa_requests for update using (public.is_admin()) with check (public.is_admin());
create policy "Admins can read tour requests" on public.tour_requests for select using (public.is_admin());
create policy "Admins can update tour requests" on public.tour_requests for update using (public.is_admin()) with check (public.is_admin());
create policy "Admins can read umrah requests" on public.umrah_requests for select using (public.is_admin());
create policy "Admins can update umrah requests" on public.umrah_requests for update using (public.is_admin()) with check (public.is_admin());
create policy "Admins can read job interest requests" on public.job_interest_requests for select using (public.is_admin());
create policy "Admins can update job interest requests" on public.job_interest_requests for update using (public.is_admin()) with check (public.is_admin());
create policy "Admins can read contact messages" on public.contact_messages for select using (public.is_admin());
create policy "Admins can update contact messages" on public.contact_messages for update using (public.is_admin()) with check (public.is_admin());
