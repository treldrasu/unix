#!/bin/bash

# Erstellt Lösungsverzeichnis mit Musterlösungen für Sed-Training
# Ausführung im Hauptverzeichnis (sed_aufgaben/)

echo "Erstelle Lösungsverzeichnis..."

# Lösungsverzeichnis erstellen
mkdir -p loesungen

# Lösung 1
cat > loesungen/loesung1.sh <<'EOF'
#!/bin/bash
echo "=== Lösung Aufgabe 1: Basis-Ersetzung ==="
cd aufgabe1
echo "Original:"
cat to-be-replaced.txt
echo ""
echo "Nach Ersetzung:"
sed 's/Lorem/Kai Effenberger/g' to-be-replaced.txt
EOF
chmod +x loesungen/loesung1.sh

# Lösung 2
cat > loesungen/loesung2.sh <<'EOF'
#!/bin/bash
echo "=== Lösung Aufgabe 2: In-place Editing mit Backup ==="
cd aufgabe2
echo "Vorher:"
cat config.txt
echo ""
sed -i.bak 's/ipsum/BERLIN/g' config.txt
echo "Nachher:"
cat config.txt
echo ""
echo "Backup wurde erstellt: config.txt.bak"
EOF
chmod +x loesungen/loesung2.sh

# Lösung 3
cat > loesungen/loesung3.sh <<'EOF'
#!/bin/bash
echo "=== Lösung Aufgabe 3: Mehrere Ersetzungen ==="
cd aufgabe3
sed -e 's/localhost/192.168.1.100/g' \
    -e 's/username/admin/g' \
    -e 's/password/secret123/g' \
    template.conf > production.conf
echo "Erstellt: production.conf"
echo ""
echo "Inhalt:"
cat production.conf
EOF
chmod +x loesungen/loesung3.sh

# Lösung 4
cat > loesungen/loesung4.sh <<'EOF'
#!/bin/bash
echo "=== Lösung Aufgabe 4: Log-Analyse ==="
cd aufgabe4
TODAY=$(date +%Y-%m-%d)
echo "Fehlerreport vom $TODAY" > error_$TODAY.txt
sed -n '/ERROR/p' server.log >> error_$TODAY.txt
echo "Erstellt: error_$TODAY.txt"
echo ""
echo "Inhalt:"
cat error_$TODAY.txt
EOF
chmod +x loesungen/loesung4.sh

# Lösung 5
cat > loesungen/loesung5.sh <<'EOF'
#!/bin/bash
echo "=== Lösung Aufgabe 5: Massenverarbeitung ==="
cd aufgabe5
for file in *.txt; do
    if [ -f "$file" ]; then
        echo "Verarbeite: $file"
        sed -i.backup -e "s/__TITLE__/Mein Projekt/g" \
                       -e "s/__AUTHOR__/Kai Effenberger/g" \
                       -e "s/__VERSION__/1.0.0/g" \
                       -e "s/__DATE__/$(date +%Y-%m-%d)/g" "$file"
    fi
done
echo ""
echo "Ergebnis:"
ls -la *.txt
echo ""
echo "Inhalt von file1.txt:"
cat file1.txt
EOF
chmod +x loesungen/loesung5.sh

# Master-Lösung (alle auf einmal)
cat > loesungen/alle_loesungen.sh <<'EOF'
#!/bin/bash
echo "Führe alle Lösungen aus..."
./loesungen/loesung1.sh
echo ""
./loesungen/loesung2.sh
echo ""
./loesungen/loesung3.sh
echo ""
./loesungen/loesung4.sh
echo ""
./loesungen/loesung5.sh
EOF
chmod +x loesungen/alle_loesungen.sh

# README für Lösungen
cat > loesungen/README.md <<'EOF'
# Lösungen

Führen Sie die Lösungsscripts aus dem Hauptverzeichnis aus:

```bash
./loesungen/loesung1.sh
./loesungen/loesung2.sh
./loesungen/loesung3.sh
./loesungen/loesung4.sh
./loesungen/loesung5.sh