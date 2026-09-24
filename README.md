# Continental Flyway Website V3.1

Frontend-only website for Continental Flyway Tour & Travel, designed to connect to the existing Supabase backend/admin panel.

## Included
- Responsive home, services, destinations, jobs, leadership, about and contact sections
- 7-continent interactive country explorer
- Leadership photos supplied by the owner
- Live job vacancy reading from Supabase `job_vacancies`
- Ticket, hotel, visa, tour and Umrah request forms mapped to the existing Supabase tables
- No ticket/hotel API; requests are manual and follow Request → Verify → Confirm

## Supabase setup
Edit `js/config.js` and replace:
`PASTE_YOUR_SUPABASE_PUBLISHABLE_KEY_HERE`
with your Supabase publishable/anon key.

Never put a service-role key in this frontend or in GitHub.

Project URL is already set to:
`https://thgahbuwnirlnlzcvdyx.supabase.co`

## GitHub Pages
1. Upload all files to your repository.
2. Open Settings → Pages.
3. Select the branch/folder containing `index.html`.
4. Save and open the generated Pages URL.

If your GitHub repository is already connected to another deployment, keep the same deployment method and replace the site files.
