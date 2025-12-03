#!/bin/bash

# Setup-Script für Sed-Schulungsübungen mit Ordnerstruktur
TRAINING_DIR="sed_aufgaben"
echo "Erstelle Sed-Training-Umgebung im Verzeichnis: $TRAINING_DIR"

# Altes Verzeichnis löschen, falls vorhanden
rm -rf "$TRAINING_DIR"
mkdir -p "$TRAINING_DIR"
cd "$TRAINING_DIR"

# === AUFGABE 1: Basis-Ersetzung ===
mkdir -p aufgabe1
cat > aufgabe1/to-be-replaced.txt <<'EOF'
Lorem ipsum dolor sit amet, consetetur sadipscing elitr, 
sed diam nonumy eirmod tempor invidunt ut labore et dolore 
magna aliquyam erat, sed diam voluptua. At vero eos et 
accusam et justo duo dolores et ea rebum. Stet clita kasd 
gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.
EOF

cat > aufgabe1/README.md <<'EOF'
# Aufgabe 1: Basis-Ersetzung

**Datei:** `to-be-replaced.txt`

**Aufgabe:** Ersetzen Sie das Wort "Lorem" durch Ihren Vor- und Nachnamen. Zeigen Sie das Ergebnis auf der Konsole.

**Tipp:** Verwenden Sie den sed-Befehl mit 's/.../.../g'

**Zu prüfen:** Welcher Unterschied ergibt sich, wenn Sie das 'g' am Ende weglassen?
EOF

# === AUFGABE 2: In-place Editing mit Backup ===
mkdir -p aufgabe2
cat > aufgabe2/config.txt <<'EOF'
Lorem ipsum dolor sit amet, consetetur sadipscing elitr, 
sed diam nonumy eirmod tempor invidunt ut labore et dolore 
magna aliquyam erat, sed diam voluptua.
EOF

cat > aufgabe2/README.md <<'EOF'
# Aufgabe 2: In-place Editing mit Backup

**Datei:** `config.txt`

**Aufgabe:** Ersetzen Sie "ipsum" durch "BERLIN" direkt in der Datei.
**WICHTIG:** Erstellen Sie automatisch ein Backup mit der Endung `.bak`

**Tipp:** Verwenden Sie die `-i` Option von sed

**Test:** Prüfen Sie nachher sowohl `config.txt` als auch `config.txt.bak`
EOF

# === AUFGABE 3: Mehrere Ersetzungen ===
mkdir -p aufgabe3
cat > aufgabe3/template.conf <<'EOF'
# Datenbank-Konfiguration
DB_HOST=localhost
DB_PORT=3306
DB_USER=username
DB_PASS=password
DB_NAME=mydatabase

# Anwendungs-Konfiguration
APP_URL=localhost
APP_USER=username
EOF

cat > aufgabe3/README.md <<'EOF'
# Aufgabe 3: Mehrere Ersetzungen in einem Script

**Datei:** `template.conf`

**Aufgabe:** Schreiben Sie ein Script `setup.sh`, das folgende Ersetzungen durchführt:
- `localhost` → `192.168.1.100`
- `username` → `admin`
- `password` → `secret123`

**Speichern Sie das Ergebnis in `production.conf`.**

**Tipp:** Verwenden Sie `sed -e` für mehrere Befehle oder mehrere `-e` Optionen
EOF

# === AUFGABE 4: Log-Analyse ===
mkdir -p aufgabe4
cat > aufgabe4/server.log <<'EOF'
2024-01-15 10:30: ERROR: Connection failed to 192.168.1.50
2024-01-15 10:31: INFO: Service restarted successfully
2024-01-15 10:32: ERROR: Timeout detected on port 8080
2024-01-15 10:33: WARNING: Disk usage above 80%
2024-01-15 10:35: INFO: All systems operational
2024-01-15 10:36: ERROR: Authentication failed for user admin
EOF

cat > aufgabe4/README.md <<'EOF'
# Aufgabe 4: Log-Analyse mit Sed und Scripting

**Datei:** `server.log`

**Aufgabe:** Schreiben Sie ein Script `error_report.sh`, das:
1. Nur Zeilen mit "ERROR" extrahiert
2. Das aktuelle Datum oben in die Ausgabedatei schreibt
3. Die Fehler in `error_YYYY-MM-DD.txt` speichert (z.B. `error_2024-01-15.txt`)

**Tipp:** Kombinieren Sie `date`, `echo` und `sed -n '/MUSTER/p'`
EOF

# === AUFGABE 5: Massenverarbeitung ===
mkdir -p aufgabe5
for i in 1 2 3; do
    cat > aufgabe5/file$i.txt <<EOF
DATEI_NR=$i
TITLE=__TITLE__
AUTHOR=__AUTHOR__
VERSION=__VERSION__
CREATED=__DATE__
EOF
done

cat > aufgabe5/README.md <<'EOF'
# Aufgabe 5: Massenverarbeitung

**Dateien:** `file1.txt`, `file2.txt`, `file3.txt`

**Aufgabe:** Schreiben Sie ein Script `batch_replace.sh`, das:
1. ALLE `.txt`-Dateien im Verzeichnis findet
2. In jeder Datei folgende Platzhalter ersetzt:
   - `__TITLE__` → `Mein Projekt`
   - `__AUTHOR__` → `Ihr Name`
   - `__VERSION__` → `1.0.0`
   - `__DATE__` → Aktuelles Datum (Format: YYYY-MM-DD)
3. Jede Datei sichert mit `.backup` Endung

**Tipp:** Verwenden Sie eine for-loop mit `*.txt` und `sed -i.backup`
EOF

# Haupt-README im Wurzelverzeichnis
cat > README.md <<'EOF'
# Sed-Schulungsübungen

Willkommen zu den Sed-Übungen!

## Struktur
- `aufgabe1/` - Basis-Ersetzung
- `aufgabe2/` - In-place Editing mit Backup
- `aufgabe3/` - Mehrere Ersetzungen
- `aufgabe4/` - Log-Analyse mit Scripting
- `aufgabe5/` - Massenverarbeitung

## Vorgehen
1. Wechseln Sie in ein Aufgabenverzeichnis: `cd aufgabe1`
2. Lesen Sie die Aufgabenstellung: `cat README.md`
3. Arbeiten Sie die Aufgabe durch
4. Wechseln Sie zur nächsten Aufgabe

## Lösungen
Lösungen sind verfügbar im Verzeichnis: `loesungen/`

Viel Erfolg!
EOF

echo "✓ Alle Aufgabenverzeichnisse erstellt!"
echo "✓ Struktur: $TRAINING_DIR/aufgabe[1-5]/"
echo "✓ Wechseln Sie ins Verzeichnis: cd $TRAINING_DIR"
echo "✓ Starten Sie mit: cat aufgabe1/README.md"