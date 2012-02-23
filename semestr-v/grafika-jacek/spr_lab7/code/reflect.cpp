void Reflect(float * v)
{
    //ref = 2 * cosx * normal vector - inv(v) 
    //=> cosx = (normal * inv(v)) / (|normal| * |inv(v)|)
    float inv[3] = {-v[0], -v[1], -v[2]};
    float cos = dotProduct(normalVector, inv);
    for(int i=0; i<3; i++)
    {
        ref[i] = 2 * cos * normalVector[i] - inv[i];
    }
    Normalization(ref);
}