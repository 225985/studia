#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <unistd.h>
#include <curl/curl.h>
#include <ncurses.h>
#include <deque>

using namespace std;

struct file_t {
    char url[256];
    double total;
    double downloaded;
};

struct worker_thread_t {
    pthread_t thread;
    file_t * file;

    int tmp;
};

deque<file_t*> files;
worker_thread_t * worker_threads;
int worker_threads_count;

pthread_t gui_thread;
bool gui_thread_keep = true;



void * download_progress_func(file_t * f, double t, double d, double ultotal, double ulnow){
    f->total = t;
    f->downloaded = d;

    // printf("%f\n", d*100.0/t);
    // fflush(stdout);
    return NULL;
}

void * worker_thread_fun(void * arg){
    worker_thread_t * wt = (worker_thread_t *)arg;
    file_t * f;

    while(true){
        // TODO: mutex on
        // printf("file.empty? %d\n", files.empty());

        if(files.empty()){
            // TODO: mutex off
            break;
        }

        f = files.front();
        files.pop_front();
        // TODO: mutex off

        wt->file = f;


        // f->thread = k;

        // printf("Thread %d got file: %s\n", wt->tmp, f->url);
        // fflush(stdout);

        // sleep(wt->tmp);

        // Download


        CURL *curl = curl_easy_init();
        if(curl){

            char str[100];
            sprintf(str, "/tmp/pcurl/download-%d.tmp", wt->tmp);
            FILE *outfile = fopen(str, "w");

            // printf("Thread %d - downloading to %s\n", wt->tmp, str);
            // fflush(stdout);

            curl_easy_setopt(curl, CURLOPT_URL, f->url);
            curl_easy_setopt(curl, CURLOPT_WRITEDATA, outfile);

            curl_easy_setopt(curl, CURLOPT_NOPROGRESS, 0L);
            curl_easy_setopt(curl, CURLOPT_PROGRESSFUNCTION, download_progress_func);
            curl_easy_setopt(curl, CURLOPT_PROGRESSDATA, wt->file);

            CURLcode res = curl_easy_perform(curl);

            // printf("Thread %d - finished %s - %d\n", wt->tmp, str, res);
            // fflush(stdout);

            fclose(outfile);
            curl_easy_cleanup(curl);
        } else {
            // printf("CURL FAILED!\n");
            // fflush(stdout);
            // exit(-1);
        }


        delete f; // TODO Lock it!
        wt->file = NULL;
    }

    // printf("Thread %d - no more files\n", k);
    // fflush(stdout);



    return NULL;
}



void init_worker_threads(){
    worker_threads = new worker_thread_t[worker_threads_count];

    for(int i=0; i<worker_threads_count; i++){
        worker_threads[i].tmp = i+1;
        pthread_create(&worker_threads[i].thread, NULL, worker_thread_fun, &worker_threads[i]);
    }
}

void wait_for_worker_threads(){
    for(int i=0; i<worker_threads_count; i++){
        // printf("Waiting for thread %d\n", i);
        // fflush(stdout);
        pthread_join(worker_threads[i].thread, NULL);
    }
}

void paint(){
    char str[256];
    char bar[40];
    double perc;
    int y = 0;
    file_t * f;

    erase();
    mvprintw(0, 0, "Parallel cURL !!!");

    y+=2;

    for(int i=0; i<worker_threads_count; i++){
        f = worker_threads[i].file;
        if(f != NULL){
            if(f->total != 0.0) perc = f->downloaded*100/f->total;
            else perc = 0.0;

            int p = (int)(perc/5);
            for(int j=0; j<p; j++) bar[j] = '|';
            bar[p] = '\0';

            sprintf(str, "Thread %2d: %-50s [%-20s] - %.2f %%%%", i+1, f->url, bar, perc);
        } else {
            sprintf(str, "Thread %2d: empty", i+1);
        }
        mvprintw(y, 0, str);
        y++;
    }

    y++;

    int i = 0;
    for(deque<file_t *>::iterator it = files.begin(); it != files.end(); it++){
        f = *it;
        sprintf(str, "%d. %s", (i+1), f->url);
        mvprintw(y, 0, str);
        y++;
        i++;
    }

    refresh();
}

void * gui_thread_fun(void * _arg){
    initscr();

    while(gui_thread_keep){
        paint();
        // sleep(1);
    }

    endwin();

    return NULL;
}

void init_gui_thread(){
    pthread_create(&gui_thread, NULL, gui_thread_fun, NULL);
}

void wait_for_gui_thread(){
    gui_thread_keep = false;
    pthread_join(gui_thread, NULL);
}





int main(int argc, char const *argv[]){
    if(argc < 3){
        printf("Usage: %s [FILE] [WORKERS_NUM\n", argv[0]);
        exit(-1);
    }

    // Create files queue
    FILE * urls_file = fopen(argv[1], "r");
    if(urls_file != NULL){
        char url[256];
        file_t * f;

        while(fscanf(urls_file, "%s", url) != EOF){
            f = new file_t;
            strcpy(f->url, url);
            files.push_back(f);
            // printf("url: %s\n", url);
        }

        fclose(urls_file);
    } else {
        printf("File '%s' not found\n", argv[1]);
        exit(-1);
    }

    worker_threads_count = atoi(argv[2]);


    curl_global_init(CURL_GLOBAL_ALL);


    init_gui_thread();
    init_worker_threads();

    wait_for_worker_threads();
    wait_for_gui_thread();



    // printf("Hello\n");
    return 0;
}
