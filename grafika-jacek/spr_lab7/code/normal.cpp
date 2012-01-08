void Normal(int sphere)
{
    //normal vector for sphere : [x - x0, y - y0, z - z0]
    for(int i=0; i<3; i++)
    {
        normalVector[i] = inter[i] - sphere_pos[sphere][i];
    }
    Normalization(normalVector);
}