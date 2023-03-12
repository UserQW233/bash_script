#!/bin/bash

# функция для действия "выключить"
function off() {
    # код для выполнения действия "выключить"
    sudo -k -S systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
    echo "Automatic sleep mode disabled."
}

# функция для действия "включить"
function on() {
    # код для выполнения действия "включить"
    sudo -k -S systemctl unmask sleep.target suspend.target hibernate.target hybrid-sleep.target
    echo "Automatic sleep mode re-enabled."
}

# выводим меню с выбором действия
echo "Choose an action:"
echo "1. Turn off automatic sleep mode."
echo "2. Turn on automatic sleep mode."
read choice

# выполняем выбранное действие
case $choice in
    1) off;;
    2) on;;
    *) echo "Invalid choice.";;
esac
