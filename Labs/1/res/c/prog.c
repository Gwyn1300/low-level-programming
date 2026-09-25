#include <stdio.h>

// Функция для подсчета единиц в двоичном представлении числа
int count_ones(int num) {
    int count = 0;
    while (num > 0) {
        count += (num & 1);
        num >>= 1;
    }
    return count;
}

int main() {
    int N;
    printf("Введите степень N (порядок матрицы будет 2^N): ");
    scanf("%d", &N);

    // Вычисляем размер матрицы (2^N) с помощью сдвига
    int size = 1 << N; 

    printf("\nМатрица Адамара порядка %d:\n\n", size);

    // Генерируем и сразу выводим матрицу
    for (int i = 0; i < size; i++) {
        for (int j = 0; j < size; j++) {
            // Если количество единиц в (i & j) четное, то элемент равен 1 (+), иначе -1 (-)
            char element = (count_ones(i & j) % 2 == 0) ? '+' : '-';
            printf("%c ", element);
        }
        printf("\n");
    }

    return 0;
}
