#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <unistd.h>
#include <curl/curl.h>

#include <queue>

using namespace std;

struct file_t {
    char url[256];
    double total;
    double downloaded;
    int thread;
};

std::queue<file_t*> files;


void download_progress_func(file_t * f, double t, double d, double ultotal, double ulnow){
    f->total = t;
    f->downloaded = d;

    // printf("Thread %d - progress %s - %f\n", f->thread, f->url, d*100.0/t);
    fflush(stdout);
}

void * thread_fun(void * arg){
    int k = *((int *) arg);
    file_t * f;

    while(true){
        // TODO: mutex on
        if(files.empty()){
            // TODO: mutex off
            break;
        }

        f = files.front();
        files.pop();
        // TODO: mutex off

        f->thread = k;

        printf("Thread %d got file: %s\n", k, f->url);
        fflush(stdout);


        // Download

        CURL *curl = curl_easy_init();
        if(curl){
            char str[100];
            sprintf(str, "/tmp/pcurl/download-%d.tmp", k);
            FILE *outfile = fopen(str, "w");

            printf("Thread %d - downloading to %s\n", k, str);
            fflush(stdout);

            curl_easy_setopt(curl, CURLOPT_URL, f->url);
            curl_easy_setopt(curl, CURLOPT_WRITEDATA, outfile);
            // curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, my_write_func);
            // curl_easy_setopt(curl, CURLOPT_READFUNCTION, my_read_func);
            curl_easy_setopt(curl, CURLOPT_NOPROGRESS, 0L);
            curl_easy_setopt(curl, CURLOPT_PROGRESSFUNCTION, download_progress_func);
            curl_easy_setopt(curl, CURLOPT_PROGRESSDATA, f);

            CURLcode res = curl_easy_perform(curl);

            printf("Thread %d - finished %s - %d\n", k, str, res);
            fflush(stdout);

            fclose(outfile);
            curl_easy_cleanup(curl);
        }


        delete f;
    }

    printf("Thread %d - no more files\n", k);
    fflush(stdout);



    return NULL;
}

void init(int n){
    pthread_t * threads = new pthread_t[n];
    int * threads_args = new int[n];
    int i;

    for(i=0; i<n; i++){
        threads_args[i] = i;
        pthread_create(threads + i, NULL, thread_fun, threads_args + i);
    }

    for(i=0; i<n; i++){
        pthread_join(threads[i], NULL);
    }


    exit(0);
}

int main(int argc, char const *argv[]){
    if(argc < 2){
        printf("Usage: %s [FILE]\n", argv[0]);
        exit(-1);
    }

    FILE * urls_file = fopen(argv[1], "r");
    if(urls_file != NULL){
        char url[256];
        file_t * f;

        while(fscanf(urls_file, "%s", url) != EOF){
            f = new file_t;
            strcpy(f->url, url);
            files.push(f);
            printf("url: %s\n", url);
        }

        fclose(urls_file);
    } else {
        printf("File '%s' not found\n", argv[1]);
        exit(-1);
    }


    // curl_global_init(CURL_GLOBAL_ALL);

    init(5);

    // printf("Hello\n");
    return 0;
}
