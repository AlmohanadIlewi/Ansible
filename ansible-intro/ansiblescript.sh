#!/bin/bash

# Überprüfe, ob eine lokale Kopie des Git-Repositories existiert
if [ ! -d "my-config-repo" ]; then
    # Falls nicht, klonen des Git-Repositories
    git clone https://github.com/dein-benutzername/dein-config-repo.git my-config-repo
fi

# Wechsle in das Verzeichnis des Git-Repositories
cd my-config-repo

# Aktualisiere die lokale Kopie des Repositories
git pull

# Führe das Ansible Playbook aus
ansible-playbook playbook.yaml >> ansible-logs.log 2>&1
