#!/bin/bash

SCRIPT_NAME="Nettoyeur de Fichiers Périodiques"
VERSION="2.0 - Configuration Dynamique"


AGE_THRESHOLD="+7" 

LOG_FILE="/var/log/cleaner_script.log"

CONFIG_FILE="./cleanup.conf" 

START_TIME=$(date)

{
    echo -e "\n--- Lancement du $SCRIPT_NAME (v$VERSION) ---"
    echo "Date de lancement : $START_TIME"
    echo "Configuration lue depuis : $CONFIG_FILE"
    echo "Fichiers à supprimer (plus de $AGE_THRESHOLD jours)."

    if [ ! -f "$CONFIG_FILE" ]; then
        echo "ERREUR FATALE : Le fichier de configuration $CONFIG_FILE est introuvable."
        exit 1
    fi

    while IFS= read -r TARGET_DIR
    do
        if [[ -z "$TARGET_DIR" || "$TARGET_DIR" =~ ^# ]]; then
            continue
        fi

    echo "-------------------------------------------------------------------------------------------------------------------------------------------------------------"
        echo "Nettoyage du répertoire cible : $TARGET_DIR"

        if [ ! -d "$TARGET_DIR" ]; then
            echo "AVERTISSEMENT : Le répertoire $TARGET_DIR n'existe pas ou n'est pas un répertoire. IGNORÉ."
            continue
        fi

        echo "Fichiers SUPPRIMÉS dans $TARGET_DIR :"
        
        find "$TARGET_DIR" -type f -mtime $AGE_THRESHOLD -delete -print
        
    done < "$CONFIG_FILE"

    END_TIME=$(date)
    echo "-------------------------------------------------------------------------------------------------------------------------------------------------------------"
    echo "Opération terminée à : $END_TIME"
    echo "--- Fin du $SCRIPT_NAME ---"
    
} >> "$LOG_FILE" 2>&1

echo "Nettoyage terminé. Vérifiez le log dans $LOG_FILE pour les détails."
exit 0
