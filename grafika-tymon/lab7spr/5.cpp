Sphere * intersect(float * v1, float * v2){
    Sphere * s = NULL;
    float pre = FLT_MAX;
    float a, b, c, del, r;

    for(vector<Sphere>::iterator it=spheres.begin(); it < spheres.end(); it++){
        Sphere sp = *it;
        float * spp = sp.position;

        a = v2[0] * v2[0] + v2[1] * v2[1] + v2[2] * v2[2];

        b = 2 * (v2[0] * (v1[0] - spp[0]) +
                 v2[1] * (v1[1] - spp[1]) +
                 v2[2] * (v1[2] - spp[2]));

        c = v1[0] * v1[0] + v1[1] * v1[1] + v1[2] * v1[2] -
        2*(spp[0] * v1[0] +
           spp[1] * v1[1] +
           spp[2] * v1[2]) +
        spp[0]*spp[0] + spp[1] * spp[1] + spp[2] * spp[2] -
        sp.radius * sp.radius;

        del = b*b - 4*a*c;

        if(del >= 0){
            r = (-b - sqrt(del))/(2*a);
            if(r > 0 && r < pre){
                inter[0] = v1[0] + r*v2[0];
                inter[1] = v1[1] + r*v2[1];
                inter[2] = v1[2] + r*v2[2];
                pre = sqrt((inter[0] - v1[0]) * (inter[0] * v1[0]) +
                         (inter[1] - v1[1]) * (inter[1] * v1[1]) +
                         (inter[2] - v1[2]) * (inter[2] * v1[2]));
                s = &(*it);
            }
        }

    }

    return s;
}
