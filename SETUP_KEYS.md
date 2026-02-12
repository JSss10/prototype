# API-Keys für das Projekt

Diese Datei enthält alle API-Keys, die für das Projekt benötigt werden. Trage die Werte in die entsprechenden Konfigurationsdateien ein, wie in den READMEs beschrieben.

## Supabase

| Key | Wert |
|-----|------|
| **Project URL** | `https://rwtfdiooyqrqphleqalb.supabase.co` |
| **Anon Key** | `eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ3dGZkaW9veXFycXBobGVxYWxiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njg2NDgyMzIsImV4cCI6MjA4NDIyNDIzMn0.8TnioyYKs9UFcJe4x3R1upwQy--WHXU4-fry4osGTGk` |
| **Service Role Key** | `eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ3dGZkaW9veXFycXBobGVxYWxiIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc2ODY0ODIzMiwiZXhwIjoyMDg0MjI0MjMyfQ.9dlxGYV2ch7pRYO56Gh71uAjThK5eNoY8xsGCuGtteY` |

## OpenWeatherMap

| Key | Wert |
|-----|------|
| **API Key** | `d30db5ee6cdde5e520f400b20049b807` |

---

## Wo die Keys eingetragen werden müssen

### iOS App (`ios/ARLandmarks/ARLandmarks/Secrets.xcconfig`)

Kopiere `Secrets.example.xcconfig` zu `Secrets.xcconfig` und trage ein:

```
SUPABASE_URL = https:/$()/rwtfdiooyqrqphleqalb.supabase.co
SUPABASE_ANON_KEY = eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ3dGZkaW9veXFycXBobGVxYWxiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njg2NDgyMzIsImV4cCI6MjA4NDIyNDIzMn0.8TnioyYKs9UFcJe4x3R1upwQy--WHXU4-fry4osGTGk
OPENWEATHER_API_KEY = d30db5ee6cdde5e520f400b20049b807
```

### Dashboard (`dashboard/.env.local`)

Kopiere `.env.example` zu `.env.local` und trage ein:

```
NEXT_PUBLIC_SUPABASE_URL=https://rwtfdiooyqrqphleqalb.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ3dGZkaW9veXFycXBobGVxYWxiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njg2NDgyMzIsImV4cCI6MjA4NDIyNDIzMn0.8TnioyYKs9UFcJe4x3R1upwQy--WHXU4-fry4osGTGk
SUPABASE_SERVICE_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ3dGZkaW9veXFycXBobGVxYWxiIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc2ODY0ODIzMiwiZXhwIjoyMDg0MjI0MjMyfQ.9dlxGYV2ch7pRYO56Gh71uAjThK5eNoY8xsGCuGtteY
```

### Scripts (`scripts/.env`)

Kopiere `.env.example` zu `.env` und trage ein:

```
SUPABASE_URL=https://rwtfdiooyqrqphleqalb.supabase.co
SUPABASE_SERVICE_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ3dGZkaW9veXFycXBobGVxYWxiIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc2ODY0ODIzMiwiZXhwIjoyMDg0MjI0MjMyfQ.9dlxGYV2ch7pRYO56Gh71uAjThK5eNoY8xsGCuGtteY
```

### ML Training (`ml_training/.env`)

Kopiere `.env.example` zu `.env` und trage ein:

```
SUPABASE_URL=https://rwtfdiooyqrqphleqalb.supabase.co
SUPABASE_ANON_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ3dGZkaW9veXFycXBobGVxYWxiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njg2NDgyMzIsImV4cCI6MjA4NDIyNDIzMn0.8TnioyYKs9UFcJe4x3R1upwQy--WHXU4-fry4osGTGk
```
