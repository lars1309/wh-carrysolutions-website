# W+H CarrySolutions & Services — Website

Statische Website für die Spedition W+H CarrySolutions & Services, Wilhelm-Binder-Straße 19, 78048 VS-Villingen.

Kein Build, kein Framework, keine Abhängigkeiten — reines HTML und CSS.

## Dateien

| Datei | Inhalt |
|---|---|
| `index.html` | Startseite |
| `impressum.html` | Impressum |
| `datenschutz.html` | Datenschutzerklärung (Entwurf, siehe unten) |
| `style.css` | Gesamtes Design |
| `vercel.json` | Saubere URLs (`/impressum` statt `/impressum.html`) und Sicherheits-Header |
| `images/` | Bilder — aktuell noch leer |

## Lokal ansehen

Doppelklick auf `index.html` genügt. Oder mit einem kleinen Server:

```bash
python3 -m http.server 8000
# dann http://localhost:8000 im Browser öffnen
```

## Auf Vercel veröffentlichen

1. Auf [vercel.com](https://vercel.com) anmelden (kostenloser Hobby-Plan reicht).
2. **Add New → Project** → dieses GitHub-Repository auswählen → **Import**.
3. Bei *Framework Preset* **Other** stehen lassen, Build Command und Output Directory leer lassen.
4. **Deploy**.

Danach veröffentlicht jeder `git push` auf `main` automatisch die neue Fassung.

Eigene Domain: im Vercel-Projekt unter **Settings → Domains** `wh-carrysolutions-services.de`
eintragen und die dort angezeigten DNS-Einträge beim Domain-Anbieter hinterlegen.

## Hero-Bild einsetzen

Der große Bildbereich oben ist vorbereitet. Sobald ein Foto vorliegt:

1. Datei als `images/hero.jpg` ablegen (Querformat, etwa 2400 px breit, unter 400 KB).
2. In `style.css` im Block `.hero{ … }` diese Zeile ergänzen:

```css
--hero-photo: url("images/hero.jpg") center/cover no-repeat;
```

Die dunklen Verläufe darüber bleiben erhalten, damit die weiße Schrift lesbar bleibt.

## Offene Punkte

- **Fotos fehlen komplett** — Lkw, Ladung, Hebebühne im Einsatz, ein Bild der beiden Ansprechpartner.
- **Logo** liegt noch nicht als Datei vor; aktuell steht im Kopf ein gesetzter Schriftzug mit Bildmarke.
- **Firmierung bestätigen** — die Seite nennt durchgehend „W+H CarrySolutions & Services" ohne Rechtsformzusatz, passend zum Impressum.
- **Fahrgebiet** — nur Deutschland oder auch grenzüberschreitend? Steht derzeit nicht auf der Seite.
- **Datenschutzerklärung** ist ein Entwurf und sollte vor dem Livegang rechtlich geprüft werden. Die gelb markierten Stellen sind die offenen Punkte.
- **Google Fonts** werden von Googles Servern geladen. Wer das vermeiden will, lädt die beiden Schriften (Saira Condensed, Barlow) herunter und bindet sie lokal ein — dann entfällt der entsprechende Absatz im Datenschutz.

## Kontakt

Erstellt von Rüb Studio, Marcus Rüb.
