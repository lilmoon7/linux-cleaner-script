#!/bin/bash

AGE_THRESHOLD="+7" 
CONFIG_FILE="./cleanup.conf" 
LOG_FILE="/var/log/cleaner_script.log"
START_TIME=$(date)
DRY_RUN=false
VERSION="2.1"

if [ "$1" == "-t" ] || [ "$1" == "--test" ]; then
    DRY_RUN=true
fi

{
    echo -e "\n--- Lancement du Nettoyeur de Fichiers Périodiques (v$VERSION) ---"
    echo "Date de lancement : $START_TIME"
    echo "Fichiers ciblés : Plus anciens que $AGE_THRESHOLD jours."
    
    if $DRY_RUN; then
        echo "=========================================================="
        echo "MODE TEST (DRY-RUN) : Aucune suppression réelle ne sera effectuée."
        echo "=========================================================="
    else
        echo "MODE PRODUCTION : Suppression réelle des fichiers."
    fi

    if [ ! -f "$CONFIG_FILE" ]; then
        echo "ERREUR FATALE : Le fichier de configuration $CONFIG_FILE est introuvable. Sortie du script."
        exit 1
    fi

    while IFS= read -r TARGET_DIR
    do
        if [[ -z "$TARGET_DIR" || "$TARGET_DIR" =~ ^# ]]; then
            continue
        fi

        echo "--------------------------------------------------------"
        echo "Traitement du répertoire : $TARGET_DIR"

        if [ ! -d "$TARGET_DIR" ]; then
            echo "AVERTISSEMENT : Le répertoire $TARGET_DIR n'existe pas ou n'est pas un répertoire. IGNORÉ."
            continue
        fi

        echo "Fichiers TROUVÉS (et traités) dans $TARGET_DIR :"
        
        if $DRY_RUN; then
            find "$TARGET_DIR" -type f -mtime $AGE_THRESHOLD -print
        else
            find "$TARGET_DIR" -type f -mtime $AGE_THRESHOLD -delete -print
        fi
        
    done < "$CONFIG_FILE"

    END_TIME=$(date)
    echo "--------------------------------------------------------"
    echo "Opération terminée à : $END_TIME"
    echo "--- Fin du Nettoyeur de Fichiers Périodiques ---"
    
} >> "$LOG_FILE" 2>&1

echo "Nettoyage terminé. Vérifiez le log dans $LOG_FILE pour les détails."
exit 0
