# Continental Flyway V3.1 Full-Stack

## Files
- `index.html` — public website
- `admin.html` — admin dashboard
- `app.js` — Supabase-powered public site
- `admin.js` — admin operations
- `config.js` — Supabase URL + publishable key
- `style.css` — responsive design
- `supabase_admin_policies.sql` — admin RLS policies

## Deploy
Upload all files to GitHub/hosting. Keep the filenames together in the same folder.

## Supabase
The site uses the Supabase project URL and publishable key in `config.js`. Never put a Supabase service-role key in frontend files.

## Admin
Sign in with the admin account you created in Supabase Auth. The account must have `profiles.role = 'admin'`. Open `/admin.html` after login.

## Important
If admin policies were not already run, run `supabase_admin_policies.sql` in Supabase SQL Editor. If you already created policies with the same names, do not run the file unchanged; check existing policies first.
