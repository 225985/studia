int Intersect(float *point, float *vec){
    int st = -1;
    float l = FLT_MAX, a, b, c, d, r;



    for(int i=0; i< sphereCount; i++)
    {
        a = vec[0]*vec[0] + vec[1]*vec[1] + vec[2]*vec[2];
        b = 2*(vec[0]*(point[0] - sphere_pos[i][0]) + vec[1]
            *(point[1] - sphere_pos[i][1]) 
            + vec[2]*(point[2] - sphere_pos[i][2]));
        c = point[0]*point[0] + point[1]*point[1] 
            + point[2]*point[2] - 2*(sphere_pos[i][0]*point[0] 
            + sphere_pos[i][1]*point[1] + sphere_pos[i][2]*point[2]) 
            + sphere_pos[i][0]*sphere_pos[i][0] 
            + sphere_pos[i][1]*sphere_pos[i][1] + sphere_pos[i][2]*sphere_pos[i][2] 
            - sphere_radius[i]*sphere_radius[i];
        d = b*b-4*a*c;
        
        if (d >= 0 ) {
            r = (-b - sqrt(d))/(2*a);
        
        if (r > 0 && r < l) {
            inter[0] = point[0] + r*vec[0];
            inter[1] = point[1] + r*vec[1];
            inter[2] = point[2] + r*vec[2];
            l = sqrt((inter[0]-point[0])*(inter[0]-point[0]) 
                + (inter[1]-point[1])*(inter[1]-point[1]) 
                + (inter[2]-point[2])*(inter[2]-point[2]));
            st = i;
            }
        }

    }

    if(st > -1) return st;
    l = FLT_MAX;
    for (int i = 0; i < sourceCount; i++) {
        if ((light_position[i][0] - point[0]) / vec[0]
            == (light_position[i][1] - point[1]) / vec[1]
            == (light_position[i][2] - point[2]) / vec[2]) 
        {
                r = sqrt((light_position[i][0] - point[0]) * (light_position[i][0] - point[0])
                    + (light_position[i][1] - point[1]) * (light_position[i][1] - point[1])
                    + (light_position[i][2] - point[2]) * (light_position[i][2] - point[2]));

            if (r < l ) {
                inter[0] = light_position[i][0];
                inter[1] = light_position[i][1];
                inter[2] = light_position[i][2];
                l = r;
                st = -2 - i;
            }
        }
    }

    return st;
}