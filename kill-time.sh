#!/bin/bash
# Запрашиваем название процесса
read -p "Введите название процесса: " process_name
while true; do
    pid=$(pgrep -f "$process_name")
    if [ -n "$pid" ]; then
        echo "Процесс \"$process_name\" найден с PID: $pid"
        break
    else
        echo "Процесс \"$process_name\" не найден"
        read -p "Введите название процесса: " process_name
    fi
done
# Используем команду ps для поиска процессов с указанным именем и вывода их PID и имени процесса
echo "Список процессов с названием \"$process_name\":"
ps -eo pid,comm | grep "$process_name" | grep -v grep
# Запрашиваем PID процесса
read -p "Введите PID процесса: " pid
# Запрашиваем время ожидания перед убийством процесса (в секундах)
read -p "Введите время ожидания (в секундах): " wait_time
# Ожидаем указанное время
sleep $wait_time
# Проверяем, существует ли процесс с указанным PID
if ps -p $pid > /dev/null; then
  # Процесс существует, убиваем его
  kill $pid
  echo "Процесс $pid успешно убит."
else
  # Процесс не существует
  echo "Процесс $pid не существует."
fi
