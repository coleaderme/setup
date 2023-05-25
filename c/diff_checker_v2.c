#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <dirent.h>
#include <unistd.h>

#define MAX_FILES 10000
#define MAX_NAME_LENGTH 256

// Optimization flags -
// gcc -Wall -Wextra -O3 -march=native -mtune=native -ftree-vectorize -funroll-loops -pthread diff_checker.c -o dfchecker

void list_files(const char *path, char **files, int *count) {
    DIR *dir = opendir(path);
    if (dir != NULL) {
        struct dirent *entry;
        while ((entry = readdir(dir)) != NULL && *count < MAX_FILES) {
            const char *name = entry->d_name;
            if (strcmp(name, ".") == 0 || strcmp(name, "..") == 0)
                continue;
            int len = strlen(name);
            files[*count] = malloc(len + 1);
            strncpy(files[*count], name, len + 1);
            (*count)++;
        }
        closedir(dir);
    }
}

int main() {
    char path_a[MAX_NAME_LENGTH], path_b[MAX_NAME_LENGTH];
    printf("A: ");
    fgets(path_a, sizeof(path_a), stdin);
    printf("B: ");
    fgets(path_b, sizeof(path_b), stdin);

    // Remove trailing newline characters
    path_a[strcspn(path_a, "\n")] = '\0';
    path_b[strcspn(path_b, "\n")] = '\0';

    // List files in directory A
    char *a_files[MAX_FILES];
    int a_count = 0;
    list_files(path_a, a_files, &a_count);

    // List files in directory B
    char *b_files[MAX_FILES];
    int b_count = 0;
    list_files(path_b, b_files, &b_count);

    // Find unique files in A
    printf("a:: %d\n", a_count);
    int unique_a_count = 0;
    for (int i = 0; i < a_count; i++) {
        int found = 0;
        for (int j = 0; j < b_count; j++) {
            if (strcmp(a_files[i], b_files[j]) == 0) {
                found = 1;
                break;
            }
        }
        if (!found) {
            printf("%d. %s\n", ++unique_a_count, a_files[i]);
        }
    }
    printf("\n");

    // Find unique files in B
    printf("b:: %d\n", b_count);
    int unique_b_count = 0;
    for (int i = 0; i < b_count; i++) {
        int found = 0;
        for (int j = 0; j < a_count; j++) {
            if (strcmp(b_files[i], a_files[j]) == 0) {
                found = 1;
                break;
            }
        }
        if (!found) {
            printf("%d. %s\n", ++unique_b_count, b_files[i]);
        }
    }

    // Free memory
    for (int i = 0; i < a_count; i++)
        free(a_files[i]);
    for (int i = 0; i < b_count; i++)
        free(b_files[i]);

    return 0;
}
