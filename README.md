# Barcode → Excel

Scan barcodes on your phone; each scan is saved to Supabase; download an
up-to-date `.xlsx` anytime.

## 1. Set up Supabase

1. Go to your Supabase project → **SQL Editor** → New query.
2. Paste the contents of `supabase_setup.sql` and run it. This creates a
   `scans` table with open read/insert/delete access (fine for a personal
   single-user tool).
3. Go to **Project Settings → API** and copy:
   - **Project URL**
   - **anon public** key

## 2. Configure the app

Edit `config.js` and paste in your values:

```js
const SUPABASE_URL = "https://YOUR-PROJECT-REF.supabase.co";
const SUPABASE_ANON_KEY = "YOUR-ANON-PUBLIC-KEY";
```

## 3. Deploy to GitHub Pages

```bash
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/YOUR-USERNAME/YOUR-REPO.git
git push -u origin main
```

Then in the GitHub repo: **Settings → Pages → Source → Deploy from branch →
main / (root)**. Save. Your app will be live at:

```
https://YOUR-USERNAME.github.io/YOUR-REPO/
```

This is served over HTTPS, so camera access will work correctly on Android
Chrome (unlike opening the file locally).

## 4. Use it

- Open the GitHub Pages URL on your phone, allow camera access.
- Scan barcodes — each one is saved to Supabase instantly.
- Tap **Download .xlsx** anytime to get the current list as an Excel file.
- Tap **✕** next to an entry to delete it.
- **Refresh list** re-pulls from Supabase (useful if scanning from more than
  one device — the list also updates live automatically).

## Notes

- `config.js` contains your Supabase anon key, which is meant to be public
  (it's restricted by the Row Level Security policies you set up). Don't put
  your Supabase **service role** key here.
- If you ever want to lock this down to just you, swap the open RLS policies
  for ones that check `auth.uid()` and add Supabase Auth login to the app.
