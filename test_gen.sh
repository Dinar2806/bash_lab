#!/bin/bash
# Вспомогательный скрипт для генерации тестовых данных (Требование из PDF)

TEST_DIR="test_workspace"
rm -rf "$TEST_DIR"
mkdir -p "$TEST_DIR/subdir1/deep"
mkdir -p "$TEST_DIR/subdir2"

#Обычные файлы
echo -e "line1\nline2\nline3" > "$TEST_DIR/main.cpp"
echo -e "header1\nheader2" > "$TEST_DIR/utils.h"

#  Файл с пробелами в имени (проверка robustness)
echo -e "space1\nspace2\nspace3\nspace4" > "$TEST_DIR/my header file.h"

# Пустой файл
touch "$TEST_DIR/empty.cpp"

# Файл без переноса строки в конце (wc -l часто ошибается на таких)
printf "no_newline_at_end" > "$TEST_DIR/subdir1/tricky.h"

# Файлы с другими расширениями (должны игнорироваться)
echo "ignore me" > "$TEST_DIR/readme.txt"
echo "ignore me too" > "$TEST_DIR/subdir2/script.py"

# Глубоко вложенный файл
echo -e "deep1\ndeep2\ndeep3\ndeep4\ndeep5" > "$TEST_DIR/subdir1/deep/nested.cpp"

echo "Тестовая директория '$TEST_DIR' успешно создана."
echo "Запустите: ./lines_count.sh $TEST_DIR"