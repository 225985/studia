// data structures
struct Sphere {
    float radius;
    float position[3];
    float specular[3];
    float diffuse[3];
    float ambient[3];
    float specularhinines;
};

struct Source {
    float position[3];
    float specular[3];
    float diffuse[3];
    float ambient[3];
};

// params
int dimensions[2];
float background[3];
float global[3];
vector<Sphere> spheres;
vector<Source> sources;

// read scene from file
void readFile(){
    fstream in("/Users/teamon/Downloads/scene.txt", ios :: in);
    string s;

    while(!in.eof()){
        in >> s;

        if(s == "dimensions"){
            in >> dimensions[0];
            in >> dimensions[1];
        } else if(s == "background"){
            TRIPLE(in >> background[i]);
        } else if(s == "global"){
            TRIPLE(in >> global[i]);
        } else if(s == "sphere"){
            Sphere sph;
            in >> sph.radius;
            TRIPLE(in >> sph.position[i]);
            TRIPLE(in >> sph.specular[i]);
            TRIPLE(in >> sph.diffuse[i]);
            TRIPLE(in >> sph.ambient[i]);
            in >> sph.specularhinines;
            spheres.push_back(sph);
        } else if(s == "source"){
            Source src;
            TRIPLE(in >> src.position[i]);
            TRIPLE(in >> src.specular[i]);
            TRIPLE(in >> src.diffuse[i]);
            TRIPLE(in >> src.ambient[i]);
            sources.push_back(src);
        }

    }

    in.close();
}
