.class final Lorg/eclipse/mat/snapshot/MultiplePathsFromGCRootsClassRecord$1;
.super Ljava/lang/Object;
.source "MultiplePathsFromGCRootsClassRecord.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/mat/snapshot/MultiplePathsFromGCRootsClassRecord;->getComparatorByNumberOfReferencedObjects()Ljava/util/Comparator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lorg/eclipse/mat/snapshot/MultiplePathsFromGCRootsClassRecord;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 138
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 138
    check-cast p1, Lorg/eclipse/mat/snapshot/MultiplePathsFromGCRootsClassRecord;

    .end local p1
    check-cast p2, Lorg/eclipse/mat/snapshot/MultiplePathsFromGCRootsClassRecord;

    .end local p2
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/mat/snapshot/MultiplePathsFromGCRootsClassRecord$1;->compare(Lorg/eclipse/mat/snapshot/MultiplePathsFromGCRootsClassRecord;Lorg/eclipse/mat/snapshot/MultiplePathsFromGCRootsClassRecord;)I

    move-result v0

    return v0
.end method

.method public compare(Lorg/eclipse/mat/snapshot/MultiplePathsFromGCRootsClassRecord;Lorg/eclipse/mat/snapshot/MultiplePathsFromGCRootsClassRecord;)I
    .locals 2
    .parameter "o1"
    .parameter "o2"

    .prologue
    .line 142
    #getter for: Lorg/eclipse/mat/snapshot/MultiplePathsFromGCRootsClassRecord;->paths:Ljava/util/List;
    invoke-static {p1}, Lorg/eclipse/mat/snapshot/MultiplePathsFromGCRootsClassRecord;->access$000(Lorg/eclipse/mat/snapshot/MultiplePathsFromGCRootsClassRecord;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    #getter for: Lorg/eclipse/mat/snapshot/MultiplePathsFromGCRootsClassRecord;->paths:Ljava/util/List;
    invoke-static {p2}, Lorg/eclipse/mat/snapshot/MultiplePathsFromGCRootsClassRecord;->access$000(Lorg/eclipse/mat/snapshot/MultiplePathsFromGCRootsClassRecord;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    const/4 v0, 0x1

    .line 144
    :goto_0
    return v0

    .line 143
    :cond_0
    #getter for: Lorg/eclipse/mat/snapshot/MultiplePathsFromGCRootsClassRecord;->paths:Ljava/util/List;
    invoke-static {p1}, Lorg/eclipse/mat/snapshot/MultiplePathsFromGCRootsClassRecord;->access$000(Lorg/eclipse/mat/snapshot/MultiplePathsFromGCRootsClassRecord;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    #getter for: Lorg/eclipse/mat/snapshot/MultiplePathsFromGCRootsClassRecord;->paths:Ljava/util/List;
    invoke-static {p2}, Lorg/eclipse/mat/snapshot/MultiplePathsFromGCRootsClassRecord;->access$000(Lorg/eclipse/mat/snapshot/MultiplePathsFromGCRootsClassRecord;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-le v0, v1, :cond_1

    const/4 v0, -0x1

    goto :goto_0

    .line 144
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method
