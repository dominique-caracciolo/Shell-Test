#!/bin/bash

# Répertoire de sauvegarde
backup_dir="/home/user/Job8/Backup"

# Création du répertoire de sauvegarde s'il n'existe pas
mkdir -p "$backup_dir"

# Date et heure actuelles
current_date=$(date +'%d-%m-%Y-%H:%M')

# Nom du fichier de sauvegarde
backup_file="$backup_dir/number_connection-$current_date"

# Extraction du nombre de connexions à la session
num_connections=$(last -s "-1 hour" | wc -l)

# Soustraire 2 pour exclure les lignes d'en-tête de last
num_connections=$((num_connections - 2))

# Écriture du nombre de connexions dans le fichier
echo "$num_connections" > "$backup_file"

# Archivage du fichier avec tar
tar -czvf "$backup_file.tar.gz" "$backup_file" >/dev/null 2>&1

# Suppression du fichier original
#rm "$backup_file"

#echo $backup_file
