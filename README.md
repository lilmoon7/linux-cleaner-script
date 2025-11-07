### Bash Cleaner Script – Nettoyeur de Fichiers

--**Mode :** Manuel -- 
Sécurisé  **OS :** CentOS -- 
Linux  **Langage :** Bash --

### 🔍 Description

Script Bash simple et fiable pour **libérer de l’espace disque** en supprimant les fichiers anciens.
Exécution **manuelle** pour un **contrôle total** et un **risque minimal**.
Inclut un **mode test (dry-run)** pour simuler les suppressions avant exécution réelle.

---

### ⚙️ Fonctionnalités

* Suppression des fichiers plus vieux qu’un seuil défini (ex : `+7 jours`)
* Mode test : vérification sans suppression
* Configuration dynamique via `cleanup.conf`
* Journalisation dans `/var/log/cleaner_script.log`

---

### 💡 Compétences Techniques

| Domaine                     | Compétence                                                       |
| :-------------------------- | :--------------------------------------------------------------- |
| **Scripting Bash**          | Utilisation de `find`, boucles `while read`, gestion d’arguments |
| **Sécurité d’exécution**    | Mode test pour prévenir toute suppression accidentelle           |
| **Configuration modulaire** | Lecture dynamique du fichier `cleanup.conf`                      |
| **Logs & traçabilité**      | Redirection de la sortie standard et erreur pour audit complet   |
| **Administration système**  | Nettoyage automatisé et maintenance manuelle des systèmes Linux  |

---

### 🚀 Utilisation

1. **Préparer le script**

   ```bash
   chmod +x cleaner.sh
   ```

   Modifier `cleanup.conf` pour y indiquer les répertoires à nettoyer.

2. **Mode test (simulation)**

   ```bash
   ./cleaner.sh -t
   ```

3. **Mode réel (suppression effective)**

   ```bash
   ./cleaner.sh
   ```

4. **Consulter le log**

   ```bash
   cat /home/niema/cleaner_script.log
   ```


