/****************************************************************************
 * copy.c
 *
 * CC50
 * Pset 5
 *
 * Copies a BMP piece by piece, just because.
 ***************************************************************************/
       
#include <stdio.h>
#include <stdlib.h>

#include "bmp.h"


int
main(int argc, char *argv[])
{
    // ensure proper usage
    if (argc != 4)
    {
        printf("Usage: resize f infile outfile\n");
        return 1;
    }

    // remember filenames
    float factor = atof(argv[1]);
    char *infile = argv[2];
    char *outfile = argv[3];

    // open input file 
    FILE *inptr = fopen(infile, "r");
    if (inptr == NULL)
    {
        printf("Could not open %s.\n", infile);
        return 2;
    }

    // open output file
    FILE *outptr = fopen(outfile, "w");
    if (outptr == NULL)
    {
        fclose(inptr);
        fprintf(stderr, "Could not create %s.\n", outfile);
        return 3;
    }

    // read infile's BITMAPFILEHEADER
    BITMAPFILEHEADER bf;
    fread(&bf, sizeof(BITMAPFILEHEADER), 1, inptr);


    // read infile's BITMAPINFOHEADER
    BITMAPINFOHEADER bi, ibi;
    fread(&bi, sizeof(BITMAPINFOHEADER), 1, inptr);
    ibi = bi;

    // ensure infile is (likely) a 24-bit uncompressed BMP 4.0
    if (bf.bfType != 0x4d42 || bf.bfOffBits != 54 || bi.biSize != 40 || 
        bi.biBitCount != 24 || bi.biCompression != 0)
    {
        fclose(outptr);
        fclose(inptr);
        fprintf(stderr, "Unsupported file format.\n");
        return 4;
    }

    int padding =  (4 - (bi.biWidth * sizeof(RGBTRIPLE)) % 4) % 4;

    // refactor width and height
    bi.biWidth *= factor;
    bi.biHeight *= factor;

    /*
    printf("Filename: %s\n", argv[2]);
    puts("");
    printf("BITMAPINFOHEADER:\nbiSize = %d\nbiWidth = %d\nbiHeight = %d\nbiPlanes = %d\nbiBitCount = %d\nbiCompression = %d\nbiSizeImage = %d\nbiXPelsPerMeter = %d\nbiYPelsPerMeter = %d\nbiClrUsed = %d\nbiClrImportant = %d\n", bi.biSize, bi.biWidth, bi.biHeight, bi.biPlanes, bi.biBitCount, bi.biCompression, bi.biSizeImage, bi.biXPelsPerMeter, bi.biYPelsPerMeter, bi.biClrUsed, bi.biClrImportant);
    puts("");
    printf("BITMAPFILEHEADER:\nbfType = %d\nbfSize = %d\nbfReserved1 = %d\nbfReserved2 = %d\nbfOffBits = %d\n", bf.bfType, bf.bfSize, bf.bfReserved1, bf.bfReserved2, bf.bfOffBits);
    puts("");
    printf("Output: %s\n", argv[3]);
    */

    // determine padding for scanlines
    int new_padding =  (4 - (bi.biWidth * sizeof(RGBTRIPLE)) % 4) % 4;

    // determine sizes for output image
    bi.biSizeImage = (bi.biWidth * sizeof(RGBTRIPLE) + new_padding) * abs(bi.biHeight);
    //bi.biSizeImage = (bi.biWidth * sizeof(RGBTRIPLE)) * abs(bi.biHeight);
    bf.bfSize = bi.biSizeImage + sizeof(BITMAPFILEHEADER) + sizeof(BITMAPINFOHEADER);

    // write outfile's BITMAPFILEHEADER
    fwrite(&bf, sizeof(BITMAPFILEHEADER), 1, outptr);

    // write outfile's BITMAPINFOHEADER
    fwrite(&bi, sizeof(BITMAPINFOHEADER), 1, outptr);

    // store image beginning
    //int imgBegin = ftell(outptr);

    // temporary storage
    RGBTRIPLE triple;
    RGBTRIPLE *sline = malloc(bi.biWidth * sizeof(RGBTRIPLE));

    // iterate over infile's scanlines
    for (int i = 0, biHeight = abs(ibi.biHeight); i < biHeight; i++)
    {
        // iterate over pixels in scanline
        for (int j = 0; j < ibi.biWidth; j++)
        {
            // read RGB triple from infile
            fread(&triple, sizeof(RGBTRIPLE), 1, inptr);

            for (int m = 0; m < factor; m++)
                sline[j * (int)factor + m] = triple;
        }

        fseek(inptr, padding, SEEK_CUR);

        for (int k = 0; k < factor; k++) {
            fwrite(sline, bi.biWidth * 3, 1, outptr);

            for (int l = 0; l < new_padding; l++)
                fputc(0x00, outptr);

        }

        
       // // write padding to outfile
       // for (int k = 0; k < new_padding; k++)
       //     fputc(0x00, outptr);

       // // skip over padding, if any
       // fseek(inptr, padding, SEEK_CUR);
            
    }

    free(sline);

    // close infile
    fclose(inptr);

    // close outfile
    fclose(outptr);

    // that's all folks
    return 0;
}
