void Phong(float * v, int which)
{
    float light_vec[3]; 
    float reflection_vector[3]; 
    float viewer_v[3] = {-v[0], -v[1], -v[2]}; 
    float n_dot_l, v_dot_r; 

    for(int i=0; i<3; i++)
    {
        inters_c[i] = 0.0;
    }

    for(int i=0; i<sourceCount; i++)
    {

        for(int j=0; j<3; j++)
        {
            light_vec[j] = light_position[i][j] - inter[j];
        }

        Normalization(light_vec); 
        n_dot_l = dotProduct(light_vec, normalVector);
        for(int j=0; j<3; j++)
        {
            reflection_vector[j] = 2*(n_dot_l)*normalVector[j] - light_vec[j];
        }

        Normalization(reflection_vector); 
        v_dot_r = dotProduct(reflection_vector, viewer_v);

        if(v_dot_r < 0) 
            v_dot_r = 0;

        if (n_dot_l > 0)
        {
            float x = sqrt((light_position[i][0] - inter[0])
                    * (light_position[i][0] - inter[0]) 
                    + (light_position[i][1] - inter[1])*(light_position[i][1] - inter[1]) 
                    + (light_position[i][2] - inter[2])*(light_position[i][2] - inter[2]));
            for(int j=0; j<3; j++)
            {
                inters_c[j] += (1.0/(1.0 + 0.01*x + 0.001*x*x)) 
                * (sphere_diffuse[which][j]*light_diffuse[i][j]*n_dot_l 
                + sphere_specular[which][j]*light_specular[i][j]
                * pow(double(v_dot_r), (double)sphere_specularhininess[which])) 
                + sphere_ambient[which][j]*light_ambient[i][j];
            }
        }
        else
        {
            for(int j=0; j<3; j++)
            {
                inters_c[j] += sphere_ambient[which][j]*global_a[j];
            }
        }
    }
}