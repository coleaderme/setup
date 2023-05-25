#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() {
    // Read URL from clipboard using xsel command
    FILE* fp = popen("xsel -b", "r");
    char url[64];
    fgets(url, sizeof(url), fp);
    pclose(fp);

    // Trim trailing newline character from URL
    url[strcspn(url, "\n")] = '\0';

    // Check if URL contains "youtube"
    if (strstr(url, "youtube") != NULL) {
        printf("The URL contains 'youtube'\n");

        // Execute mpv command with URL argument
        char command[128];
        sprintf(command, "mpv --profile=1080p \"%s\"", url);
        system(command);
    } else {
        printf("The URL does not contain 'youtube'\n");
    }
    return 0;
}