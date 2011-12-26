GLbyte *LoadTGAImage(const char *FileName, GLint *ImWidth, GLint *ImHeight, GLint *ImComponents, GLenum *ImFormat)
{
    #pragma pack(1)           
    typedef struct                       
    {
        GLbyte    idlength;             
        GLbyte    colormaptype;          
        GLbyte    datatypecode;            
        unsigned short    colormapstart; 
        unsigned short    colormaplength;
        unsigned char     colormapdepth;  
        unsigned short    x_orgin;        
        unsigned short    y_orgin;        
        unsigned short    width;         
        unsigned short    height;        
        GLbyte    bitsperpixel;                  
        GLbyte    descriptor;            
    }TGAHEADER;
    #pragma pack(8)


    FILE *pFile;                   
    TGAHEADER tgaHeader;           
    unsigned long lImageSize;       
    short sDepth;                   
    GLbyte    *pbitsperpixel = NULL; 

    *ImWidth = 0;               
    *ImHeight = 0;
    *ImFormat = GL_BGR_EXT;
    *ImComponents = GL_RGB8;

    pFile = fopen(FileName, "rb");
    if(pFile == NULL)
    return NULL;

    fread(&tgaHeader, sizeof(TGAHEADER), 1, pFile);
    
    *ImWidth = tgaHeader.width;
    *ImHeight = tgaHeader.height;
    sDepth = tgaHeader.bitsperpixel / 8;


    if(tgaHeader.bitsperpixel != 8 && tgaHeader.bitsperpixel != 24 && tgaHeader.bitsperpixel != 32)
        return NULL;
    lImageSize = tgaHeader.width * tgaHeader.height * sDepth;
    pbitsperpixel = (GLbyte*)malloc(lImageSize * sizeof(GLbyte));

    if(pbitsperpixel == NULL)
        return NULL;

    if(fread(pbitsperpixel, lImageSize, 1, pFile) != 1)
    {
        free(pbitsperpixel);
        return NULL;
    }

    switch(sDepth)
    {
        case 3:    
            *ImFormat = GL_BGR_EXT;
            *ImComponents = GL_RGB8;
            break;
        case 4:
            *ImFormat = GL_BGRA_EXT;
            *ImComponents = GL_RGBA8;
            break;
        case 1:
            *ImFormat = GL_LUMINANCE;
            *ImComponents = GL_LUMINANCE8;
            break;
    };
    
    fclose(pFile);
    return pbitsperpixel;
}