.class public Lme/nereo/multi_image_selector/utils/TimeUtils;
.super Ljava/lang/Object;
.source "TimeUtils.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static formatPhotoDate(J)Ljava/lang/String;
    .locals 2
    .parameter "time"

    .prologue
    .line 23
    const-string v0, "yyyy-MM-dd"

    invoke-static {p0, p1, v0}, Lme/nereo/multi_image_selector/utils/TimeUtils;->timeFormat(JLjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static formatPhotoDate(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .parameter "path"

    .prologue
    .line 27
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 28
    .local v0, file:Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 29
    invoke-virtual {v0}, Ljava/io/File;->lastModified()J

    move-result-wide v2

    .line 30
    .local v2, time:J
    invoke-static {v2, v3}, Lme/nereo/multi_image_selector/utils/TimeUtils;->formatPhotoDate(J)Ljava/lang/String;

    move-result-object v1

    .line 32
    .end local v2           #time:J
    :goto_0
    return-object v1

    :cond_0
    const-string v1, "1970-01-01"

    goto :goto_0
.end method

.method public static timeFormat(JLjava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "timeMillis"
    .parameter "pattern"

    .prologue
    .line 18
    new-instance v0, Ljava/text/SimpleDateFormat;

    sget-object v1, Ljava/util/Locale;->CHINA:Ljava/util/Locale;

    invoke-direct {v0, p2, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 19
    .local v0, format:Ljava/text/SimpleDateFormat;
    new-instance v1, Ljava/util/Date;

    invoke-direct {v1, p0, p1}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
