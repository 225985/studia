void phong(float * v, Sphere * sp){
    float light_vec[3];
    float reflection_vector[3];
    float viewer_v[3];
    float nl, vr;

    TRIPLE(
        viewer_v[i] = -v[i];
        inters_c[i] = 0;
    )

    for(vector<Source>::iterator it=sources.begin(); it!= sources.end(); it++){
        Source src = *it;
        float * srcp = src.position;
        TRIPLE(light_vec[i] = srcp[i] - inter[i])

        normalization(light_vec);
        nl = prod(light_vec, vec_n);
        TRIPLE(reflection_vector[i] = 2*nl*vec_n[i] - light_vec[i])

        normalization(reflection_vector);
        vr = prod(reflection_vector, viewer_v);

        if(vr < 0) vr = 0;

        if(nl > 0){
            float x = sqrt((srcp[0] - inter[0])*(srcp[0] - inter[0]) +
                           (srcp[1] - inter[1])*(srcp[1] - inter[1]) +
                           (srcp[2] - inter[2])*(srcp[2] - inter[2]));
            TRIPLE(
                inters_c[i] += (1.0/(PHONG_A + PHONG_B*x + PHONG_C*x*x)) *
                (sp->diffuse[i]*src.diffuse[i]*nl + sp->specular[i]*src.specular[i]*pow(vr, sp->specularhinines)) +
                sp->ambient[i]*src.ambient[i];
            )
        } else {
            TRIPLE(inters_c[i] += sp->ambient[i]*global[i])
        }
    }

}

