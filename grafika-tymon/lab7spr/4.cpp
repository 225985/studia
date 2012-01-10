void trace(float * p, float * v, int step){
    Sphere * sp = intersect(p, v);
    if(sp != NULL){
        normal(sp);
        reflect(v);
        phong(v, sp);
        TRIPLE(color[i] += inters_c[i]);

        if(step < TRACE_MAX) trace(inter, ref, step+1);
    }
}
