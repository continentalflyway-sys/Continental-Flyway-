# CONTINENTAL FLYWAY — Version 3.1 FINAL

A mobile-first Travel • Career • Opportunity website with a Supabase-ready Admin Panel.

## Files
- `index.html` — public website
- `admin.html` — protected admin dashboard
- `config.js` — Supabase project URL + public anon key
- `supabase_schema.sql` — database tables and Row Level Security
- `README_SETUP.md` — deployment instructions

## 1) GitHub Pages
1. Create/open your GitHub repository.
2. Upload the files from this folder to the repository root.
3. Make sure `index.html` is in the root.
4. GitHub → Settings → Pages → Deploy from branch → `main` → `/ (root)`.
5. Save and wait for deployment.

## 2) Supabase
1. Create a Supabase project.
2. Open SQL Editor and run `supabase_schema.sql`.
3. Create an Admin user under Authentication → Users.
4. Copy that user's UUID.
5. Run:
   insert into public.admins (id,name,role)
   values ('YOUR-UUID','MD Easin Arafat','admin');
6. Open Project Settings → API and copy the Project URL and anon/public key.
7. Put them in `config.js`:
   SUPABASE_URL: "https://....supabase.co"
   SUPABASE_ANON_KEY: "ey...."

## 3) Admin
Open `/admin.html` on the deployed site and sign in with the Supabase Admin user.
Do NOT put a service_role key in GitHub or any browser code.

## 4) Production checklist
- Replace sample job listings with verified, current vacancies.
- Add your official business registration/licence information where applicable.
- Add office address, official Facebook URL and branding assets.
- Connect the public inquiry form to Supabase if desired.
- Add CV upload storage only after setting a secure Supabase Storage policy.
- Verify all visa, employer, salary and recruitment claims before publishing.
- Add Privacy Policy, Terms, Refund/Payment Policy and recruitment disclaimer before accepting online payments.

## Brand
CONTINENTAL FLYWAY
Travel • Career • Opportunity

Leadership shown in this build:
- MD Easin Arafat — Founder
- Shahanul Islam — Co-Founder
- Bahalul Islam — Chief Executive Officer

Contact:
+8801998888321
+8801677055600
WhatsApp: +8801922422644
continentalflyway@gmail.com
