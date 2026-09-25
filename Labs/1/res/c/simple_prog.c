#include <stdio.h>

//char arr[1000];

int main(){
    int N;
    printf("Введите степень N (порядок матрицы будет 2^N): ");
    scanf("%d", &N);

    int size = 1 << N; 

    printf("\nМатрица Адамара порядка %d:\n\n", size);
    const int size_arr = size<<N;
    char arr[size_arr];
    
    int i = 0;
    loop_start:
        
        if(i>=size) goto loops_done;
        int j = 0;
        loop2_start:
            if(j>=size) goto loop2_end;
            
            int num = i&j;
            int count = 0;
            
            cycle_start:
                if(num<=0) goto cycle_end;
                int a = num&1;
                count+=a;
                num>>=1;
                goto cycle_start;
            
            cycle_end:
                if(count % 2 != 0) goto if_false;
                arr[i*size+j] = '+';
                goto if_end;

            if_false:
                arr[i*size+j] = '-';
                goto if_end;

            if_end:
                j++;
                goto loop2_start;

        loop2_end:
        i++;
        goto loop_start;
    
    loops_done:

        int m = 0;
        print_start:
            if(m>=size) goto loop_end;
            int k = 0;

            loop_print_start:
                if(k>=size) goto loop_print_end;
                printf("%c",arr[m*size+k]);
                k++;
                goto loop_print_start;
            loop_print_end:
                printf("\n");
                m++;
                goto print_start;
    loop_end:
        printf("\n Завершение работы программы \n");
        return 0;


}