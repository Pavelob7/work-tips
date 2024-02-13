REPO_PATH=var/lib/postgresql/9.6/main
BACKUP_FOLDER=Документы/backups

# Создаем ежедневный резервный файл
pg\_dump MY_DB | gzip > $BACKUP_FOLDER/MY_DB-$(date +%Y-%m-%d).sql.gz

# Удаляем любые файлы резервного копирования, которые старше 60 дней
find $BACKUP_FOLDER -type f -mtime +60 -delete
