# Hostel Grievances (Next.js + MySQL)

## Setup
1) Create MySQL and run `schema.sql`.
2) Copy `.env.example` to `.env.local` and fill DB creds + JWT_SECRET.
3) `npm install`
4) `npm run dev` (http://localhost:3000)

## Deploy (Vercel)
- Push repo to GitHub -> Import to Vercel (Next.js).
- Add env vars: DB_HOST, DB_USER, DB_PASS, DB_NAME, JWT_SECRET, NEXT_PUBLIC_BASE_URL.
- Deploy.

## Default Admin
- username: `admin`
- password: `Admin@123` (change in DB)