.class public Lcom/mechat/nostra13/universalimageloader/core/decode/BaseImageDecoder;
.super Ljava/lang/Object;
.source "BaseImageDecoder.java"

# interfaces
.implements Lcom/mechat/nostra13/universalimageloader/core/decode/ImageDecoder;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mechat/nostra13/universalimageloader/core/decode/BaseImageDecoder$ExifInfo;,
        Lcom/mechat/nostra13/universalimageloader/core/decode/BaseImageDecoder$ImageFileInfo;
    }
.end annotation


# static fields
.field protected static final ERROR_CANT_DECODE_IMAGE:Ljava/lang/String; = "Image can\'t be decoded [%s]"

.field protected static final LOG_FLIP_IMAGE:Ljava/lang/String; = "Flip image horizontally [%s]"

.field protected static final LOG_ROTATE_IMAGE:Ljava/lang/String; = "Rotate image on %1$d\u00b0 [%2$s]"

.field protected static final LOG_SCALE_IMAGE:Ljava/lang/String; = "Scale subsampled image (%1$s) to %2$s (scale = %3$.5f) [%4$s]"

.field protected static final LOG_SUBSAMPLE_IMAGE:Ljava/lang/String; = "Subsample original image (%1$s) to %2$s (scale = %3$d) [%4$s]"


# instance fields
.field protected final loggingEnabled:Z


# direct methods
.method public constructor <init>(Z)V
    .locals 0
    .parameter "loggingEnabled"

    .prologue
    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    iput-boolean p1, p0, Lcom/mechat/nostra13/universalimageloader/core/decode/BaseImageDecoder;->loggingEnabled:Z

    .line 58
    return-void
.end method

.method private canDefineExifParams(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 2
    .parameter "imageUri"
    .parameter "mimeType"

    .prologue
    .line 114
    const-string v0, "image/jpeg"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p1}, Lcom/mechat/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->ofUri(Ljava/lang/String;)Lcom/mechat/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;

    move-result-object v0

    sget-object v1, Lcom/mechat/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->FILE:Lcom/mechat/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method protected considerExactScaleAndOrientatiton(Landroid/graphics/Bitmap;Lcom/mechat/nostra13/universalimageloader/core/decode/ImageDecodingInfo;IZ)Landroid/graphics/Bitmap;
    .locals 11
    .parameter "subsampledBitmap"
    .parameter "decodingInfo"
    .parameter "rotation"
    .parameter "flipHorizontal"

    .prologue
    .line 184
    new-instance v5, Landroid/graphics/Matrix;

    invoke-direct {v5}, Landroid/graphics/Matrix;-><init>()V

    .line 186
    .local v5, m:Landroid/graphics/Matrix;
    invoke-virtual {p2}, Lcom/mechat/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->getImageScaleType()Lcom/mechat/nostra13/universalimageloader/core/assist/ImageScaleType;

    move-result-object v9

    .line 187
    .local v9, scaleType:Lcom/mechat/nostra13/universalimageloader/core/assist/ImageScaleType;
    sget-object v0, Lcom/mechat/nostra13/universalimageloader/core/assist/ImageScaleType;->EXACTLY:Lcom/mechat/nostra13/universalimageloader/core/assist/ImageScaleType;

    if-eq v9, v0, :cond_0

    sget-object v0, Lcom/mechat/nostra13/universalimageloader/core/assist/ImageScaleType;->EXACTLY_STRETCHED:Lcom/mechat/nostra13/universalimageloader/core/assist/ImageScaleType;

    if-ne v9, v0, :cond_1

    .line 188
    :cond_0
    new-instance v10, Lcom/mechat/nostra13/universalimageloader/core/assist/ImageSize;

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    invoke-direct {v10, v0, v1, p3}, Lcom/mechat/nostra13/universalimageloader/core/assist/ImageSize;-><init>(III)V

    .line 189
    .local v10, srcSize:Lcom/mechat/nostra13/universalimageloader/core/assist/ImageSize;
    invoke-virtual {p2}, Lcom/mechat/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->getTargetSize()Lcom/mechat/nostra13/universalimageloader/core/assist/ImageSize;

    move-result-object v1

    .line 190
    invoke-virtual {p2}, Lcom/mechat/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->getViewScaleType()Lcom/mechat/nostra13/universalimageloader/core/assist/ViewScaleType;

    move-result-object v2

    sget-object v0, Lcom/mechat/nostra13/universalimageloader/core/assist/ImageScaleType;->EXACTLY_STRETCHED:Lcom/mechat/nostra13/universalimageloader/core/assist/ImageScaleType;

    if-ne v9, v0, :cond_5

    const/4 v0, 0x1

    .line 189
    :goto_0
    invoke-static {v10, v1, v2, v0}, Lcom/mechat/nostra13/universalimageloader/utils/ImageSizeUtils;->computeImageScale(Lcom/mechat/nostra13/universalimageloader/core/assist/ImageSize;Lcom/mechat/nostra13/universalimageloader/core/assist/ImageSize;Lcom/mechat/nostra13/universalimageloader/core/assist/ViewScaleType;Z)F

    move-result v8

    .line 191
    .local v8, scale:F
    const/high16 v0, 0x3f80

    invoke-static {v8, v0}, Ljava/lang/Float;->compare(FF)I

    move-result v0

    if-eqz v0, :cond_1

    .line 192
    invoke-virtual {v5, v8, v8}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 194
    iget-boolean v0, p0, Lcom/mechat/nostra13/universalimageloader/core/decode/BaseImageDecoder;->loggingEnabled:Z

    if-eqz v0, :cond_1

    .line 195
    const-string v0, "Scale subsampled image (%1$s) to %2$s (scale = %3$.5f) [%4$s]"

    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object v10, v1, v2

    const/4 v2, 0x1

    invoke-virtual {v10, v8}, Lcom/mechat/nostra13/universalimageloader/core/assist/ImageSize;->scale(F)Lcom/mechat/nostra13/universalimageloader/core/assist/ImageSize;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x2

    invoke-static {v8}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x3

    invoke-virtual {p2}, Lcom/mechat/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->getImageKey()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Lcom/mechat/nostra13/universalimageloader/utils/L;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 200
    .end local v8           #scale:F
    .end local v10           #srcSize:Lcom/mechat/nostra13/universalimageloader/core/assist/ImageSize;
    :cond_1
    if-eqz p4, :cond_2

    .line 201
    const/high16 v0, -0x4080

    const/high16 v1, 0x3f80

    invoke-virtual {v5, v0, v1}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 203
    iget-boolean v0, p0, Lcom/mechat/nostra13/universalimageloader/core/decode/BaseImageDecoder;->loggingEnabled:Z

    if-eqz v0, :cond_2

    const-string v0, "Flip image horizontally [%s]"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-virtual {p2}, Lcom/mechat/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->getImageKey()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Lcom/mechat/nostra13/universalimageloader/utils/L;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 206
    :cond_2
    if-eqz p3, :cond_3

    .line 207
    int-to-float v0, p3

    invoke-virtual {v5, v0}, Landroid/graphics/Matrix;->postRotate(F)Z

    .line 209
    iget-boolean v0, p0, Lcom/mechat/nostra13/universalimageloader/core/decode/BaseImageDecoder;->loggingEnabled:Z

    if-eqz v0, :cond_3

    const-string v0, "Rotate image on %1$d\u00b0 [%2$s]"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    invoke-virtual {p2}, Lcom/mechat/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->getImageKey()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Lcom/mechat/nostra13/universalimageloader/utils/L;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 212
    :cond_3
    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    .line 213
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    const/4 v6, 0x1

    move-object v0, p1

    .line 212
    invoke-static/range {v0 .. v6}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    move-result-object v7

    .line 214
    .local v7, finalBitmap:Landroid/graphics/Bitmap;
    if-eq v7, p1, :cond_4

    .line 215
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->recycle()V

    .line 217
    :cond_4
    return-object v7

    .line 190
    .end local v7           #finalBitmap:Landroid/graphics/Bitmap;
    .restart local v10       #srcSize:Lcom/mechat/nostra13/universalimageloader/core/assist/ImageSize;
    :cond_5
    const/4 v0, 0x0

    goto/16 :goto_0
.end method

.method public decode(Lcom/mechat/nostra13/universalimageloader/core/decode/ImageDecodingInfo;)Landroid/graphics/Bitmap;
    .locals 8
    .parameter "decodingInfo"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 74
    invoke-virtual {p0, p1}, Lcom/mechat/nostra13/universalimageloader/core/decode/BaseImageDecoder;->getImageStream(Lcom/mechat/nostra13/universalimageloader/core/decode/ImageDecodingInfo;)Ljava/io/InputStream;

    move-result-object v3

    .line 76
    .local v3, imageStream:Ljava/io/InputStream;
    :try_start_0
    invoke-virtual {p0, v3, p1}, Lcom/mechat/nostra13/universalimageloader/core/decode/BaseImageDecoder;->defineImageSizeAndRotation(Ljava/io/InputStream;Lcom/mechat/nostra13/universalimageloader/core/decode/ImageDecodingInfo;)Lcom/mechat/nostra13/universalimageloader/core/decode/BaseImageDecoder$ImageFileInfo;

    move-result-object v2

    .line 77
    .local v2, imageInfo:Lcom/mechat/nostra13/universalimageloader/core/decode/BaseImageDecoder$ImageFileInfo;
    invoke-virtual {p0, v3, p1}, Lcom/mechat/nostra13/universalimageloader/core/decode/BaseImageDecoder;->resetStream(Ljava/io/InputStream;Lcom/mechat/nostra13/universalimageloader/core/decode/ImageDecodingInfo;)Ljava/io/InputStream;

    move-result-object v3

    .line 78
    iget-object v4, v2, Lcom/mechat/nostra13/universalimageloader/core/decode/BaseImageDecoder$ImageFileInfo;->imageSize:Lcom/mechat/nostra13/universalimageloader/core/assist/ImageSize;

    invoke-virtual {p0, v4, p1}, Lcom/mechat/nostra13/universalimageloader/core/decode/BaseImageDecoder;->prepareDecodingOptions(Lcom/mechat/nostra13/universalimageloader/core/assist/ImageSize;Lcom/mechat/nostra13/universalimageloader/core/decode/ImageDecodingInfo;)Landroid/graphics/BitmapFactory$Options;

    move-result-object v1

    .line 79
    .local v1, decodingOptions:Landroid/graphics/BitmapFactory$Options;
    const/4 v4, 0x0

    invoke-static {v3, v4, v1}, Lcom/newrelic/agent/android/instrumentation/BitmapFactoryInstrumentation;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 81
    .local v0, decodedBitmap:Landroid/graphics/Bitmap;
    invoke-static {v3}, Lcom/mechat/nostra13/universalimageloader/utils/IoUtils;->closeSilently(Ljava/io/Closeable;)V

    .line 84
    if-nez v0, :cond_0

    .line 85
    const-string v4, "Image can\'t be decoded [%s]"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-virtual {p1}, Lcom/mechat/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->getImageKey()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Lcom/mechat/nostra13/universalimageloader/utils/L;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 90
    :goto_0
    return-object v0

    .line 80
    .end local v0           #decodedBitmap:Landroid/graphics/Bitmap;
    .end local v1           #decodingOptions:Landroid/graphics/BitmapFactory$Options;
    .end local v2           #imageInfo:Lcom/mechat/nostra13/universalimageloader/core/decode/BaseImageDecoder$ImageFileInfo;
    :catchall_0
    move-exception v4

    .line 81
    invoke-static {v3}, Lcom/mechat/nostra13/universalimageloader/utils/IoUtils;->closeSilently(Ljava/io/Closeable;)V

    .line 82
    throw v4

    .line 87
    .restart local v0       #decodedBitmap:Landroid/graphics/Bitmap;
    .restart local v1       #decodingOptions:Landroid/graphics/BitmapFactory$Options;
    .restart local v2       #imageInfo:Lcom/mechat/nostra13/universalimageloader/core/decode/BaseImageDecoder$ImageFileInfo;
    :cond_0
    iget-object v4, v2, Lcom/mechat/nostra13/universalimageloader/core/decode/BaseImageDecoder$ImageFileInfo;->exif:Lcom/mechat/nostra13/universalimageloader/core/decode/BaseImageDecoder$ExifInfo;

    iget v4, v4, Lcom/mechat/nostra13/universalimageloader/core/decode/BaseImageDecoder$ExifInfo;->rotation:I

    .line 88
    iget-object v5, v2, Lcom/mechat/nostra13/universalimageloader/core/decode/BaseImageDecoder$ImageFileInfo;->exif:Lcom/mechat/nostra13/universalimageloader/core/decode/BaseImageDecoder$ExifInfo;

    iget-boolean v5, v5, Lcom/mechat/nostra13/universalimageloader/core/decode/BaseImageDecoder$ExifInfo;->flipHorizontal:Z

    .line 87
    invoke-virtual {p0, v0, p1, v4, v5}, Lcom/mechat/nostra13/universalimageloader/core/decode/BaseImageDecoder;->considerExactScaleAndOrientatiton(Landroid/graphics/Bitmap;Lcom/mechat/nostra13/universalimageloader/core/decode/ImageDecodingInfo;IZ)Landroid/graphics/Bitmap;

    move-result-object v0

    goto :goto_0
.end method

.method protected defineExifOrientation(Ljava/lang/String;)Lcom/mechat/nostra13/universalimageloader/core/decode/BaseImageDecoder$ExifInfo;
    .locals 8
    .parameter "imageUri"

    .prologue
    const/4 v7, 0x1

    .line 118
    const/4 v4, 0x0

    .line 119
    .local v4, rotation:I
    const/4 v3, 0x0

    .line 121
    .local v3, flip:Z
    :try_start_0
    new-instance v1, Landroid/media/ExifInterface;

    sget-object v5, Lcom/mechat/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->FILE:Lcom/mechat/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;

    invoke-virtual {v5, p1}, Lcom/mechat/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->crop(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v1, v5}, Landroid/media/ExifInterface;-><init>(Ljava/lang/String;)V

    .line 122
    .local v1, exif:Landroid/media/ExifInterface;
    const-string v5, "Orientation"

    const/4 v6, 0x1

    invoke-virtual {v1, v5, v6}, Landroid/media/ExifInterface;->getAttributeInt(Ljava/lang/String;I)I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    .line 123
    .local v2, exifOrientation:I
    packed-switch v2, :pswitch_data_0

    .line 148
    .end local v1           #exif:Landroid/media/ExifInterface;
    .end local v2           #exifOrientation:I
    :goto_0
    new-instance v5, Lcom/mechat/nostra13/universalimageloader/core/decode/BaseImageDecoder$ExifInfo;

    invoke-direct {v5, v4, v3}, Lcom/mechat/nostra13/universalimageloader/core/decode/BaseImageDecoder$ExifInfo;-><init>(IZ)V

    return-object v5

    .line 125
    .restart local v1       #exif:Landroid/media/ExifInterface;
    .restart local v2       #exifOrientation:I
    :pswitch_0
    const/4 v3, 0x1

    .line 127
    :pswitch_1
    const/4 v4, 0x0

    .line 128
    goto :goto_0

    .line 130
    :pswitch_2
    const/4 v3, 0x1

    .line 132
    :pswitch_3
    const/16 v4, 0x5a

    .line 133
    goto :goto_0

    .line 135
    :pswitch_4
    const/4 v3, 0x1

    .line 137
    :pswitch_5
    const/16 v4, 0xb4

    .line 138
    goto :goto_0

    .line 140
    :pswitch_6
    const/4 v3, 0x1

    .line 142
    :pswitch_7
    const/16 v4, 0x10e

    goto :goto_0

    .line 145
    .end local v1           #exif:Landroid/media/ExifInterface;
    .end local v2           #exifOrientation:I
    :catch_0
    move-exception v0

    .line 146
    .local v0, e:Ljava/io/IOException;
    const-string v5, "Can\'t read EXIF tags from file [%s]"

    new-array v6, v7, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object p1, v6, v7

    invoke-static {v5, v6}, Lcom/mechat/nostra13/universalimageloader/utils/L;->w(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0

    .line 123
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_5
        :pswitch_4
        :pswitch_6
        :pswitch_3
        :pswitch_2
        :pswitch_7
    .end packed-switch
.end method

.method protected defineImageSizeAndRotation(Ljava/io/InputStream;Lcom/mechat/nostra13/universalimageloader/core/decode/ImageDecodingInfo;)Lcom/mechat/nostra13/universalimageloader/core/decode/BaseImageDecoder$ImageFileInfo;
    .locals 8
    .parameter "imageStream"
    .parameter "decodingInfo"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 99
    new-instance v2, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v2}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 100
    .local v2, options:Landroid/graphics/BitmapFactory$Options;
    const/4 v3, 0x1

    iput-boolean v3, v2, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 101
    const/4 v3, 0x0

    invoke-static {p1, v3, v2}, Lcom/newrelic/agent/android/instrumentation/BitmapFactoryInstrumentation;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 104
    invoke-virtual {p2}, Lcom/mechat/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->getImageUri()Ljava/lang/String;

    move-result-object v1

    .line 105
    .local v1, imageUri:Ljava/lang/String;
    invoke-virtual {p2}, Lcom/mechat/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->shouldConsiderExifParams()Z

    move-result v3

    if-eqz v3, :cond_0

    iget-object v3, v2, Landroid/graphics/BitmapFactory$Options;->outMimeType:Ljava/lang/String;

    invoke-direct {p0, v1, v3}, Lcom/mechat/nostra13/universalimageloader/core/decode/BaseImageDecoder;->canDefineExifParams(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 106
    invoke-virtual {p0, v1}, Lcom/mechat/nostra13/universalimageloader/core/decode/BaseImageDecoder;->defineExifOrientation(Ljava/lang/String;)Lcom/mechat/nostra13/universalimageloader/core/decode/BaseImageDecoder$ExifInfo;

    move-result-object v0

    .line 110
    .local v0, exif:Lcom/mechat/nostra13/universalimageloader/core/decode/BaseImageDecoder$ExifInfo;
    :goto_0
    new-instance v3, Lcom/mechat/nostra13/universalimageloader/core/decode/BaseImageDecoder$ImageFileInfo;

    new-instance v4, Lcom/mechat/nostra13/universalimageloader/core/assist/ImageSize;

    iget v5, v2, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    iget v6, v2, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    iget v7, v0, Lcom/mechat/nostra13/universalimageloader/core/decode/BaseImageDecoder$ExifInfo;->rotation:I

    invoke-direct {v4, v5, v6, v7}, Lcom/mechat/nostra13/universalimageloader/core/assist/ImageSize;-><init>(III)V

    invoke-direct {v3, v4, v0}, Lcom/mechat/nostra13/universalimageloader/core/decode/BaseImageDecoder$ImageFileInfo;-><init>(Lcom/mechat/nostra13/universalimageloader/core/assist/ImageSize;Lcom/mechat/nostra13/universalimageloader/core/decode/BaseImageDecoder$ExifInfo;)V

    return-object v3

    .line 108
    .end local v0           #exif:Lcom/mechat/nostra13/universalimageloader/core/decode/BaseImageDecoder$ExifInfo;
    :cond_0
    new-instance v0, Lcom/mechat/nostra13/universalimageloader/core/decode/BaseImageDecoder$ExifInfo;

    invoke-direct {v0}, Lcom/mechat/nostra13/universalimageloader/core/decode/BaseImageDecoder$ExifInfo;-><init>()V

    .restart local v0       #exif:Lcom/mechat/nostra13/universalimageloader/core/decode/BaseImageDecoder$ExifInfo;
    goto :goto_0
.end method

.method protected getImageStream(Lcom/mechat/nostra13/universalimageloader/core/decode/ImageDecodingInfo;)Ljava/io/InputStream;
    .locals 3
    .parameter "decodingInfo"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 94
    invoke-virtual {p1}, Lcom/mechat/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->getDownloader()Lcom/mechat/nostra13/universalimageloader/core/download/ImageDownloader;

    move-result-object v0

    invoke-virtual {p1}, Lcom/mechat/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->getImageUri()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/mechat/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->getExtraForDownloader()Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/mechat/nostra13/universalimageloader/core/download/ImageDownloader;->getStream(Ljava/lang/String;Ljava/lang/Object;)Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method

.method protected prepareDecodingOptions(Lcom/mechat/nostra13/universalimageloader/core/assist/ImageSize;Lcom/mechat/nostra13/universalimageloader/core/decode/ImageDecodingInfo;)Landroid/graphics/BitmapFactory$Options;
    .locals 9
    .parameter "imageSize"
    .parameter "decodingInfo"

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 152
    invoke-virtual {p2}, Lcom/mechat/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->getImageScaleType()Lcom/mechat/nostra13/universalimageloader/core/assist/ImageScaleType;

    move-result-object v3

    .line 154
    .local v3, scaleType:Lcom/mechat/nostra13/universalimageloader/core/assist/ImageScaleType;
    sget-object v7, Lcom/mechat/nostra13/universalimageloader/core/assist/ImageScaleType;->NONE:Lcom/mechat/nostra13/universalimageloader/core/assist/ImageScaleType;

    if-ne v3, v7, :cond_1

    .line 155
    const/4 v2, 0x1

    .line 163
    .local v2, scale:I
    :goto_0
    if-le v2, v5, :cond_0

    iget-boolean v7, p0, Lcom/mechat/nostra13/universalimageloader/core/decode/BaseImageDecoder;->loggingEnabled:Z

    if-eqz v7, :cond_0

    .line 164
    const-string v7, "Subsample original image (%1$s) to %2$s (scale = %3$d) [%4$s]"

    const/4 v8, 0x4

    new-array v8, v8, [Ljava/lang/Object;

    aput-object p1, v8, v6

    invoke-virtual {p1, v2}, Lcom/mechat/nostra13/universalimageloader/core/assist/ImageSize;->scaleDown(I)Lcom/mechat/nostra13/universalimageloader/core/assist/ImageSize;

    move-result-object v6

    aput-object v6, v8, v5

    const/4 v5, 0x2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v8, v5

    const/4 v5, 0x3

    invoke-virtual {p2}, Lcom/mechat/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->getImageKey()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v8, v5

    invoke-static {v7, v8}, Lcom/mechat/nostra13/universalimageloader/utils/L;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 167
    :cond_0
    invoke-virtual {p2}, Lcom/mechat/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->getDecodingOptions()Landroid/graphics/BitmapFactory$Options;

    move-result-object v0

    .line 168
    .local v0, decodingOptions:Landroid/graphics/BitmapFactory$Options;
    iput v2, v0, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 169
    return-object v0

    .line 156
    .end local v0           #decodingOptions:Landroid/graphics/BitmapFactory$Options;
    .end local v2           #scale:I
    :cond_1
    sget-object v7, Lcom/mechat/nostra13/universalimageloader/core/assist/ImageScaleType;->NONE_SAFE:Lcom/mechat/nostra13/universalimageloader/core/assist/ImageScaleType;

    if-ne v3, v7, :cond_2

    .line 157
    invoke-static {p1}, Lcom/mechat/nostra13/universalimageloader/utils/ImageSizeUtils;->computeMinImageSampleSize(Lcom/mechat/nostra13/universalimageloader/core/assist/ImageSize;)I

    move-result v2

    .line 158
    .restart local v2       #scale:I
    goto :goto_0

    .line 159
    .end local v2           #scale:I
    :cond_2
    invoke-virtual {p2}, Lcom/mechat/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->getTargetSize()Lcom/mechat/nostra13/universalimageloader/core/assist/ImageSize;

    move-result-object v4

    .line 160
    .local v4, targetSize:Lcom/mechat/nostra13/universalimageloader/core/assist/ImageSize;
    sget-object v7, Lcom/mechat/nostra13/universalimageloader/core/assist/ImageScaleType;->IN_SAMPLE_POWER_OF_2:Lcom/mechat/nostra13/universalimageloader/core/assist/ImageScaleType;

    if-ne v3, v7, :cond_3

    move v1, v5

    .line 161
    .local v1, powerOf2:Z
    :goto_1
    invoke-virtual {p2}, Lcom/mechat/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->getViewScaleType()Lcom/mechat/nostra13/universalimageloader/core/assist/ViewScaleType;

    move-result-object v7

    invoke-static {p1, v4, v7, v1}, Lcom/mechat/nostra13/universalimageloader/utils/ImageSizeUtils;->computeImageSampleSize(Lcom/mechat/nostra13/universalimageloader/core/assist/ImageSize;Lcom/mechat/nostra13/universalimageloader/core/assist/ImageSize;Lcom/mechat/nostra13/universalimageloader/core/assist/ViewScaleType;Z)I

    move-result v2

    .restart local v2       #scale:I
    goto :goto_0

    .end local v1           #powerOf2:Z
    .end local v2           #scale:I
    :cond_3
    move v1, v6

    .line 160
    goto :goto_1
.end method

.method protected resetStream(Ljava/io/InputStream;Lcom/mechat/nostra13/universalimageloader/core/decode/ImageDecodingInfo;)Ljava/io/InputStream;
    .locals 1
    .parameter "imageStream"
    .parameter "decodingInfo"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 174
    :try_start_0
    invoke-virtual {p1}, Ljava/io/InputStream;->reset()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 179
    :goto_0
    return-object p1

    .line 175
    :catch_0
    move-exception v0

    .line 176
    .local v0, e:Ljava/io/IOException;
    invoke-static {p1}, Lcom/mechat/nostra13/universalimageloader/utils/IoUtils;->closeSilently(Ljava/io/Closeable;)V

    .line 177
    invoke-virtual {p0, p2}, Lcom/mechat/nostra13/universalimageloader/core/decode/BaseImageDecoder;->getImageStream(Lcom/mechat/nostra13/universalimageloader/core/decode/ImageDecodingInfo;)Ljava/io/InputStream;

    move-result-object p1

    goto :goto_0
.end method
