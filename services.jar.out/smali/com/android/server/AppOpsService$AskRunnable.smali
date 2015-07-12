.class final Lcom/android/server/AppOpsService$AskRunnable;
.super Ljava/lang/Object;
.source "AppOpsService.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/AppOpsService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "AskRunnable"
.end annotation


# instance fields
.field final code:I

.field final op:Lcom/android/server/AppOpsService$Op;

.field final packageName:Ljava/lang/String;

.field final request:Lcom/android/server/PermissionDialogReqQueue$PermissionDialogReq;

.field final synthetic this$0:Lcom/android/server/AppOpsService;

.field final uid:I


# direct methods
.method public constructor <init>(Lcom/android/server/AppOpsService;IILjava/lang/String;Lcom/android/server/AppOpsService$Op;Lcom/android/server/PermissionDialogReqQueue$PermissionDialogReq;)V
    .locals 0
    .param p2, "code"    # I
    .param p3, "uid"    # I
    .param p4, "packageName"    # Ljava/lang/String;
    .param p5, "op"    # Lcom/android/server/AppOpsService$Op;
    .param p6, "request"    # Lcom/android/server/PermissionDialogReqQueue$PermissionDialogReq;

    .prologue
    .line 1385
    iput-object p1, p0, Lcom/android/server/AppOpsService$AskRunnable;->this$0:Lcom/android/server/AppOpsService;

    .line 1386
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1387
    iput p2, p0, Lcom/android/server/AppOpsService$AskRunnable;->code:I

    .line 1388
    iput p3, p0, Lcom/android/server/AppOpsService$AskRunnable;->uid:I

    .line 1389
    iput-object p4, p0, Lcom/android/server/AppOpsService$AskRunnable;->packageName:Ljava/lang/String;

    .line 1390
    iput-object p5, p0, Lcom/android/server/AppOpsService$AskRunnable;->op:Lcom/android/server/AppOpsService$Op;

    .line 1391
    iput-object p6, p0, Lcom/android/server/AppOpsService$AskRunnable;->request:Lcom/android/server/PermissionDialogReqQueue$PermissionDialogReq;

    .line 1392
    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .prologue
    .line 1396
    iget-object v7, p0, Lcom/android/server/AppOpsService$AskRunnable;->this$0:Lcom/android/server/AppOpsService;

    monitor-enter v7

    .line 1397
    :try_start_0
    const-string v2, "AppOps"

    const-string v3, "Creating dialog box"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1398
    iget-object v2, p0, Lcom/android/server/AppOpsService$AskRunnable;->op:Lcom/android/server/AppOpsService$Op;

    iget-object v2, v2, Lcom/android/server/AppOpsService$Op;->dialogReqQueue:Lcom/android/server/PermissionDialogReqQueue;

    iget-object v3, p0, Lcom/android/server/AppOpsService$AskRunnable;->request:Lcom/android/server/PermissionDialogReqQueue$PermissionDialogReq;

    invoke-virtual {v2, v3}, Lcom/android/server/PermissionDialogReqQueue;->register(Lcom/android/server/PermissionDialogReqQueue$PermissionDialogReq;)V

    .line 1399
    iget-object v2, p0, Lcom/android/server/AppOpsService$AskRunnable;->op:Lcom/android/server/AppOpsService$Op;

    iget-object v2, v2, Lcom/android/server/AppOpsService$Op;->dialogReqQueue:Lcom/android/server/PermissionDialogReqQueue;

    invoke-virtual {v2}, Lcom/android/server/PermissionDialogReqQueue;->getDialog()Lcom/android/server/PermissionDialog;

    move-result-object v2

    if-nez v2, :cond_0

    .line 1400
    new-instance v1, Lcom/android/server/PermissionDialog;

    iget-object v2, p0, Lcom/android/server/AppOpsService$AskRunnable;->this$0:Lcom/android/server/AppOpsService;

    iget-object v2, v2, Lcom/android/server/AppOpsService;->mContext:Landroid/content/Context;

    iget-object v3, p0, Lcom/android/server/AppOpsService$AskRunnable;->this$0:Lcom/android/server/AppOpsService;

    iget v4, p0, Lcom/android/server/AppOpsService$AskRunnable;->code:I

    iget v5, p0, Lcom/android/server/AppOpsService$AskRunnable;->uid:I

    iget-object v6, p0, Lcom/android/server/AppOpsService$AskRunnable;->packageName:Ljava/lang/String;

    invoke-direct/range {v1 .. v6}, Lcom/android/server/PermissionDialog;-><init>(Landroid/content/Context;Lcom/android/server/AppOpsService;IILjava/lang/String;)V

    .line 1402
    .local v1, "d":Landroid/app/Dialog;
    iget-object v2, p0, Lcom/android/server/AppOpsService$AskRunnable;->op:Lcom/android/server/AppOpsService$Op;

    iget-object v3, v2, Lcom/android/server/AppOpsService$Op;->dialogReqQueue:Lcom/android/server/PermissionDialogReqQueue;

    move-object v0, v1

    check-cast v0, Lcom/android/server/PermissionDialog;

    move-object v2, v0

    invoke-virtual {v3, v2}, Lcom/android/server/PermissionDialogReqQueue;->setDialog(Lcom/android/server/PermissionDialog;)V

    .line 1403
    invoke-virtual {v1}, Landroid/app/Dialog;->show()V

    .line 1405
    .end local v1    # "d":Landroid/app/Dialog;
    :cond_0
    monitor-exit v7

    .line 1406
    return-void

    .line 1405
    :catchall_0
    move-exception v2

    monitor-exit v7
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method
