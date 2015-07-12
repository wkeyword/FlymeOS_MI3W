.class public Lcom/android/internal/telephony/dataconnection/DctController;
.super Landroid/os/Handler;
.source "DctController.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/internal/telephony/dataconnection/DctController$DdsSwitchSerializerHandler;,
        Lcom/android/internal/telephony/dataconnection/DctController$SwitchInfo;,
        Lcom/android/internal/telephony/dataconnection/DctController$DataStateReceiver;
    }
.end annotation


# static fields
.field private static final DBG:Z = true

.field private static final EVENT_ALL_DATA_DISCONNECTED:I = 0x1

.field private static final EVENT_DELAYED_RETRY:I = 0x3

.field private static final EVENT_LEGACY_SET_DATA_SUBSCRIPTION:I = 0x4

.field private static final EVENT_PHONE1_DETACH:I = 0x1

.field private static final EVENT_PHONE1_RADIO_OFF:I = 0x5

.field private static final EVENT_PHONE2_DETACH:I = 0x2

.field private static final EVENT_PHONE2_RADIO_OFF:I = 0x6

.field private static final EVENT_PHONE3_DETACH:I = 0x3

.field private static final EVENT_PHONE3_RADIO_OFF:I = 0x7

.field private static final EVENT_PHONE4_DETACH:I = 0x4

.field private static final EVENT_PHONE4_RADIO_OFF:I = 0x8

.field private static final EVENT_SET_DATA_ALLOW_DONE:I = 0x2

.field private static final EVENT_START_DDS_SWITCH:I = 0x9

.field private static final LOG_TAG:Ljava/lang/String; = "DctController"

.field private static final PHONE_NONE:I = -0x1

.field private static sDctController:Lcom/android/internal/telephony/dataconnection/DctController;


# instance fields
.field private final ATTACH_RETRY_DELAY:I

.field private final MAX_RETRY_FOR_ATTACH:I

.field private mActivePhone:Lcom/android/internal/telephony/Phone;

.field private mApnTypes:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mContext:Landroid/content/Context;

.field private mCurrentDataPhone:I

.field private mDataStateChangedCallback:Lcom/android/internal/telephony/DefaultPhoneNotifier$IDataStateChangedCallback;

.field private mDataStateReceiver:Landroid/content/BroadcastReceiver;

.field private mDcSwitchAsyncChannel:[Lcom/android/internal/telephony/dataconnection/DcSwitchAsyncChannel;

.field private mDcSwitchState:[Lcom/android/internal/telephony/dataconnection/DcSwitchState;

.field private mDcSwitchStateHandler:[Landroid/os/Handler;

.field private mDdsSwitchPropService:Lcom/android/internal/util/AsyncChannel;

.field private mDdsSwitchSerializer:Lcom/android/internal/telephony/dataconnection/DctController$DdsSwitchSerializerHandler;

.field private mIsDdsSwitchCompleted:Z

.field private mNotifyDefaultDataSwitchInfo:Landroid/os/RegistrantList;

.field private mNotifyOnDemandDataSwitchInfo:Landroid/os/RegistrantList;

.field private mNotifyOnDemandPsAttach:Landroid/os/RegistrantList;

.field private mPhoneNum:I

.field private mPhones:[Lcom/android/internal/telephony/PhoneProxy;

.field private mRequestedDataPhone:I

.field private mRspHander:Landroid/os/Handler;

.field private mServicePowerOffFlag:[Z

.field private mSubController:Lcom/android/internal/telephony/SubscriptionController;


# direct methods
.method private constructor <init>([Lcom/android/internal/telephony/PhoneProxy;Landroid/os/Looper;)V
    .locals 12
    .param p1, "phones"    # [Lcom/android/internal/telephony/PhoneProxy;
    .param p2, "looper"    # Landroid/os/Looper;

    .prologue
    .line 253
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 79
    new-instance v7, Landroid/os/RegistrantList;

    invoke-direct {v7}, Landroid/os/RegistrantList;-><init>()V

    iput-object v7, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mNotifyDefaultDataSwitchInfo:Landroid/os/RegistrantList;

    .line 80
    new-instance v7, Landroid/os/RegistrantList;

    invoke-direct {v7}, Landroid/os/RegistrantList;-><init>()V

    iput-object v7, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mNotifyOnDemandDataSwitchInfo:Landroid/os/RegistrantList;

    .line 81
    new-instance v7, Landroid/os/RegistrantList;

    invoke-direct {v7}, Landroid/os/RegistrantList;-><init>()V

    iput-object v7, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mNotifyOnDemandPsAttach:Landroid/os/RegistrantList;

    .line 82
    invoke-static {}, Lcom/android/internal/telephony/SubscriptionController;->getInstance()Lcom/android/internal/telephony/SubscriptionController;

    move-result-object v7

    iput-object v7, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mSubController:Lcom/android/internal/telephony/SubscriptionController;

    .line 92
    new-instance v7, Ljava/util/HashSet;

    invoke-direct {v7}, Ljava/util/HashSet;-><init>()V

    iput-object v7, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mApnTypes:Ljava/util/HashSet;

    .line 99
    const/4 v7, -0x1

    iput v7, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mCurrentDataPhone:I

    .line 100
    const/4 v7, -0x1

    iput v7, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mRequestedDataPhone:I

    .line 103
    const/4 v7, 0x1

    iput-boolean v7, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mIsDdsSwitchCompleted:Z

    .line 105
    const/4 v7, 0x6

    iput v7, p0, Lcom/android/internal/telephony/dataconnection/DctController;->MAX_RETRY_FOR_ATTACH:I

    .line 106
    const/16 v7, 0x2710

    iput v7, p0, Lcom/android/internal/telephony/dataconnection/DctController;->ATTACH_RETRY_DELAY:I

    .line 108
    new-instance v7, Lcom/android/internal/telephony/dataconnection/DctController$1;

    invoke-direct {v7, p0}, Lcom/android/internal/telephony/dataconnection/DctController$1;-><init>(Lcom/android/internal/telephony/dataconnection/DctController;)V

    iput-object v7, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mRspHander:Landroid/os/Handler;

    .line 145
    new-instance v7, Lcom/android/internal/telephony/dataconnection/DctController$2;

    invoke-direct {v7, p0}, Lcom/android/internal/telephony/dataconnection/DctController$2;-><init>(Lcom/android/internal/telephony/dataconnection/DctController;)V

    iput-object v7, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mDataStateChangedCallback:Lcom/android/internal/telephony/DefaultPhoneNotifier$IDataStateChangedCallback;

    .line 254
    if-eqz p1, :cond_0

    array-length v7, p1

    if-nez v7, :cond_2

    .line 255
    :cond_0
    if-nez p1, :cond_1

    .line 256
    const-string v7, "DctController(phones): UNEXPECTED phones=null, ignore"

    invoke-static {v7}, Lcom/android/internal/telephony/dataconnection/DctController;->loge(Ljava/lang/String;)V

    .line 310
    :goto_0
    return-void

    .line 258
    :cond_1
    const-string v7, "DctController(phones): UNEXPECTED phones.length=0, ignore"

    invoke-static {v7}, Lcom/android/internal/telephony/dataconnection/DctController;->loge(Ljava/lang/String;)V

    goto :goto_0

    .line 262
    :cond_2
    array-length v7, p1

    iput v7, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mPhoneNum:I

    .line 263
    iget v7, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mPhoneNum:I

    new-array v7, v7, [Z

    iput-object v7, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mServicePowerOffFlag:[Z

    .line 264
    iput-object p1, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mPhones:[Lcom/android/internal/telephony/PhoneProxy;

    .line 266
    iget v7, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mPhoneNum:I

    new-array v7, v7, [Lcom/android/internal/telephony/dataconnection/DcSwitchState;

    iput-object v7, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mDcSwitchState:[Lcom/android/internal/telephony/dataconnection/DcSwitchState;

    .line 267
    iget v7, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mPhoneNum:I

    new-array v7, v7, [Lcom/android/internal/telephony/dataconnection/DcSwitchAsyncChannel;

    iput-object v7, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mDcSwitchAsyncChannel:[Lcom/android/internal/telephony/dataconnection/DcSwitchAsyncChannel;

    .line 268
    iget v7, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mPhoneNum:I

    new-array v7, v7, [Landroid/os/Handler;

    iput-object v7, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mDcSwitchStateHandler:[Landroid/os/Handler;

    .line 270
    iget-object v7, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mPhones:[Lcom/android/internal/telephony/PhoneProxy;

    const/4 v8, 0x0

    aget-object v7, v7, v8

    iput-object v7, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mActivePhone:Lcom/android/internal/telephony/Phone;

    .line 272
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    iget v7, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mPhoneNum:I

    if-ge v1, v7, :cond_4

    .line 273
    move v4, v1

    .line 274
    .local v4, "phoneId":I
    iget-object v7, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mServicePowerOffFlag:[Z

    const/4 v8, 0x1

    aput-boolean v8, v7, v1

    .line 275
    iget-object v7, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mDcSwitchState:[Lcom/android/internal/telephony/dataconnection/DcSwitchState;

    new-instance v8, Lcom/android/internal/telephony/dataconnection/DcSwitchState;

    iget-object v9, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mPhones:[Lcom/android/internal/telephony/PhoneProxy;

    aget-object v9, v9, v1

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "DcSwitchState-"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v8, v9, v10, v4}, Lcom/android/internal/telephony/dataconnection/DcSwitchState;-><init>(Lcom/android/internal/telephony/Phone;Ljava/lang/String;I)V

    aput-object v8, v7, v1

    .line 276
    iget-object v7, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mDcSwitchState:[Lcom/android/internal/telephony/dataconnection/DcSwitchState;

    aget-object v7, v7, v1

    invoke-virtual {v7}, Lcom/android/internal/telephony/dataconnection/DcSwitchState;->start()V

    .line 277
    iget-object v7, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mDcSwitchAsyncChannel:[Lcom/android/internal/telephony/dataconnection/DcSwitchAsyncChannel;

    new-instance v8, Lcom/android/internal/telephony/dataconnection/DcSwitchAsyncChannel;

    iget-object v9, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mDcSwitchState:[Lcom/android/internal/telephony/dataconnection/DcSwitchState;

    aget-object v9, v9, v1

    invoke-direct {v8, v9, v4}, Lcom/android/internal/telephony/dataconnection/DcSwitchAsyncChannel;-><init>(Lcom/android/internal/telephony/dataconnection/DcSwitchState;I)V

    aput-object v8, v7, v1

    .line 278
    iget-object v7, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mDcSwitchStateHandler:[Landroid/os/Handler;

    new-instance v8, Landroid/os/Handler;

    invoke-direct {v8}, Landroid/os/Handler;-><init>()V

    aput-object v8, v7, v1

    .line 280
    iget-object v7, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mDcSwitchAsyncChannel:[Lcom/android/internal/telephony/dataconnection/DcSwitchAsyncChannel;

    aget-object v7, v7, v1

    iget-object v8, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mPhones:[Lcom/android/internal/telephony/PhoneProxy;

    aget-object v8, v8, v1

    invoke-virtual {v8}, Lcom/android/internal/telephony/PhoneProxy;->getContext()Landroid/content/Context;

    move-result-object v8

    iget-object v9, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mDcSwitchStateHandler:[Landroid/os/Handler;

    aget-object v9, v9, v1

    iget-object v10, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mDcSwitchState:[Lcom/android/internal/telephony/dataconnection/DcSwitchState;

    aget-object v10, v10, v1

    invoke-virtual {v10}, Lcom/android/internal/telephony/dataconnection/DcSwitchState;->getHandler()Landroid/os/Handler;

    move-result-object v10

    invoke-virtual {v7, v8, v9, v10}, Lcom/android/internal/telephony/dataconnection/DcSwitchAsyncChannel;->fullyConnectSync(Landroid/content/Context;Landroid/os/Handler;Landroid/os/Handler;)I

    move-result v5

    .line 283
    .local v5, "status":I
    if-nez v5, :cond_3

    .line 284
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "DctController(phones): Connect success: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/android/internal/telephony/dataconnection/DctController;->logd(Ljava/lang/String;)V

    .line 289
    :goto_2
    iget-object v7, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mDcSwitchState:[Lcom/android/internal/telephony/dataconnection/DcSwitchState;

    aget-object v7, v7, v1

    iget-object v8, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mRspHander:Landroid/os/Handler;

    add-int/lit8 v9, v1, 0x1

    const/4 v10, 0x0

    invoke-virtual {v7, v8, v9, v10}, Lcom/android/internal/telephony/dataconnection/DcSwitchState;->registerForIdle(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 292
    iget-object v7, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mPhones:[Lcom/android/internal/telephony/PhoneProxy;

    aget-object v7, v7, v1

    invoke-virtual {v7}, Lcom/android/internal/telephony/PhoneProxy;->getActivePhone()Lcom/android/internal/telephony/Phone;

    move-result-object v3

    check-cast v3, Lcom/android/internal/telephony/PhoneBase;

    .line 293
    .local v3, "phoneBase":Lcom/android/internal/telephony/PhoneBase;
    iget-object v7, v3, Lcom/android/internal/telephony/PhoneBase;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    iget-object v8, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mRspHander:Landroid/os/Handler;

    add-int/lit8 v9, v1, 0x5

    const/4 v10, 0x0

    invoke-interface {v7, v8, v9, v10}, Lcom/android/internal/telephony/CommandsInterface;->registerForOffOrNotAvailable(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 272
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_1

    .line 286
    .end local v3    # "phoneBase":Lcom/android/internal/telephony/PhoneBase;
    :cond_3
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "DctController(phones): Could not connect to "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/android/internal/telephony/dataconnection/DctController;->loge(Ljava/lang/String;)V

    goto :goto_2

    .line 296
    .end local v4    # "phoneId":I
    .end local v5    # "status":I
    :cond_4
    iget-object v7, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mActivePhone:Lcom/android/internal/telephony/Phone;

    invoke-interface {v7}, Lcom/android/internal/telephony/Phone;->getContext()Landroid/content/Context;

    move-result-object v7

    iput-object v7, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mContext:Landroid/content/Context;

    .line 298
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 299
    .local v0, "filter":Landroid/content/IntentFilter;
    const-string v7, "android.intent.action.DATA_CONNECTION_FAILED"

    invoke-virtual {v0, v7}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 300
    const-string v7, "android.intent.action.SERVICE_STATE"

    invoke-virtual {v0, v7}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 302
    new-instance v7, Lcom/android/internal/telephony/dataconnection/DctController$DataStateReceiver;

    const/4 v8, 0x0

    invoke-direct {v7, p0, v8}, Lcom/android/internal/telephony/dataconnection/DctController$DataStateReceiver;-><init>(Lcom/android/internal/telephony/dataconnection/DctController;Lcom/android/internal/telephony/dataconnection/DctController$1;)V

    iput-object v7, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mDataStateReceiver:Landroid/content/BroadcastReceiver;

    .line 303
    iget-object v7, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mContext:Landroid/content/Context;

    iget-object v8, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mDataStateReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v7, v8, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    move-result-object v2

    .line 305
    .local v2, "intent":Landroid/content/Intent;
    new-instance v6, Landroid/os/HandlerThread;

    const-string v7, "DdsSwitchSerializer"

    invoke-direct {v6, v7}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 306
    .local v6, "t":Landroid/os/HandlerThread;
    invoke-virtual {v6}, Landroid/os/HandlerThread;->start()V

    .line 308
    new-instance v7, Lcom/android/internal/telephony/dataconnection/DctController$DdsSwitchSerializerHandler;

    invoke-virtual {v6}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v8

    invoke-direct {v7, p0, v8}, Lcom/android/internal/telephony/dataconnection/DctController$DdsSwitchSerializerHandler;-><init>(Lcom/android/internal/telephony/dataconnection/DctController;Landroid/os/Looper;)V

    iput-object v7, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mDdsSwitchSerializer:Lcom/android/internal/telephony/dataconnection/DctController$DdsSwitchSerializerHandler;

    goto/16 :goto_0
.end method

.method static synthetic access$000(Lcom/android/internal/telephony/dataconnection/DctController;)I
    .locals 1
    .param p0, "x0"    # Lcom/android/internal/telephony/dataconnection/DctController;

    .prologue
    .line 56
    iget v0, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mRequestedDataPhone:I

    return v0
.end method

.method static synthetic access$002(Lcom/android/internal/telephony/dataconnection/DctController;I)I
    .locals 0
    .param p0, "x0"    # Lcom/android/internal/telephony/dataconnection/DctController;
    .param p1, "x1"    # I

    .prologue
    .line 56
    iput p1, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mRequestedDataPhone:I

    return p1
.end method

.method static synthetic access$100(Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 56
    invoke-static {p0}, Lcom/android/internal/telephony/dataconnection/DctController;->logd(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1000(Lcom/android/internal/telephony/dataconnection/DctController;)Lcom/android/internal/telephony/SubscriptionController;
    .locals 1
    .param p0, "x0"    # Lcom/android/internal/telephony/dataconnection/DctController;

    .prologue
    .line 56
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mSubController:Lcom/android/internal/telephony/SubscriptionController;

    return-object v0
.end method

.method static synthetic access$1100(Lcom/android/internal/telephony/dataconnection/DctController;)Landroid/os/RegistrantList;
    .locals 1
    .param p0, "x0"    # Lcom/android/internal/telephony/dataconnection/DctController;

    .prologue
    .line 56
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mNotifyOnDemandDataSwitchInfo:Landroid/os/RegistrantList;

    return-object v0
.end method

.method static synthetic access$1200(Lcom/android/internal/telephony/dataconnection/DctController;)[Lcom/android/internal/telephony/PhoneProxy;
    .locals 1
    .param p0, "x0"    # Lcom/android/internal/telephony/dataconnection/DctController;

    .prologue
    .line 56
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mPhones:[Lcom/android/internal/telephony/PhoneProxy;

    return-object v0
.end method

.method static synthetic access$1300()Lcom/android/internal/telephony/dataconnection/DctController;
    .locals 1

    .prologue
    .line 56
    sget-object v0, Lcom/android/internal/telephony/dataconnection/DctController;->sDctController:Lcom/android/internal/telephony/dataconnection/DctController;

    return-object v0
.end method

.method static synthetic access$200(Lcom/android/internal/telephony/dataconnection/DctController;)I
    .locals 1
    .param p0, "x0"    # Lcom/android/internal/telephony/dataconnection/DctController;

    .prologue
    .line 56
    iget v0, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mCurrentDataPhone:I

    return v0
.end method

.method static synthetic access$202(Lcom/android/internal/telephony/dataconnection/DctController;I)I
    .locals 0
    .param p0, "x0"    # Lcom/android/internal/telephony/dataconnection/DctController;
    .param p1, "x1"    # I

    .prologue
    .line 56
    iput p1, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mCurrentDataPhone:I

    return p1
.end method

.method static synthetic access$300(Lcom/android/internal/telephony/dataconnection/DctController;)Ljava/util/HashSet;
    .locals 1
    .param p0, "x0"    # Lcom/android/internal/telephony/dataconnection/DctController;

    .prologue
    .line 56
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mApnTypes:Ljava/util/HashSet;

    return-object v0
.end method

.method static synthetic access$400(Lcom/android/internal/telephony/dataconnection/DctController;)[Lcom/android/internal/telephony/dataconnection/DcSwitchAsyncChannel;
    .locals 1
    .param p0, "x0"    # Lcom/android/internal/telephony/dataconnection/DctController;

    .prologue
    .line 56
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mDcSwitchAsyncChannel:[Lcom/android/internal/telephony/dataconnection/DcSwitchAsyncChannel;

    return-object v0
.end method

.method static synthetic access$500(Lcom/android/internal/telephony/dataconnection/DctController;)[Z
    .locals 1
    .param p0, "x0"    # Lcom/android/internal/telephony/dataconnection/DctController;

    .prologue
    .line 56
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mServicePowerOffFlag:[Z

    return-object v0
.end method

.method static synthetic access$600(Lcom/android/internal/telephony/dataconnection/DctController;)[Lcom/android/internal/telephony/dataconnection/DcSwitchState;
    .locals 1
    .param p0, "x0"    # Lcom/android/internal/telephony/dataconnection/DctController;

    .prologue
    .line 56
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mDcSwitchState:[Lcom/android/internal/telephony/dataconnection/DcSwitchState;

    return-object v0
.end method

.method static synthetic access$700(Lcom/android/internal/telephony/dataconnection/DctController;)I
    .locals 1
    .param p0, "x0"    # Lcom/android/internal/telephony/dataconnection/DctController;

    .prologue
    .line 56
    invoke-direct {p0}, Lcom/android/internal/telephony/dataconnection/DctController;->getDataConnectionFromSetting()I

    move-result v0

    return v0
.end method

.method static synthetic access$900(Lcom/android/internal/telephony/dataconnection/DctController;)Z
    .locals 1
    .param p0, "x0"    # Lcom/android/internal/telephony/dataconnection/DctController;

    .prologue
    .line 56
    iget-boolean v0, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mIsDdsSwitchCompleted:Z

    return v0
.end method

.method static synthetic access$902(Lcom/android/internal/telephony/dataconnection/DctController;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/android/internal/telephony/dataconnection/DctController;
    .param p1, "x1"    # Z

    .prologue
    .line 56
    iput-boolean p1, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mIsDdsSwitchCompleted:Z

    return p1
.end method

.method private doDetach(I)V
    .locals 4
    .param p1, "phoneId"    # I

    .prologue
    .line 515
    iget-object v2, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mPhones:[Lcom/android/internal/telephony/PhoneProxy;

    aget-object v2, v2, p1

    invoke-virtual {v2}, Lcom/android/internal/telephony/PhoneProxy;->getActivePhone()Lcom/android/internal/telephony/Phone;

    move-result-object v1

    .local v1, "phone":Lcom/android/internal/telephony/Phone;
    move-object v2, v1

    .line 516
    check-cast v2, Lcom/android/internal/telephony/PhoneBase;

    iget-object v0, v2, Lcom/android/internal/telephony/PhoneBase;->mDcTracker:Lcom/android/internal/telephony/dataconnection/DcTrackerBase;

    .line 517
    .local v0, "dcTracker":Lcom/android/internal/telephony/dataconnection/DcTrackerBase;
    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Lcom/android/internal/telephony/dataconnection/DcTrackerBase;->setDataAllowed(ZLandroid/os/Message;)V

    .line 518
    invoke-interface {v1}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v2

    const/4 v3, 0x2

    if-ne v2, v3, :cond_0

    .line 520
    const-string v2, "DDS switch"

    invoke-virtual {v0, v2}, Lcom/android/internal/telephony/dataconnection/DcTrackerBase;->cleanUpAllConnections(Ljava/lang/String;)V

    .line 522
    :cond_0
    return-void
.end method

.method private getDataConnectionFromSetting()I
    .locals 4

    .prologue
    .line 454
    iget-object v1, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mSubController:Lcom/android/internal/telephony/SubscriptionController;

    invoke-virtual {v1}, Lcom/android/internal/telephony/SubscriptionController;->getDefaultDataSubId()J

    move-result-wide v2

    .line 455
    .local v2, "subId":J
    invoke-static {v2, v3}, Landroid/telephony/SubscriptionManager;->getPhoneId(J)I

    move-result v0

    .line 456
    .local v0, "phoneId":I
    return v0
.end method

.method private getIccCardState(I)Lcom/android/internal/telephony/IccCardConstants$State;
    .locals 1
    .param p1, "phoneId"    # I

    .prologue
    .line 313
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mPhones:[Lcom/android/internal/telephony/PhoneProxy;

    aget-object v0, v0, p1

    invoke-virtual {v0}, Lcom/android/internal/telephony/PhoneProxy;->getIccCard()Lcom/android/internal/telephony/IccCard;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/internal/telephony/IccCard;->getState()Lcom/android/internal/telephony/IccCardConstants$State;

    move-result-object v0

    return-object v0
.end method

.method public static getInstance()Lcom/android/internal/telephony/dataconnection/DctController;
    .locals 2

    .prologue
    .line 237
    sget-object v0, Lcom/android/internal/telephony/dataconnection/DctController;->sDctController:Lcom/android/internal/telephony/dataconnection/DctController;

    if-nez v0, :cond_0

    .line 238
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "DCTrackerController.getInstance can\'t be called before makeDCTController()"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 241
    :cond_0
    sget-object v0, Lcom/android/internal/telephony/dataconnection/DctController;->sDctController:Lcom/android/internal/telephony/dataconnection/DctController;

    return-object v0
.end method

.method private informDefaultDdsToPropServ(I)V
    .locals 3
    .param p1, "defDdsPhoneId"    # I

    .prologue
    .line 556
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mDdsSwitchPropService:Lcom/android/internal/util/AsyncChannel;

    if-eqz v0, :cond_0

    .line 557
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Inform OemHookDDS service of current DDS = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/android/internal/telephony/dataconnection/DctController;->logd(Ljava/lang/String;)V

    .line 558
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mDdsSwitchPropService:Lcom/android/internal/util/AsyncChannel;

    const/4 v1, 0x1

    iget v2, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mPhoneNum:I

    invoke-virtual {v0, v1, p1, v2}, Lcom/android/internal/util/AsyncChannel;->sendMessageSynchronously(III)Landroid/os/Message;

    .line 560
    const-string v0, "OemHookDDS service finished"

    invoke-static {v0}, Lcom/android/internal/telephony/dataconnection/DctController;->logd(Ljava/lang/String;)V

    .line 565
    :goto_0
    return-void

    .line 562
    :cond_0
    const-string v0, "OemHookDds service not ready yet"

    invoke-static {v0}, Lcom/android/internal/telephony/dataconnection/DctController;->logd(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private isValidApnType(Ljava/lang/String;)Z
    .locals 1
    .param p1, "apnType"    # Ljava/lang/String;

    .prologue
    .line 438
    const-string v0, "default"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "mms"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "supl"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "dun"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "hipri"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "fota"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "ims"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "cbs"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 447
    :cond_0
    const/4 v0, 0x1

    .line 449
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isValidphoneId(I)Z
    .locals 1
    .param p1, "phoneId"    # I

    .prologue
    .line 434
    if-ltz p1, :cond_0

    iget v0, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mPhoneNum:I

    if-ge p1, v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static logd(Ljava/lang/String;)V
    .locals 3
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 464
    const-string v0, "DctController"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[DctController] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 465
    return-void
.end method

.method private static loge(Ljava/lang/String;)V
    .locals 3
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 472
    const-string v0, "DctController"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[DctController] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 473
    return-void
.end method

.method private static logv(Ljava/lang/String;)V
    .locals 3
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 460
    const-string v0, "DctController"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[DctController] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/telephony/Rlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 461
    return-void
.end method

.method private static logw(Ljava/lang/String;)V
    .locals 3
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 468
    const-string v0, "DctController"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[DctController] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/telephony/Rlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 469
    return-void
.end method

.method public static makeDctController([Lcom/android/internal/telephony/PhoneProxy;Landroid/os/Looper;)Lcom/android/internal/telephony/dataconnection/DctController;
    .locals 1
    .param p0, "phones"    # [Lcom/android/internal/telephony/PhoneProxy;
    .param p1, "looper"    # Landroid/os/Looper;

    .prologue
    .line 245
    sget-object v0, Lcom/android/internal/telephony/dataconnection/DctController;->sDctController:Lcom/android/internal/telephony/dataconnection/DctController;

    if-nez v0, :cond_0

    .line 246
    new-instance v0, Lcom/android/internal/telephony/dataconnection/DctController;

    invoke-direct {v0, p0, p1}, Lcom/android/internal/telephony/dataconnection/DctController;-><init>([Lcom/android/internal/telephony/PhoneProxy;Landroid/os/Looper;)V

    sput-object v0, Lcom/android/internal/telephony/dataconnection/DctController;->sDctController:Lcom/android/internal/telephony/dataconnection/DctController;

    .line 247
    invoke-static {}, Lcom/android/internal/telephony/dataconnection/DdsScheduler;->init()V

    .line 249
    :cond_0
    sget-object v0, Lcom/android/internal/telephony/dataconnection/DctController;->sDctController:Lcom/android/internal/telephony/dataconnection/DctController;

    return-object v0
.end method


# virtual methods
.method public declared-synchronized disableApnType(JLjava/lang/String;)I
    .locals 3
    .param p1, "subId"    # J
    .param p3, "type"    # Ljava/lang/String;

    .prologue
    .line 405
    monitor-enter p0

    :try_start_0
    invoke-static {p1, p2}, Landroid/telephony/SubscriptionManager;->getPhoneId(J)I

    move-result v0

    .line 407
    .local v0, "phoneId":I
    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/dataconnection/DctController;->isValidphoneId(I)Z

    move-result v1

    if-nez v1, :cond_1

    .line 408
    :cond_0
    const-string v1, "disableApnType(): with PHONE_NONE or Invalid PHONE ID"

    invoke-static {v1}, Lcom/android/internal/telephony/dataconnection/DctController;->logw(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 409
    const/4 v1, 0x3

    .line 413
    :goto_0
    monitor-exit p0

    return v1

    .line 411
    :cond_1
    :try_start_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "disableApnType():type="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ",phoneId="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ",powerOff="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mServicePowerOffFlag:[Z

    aget-boolean v2, v2, v0

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/android/internal/telephony/dataconnection/DctController;->logd(Ljava/lang/String;)V

    .line 413
    iget-object v1, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mDcSwitchAsyncChannel:[Lcom/android/internal/telephony/dataconnection/DcSwitchAsyncChannel;

    aget-object v1, v1, v0

    invoke-virtual {v1, p3}, Lcom/android/internal/telephony/dataconnection/DcSwitchAsyncChannel;->disconnectSync(Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v1

    goto :goto_0

    .line 405
    .end local v0    # "phoneId":I
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public doPsAttach(Landroid/net/NetworkRequest;)V
    .locals 14
    .param p1, "n"    # Landroid/net/NetworkRequest;

    .prologue
    const/4 v5, 0x1

    .line 568
    const-string v1, "DctController"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "doPsAttach for :"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 570
    iget-object v1, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mSubController:Lcom/android/internal/telephony/SubscriptionController;

    invoke-virtual {v1, p1}, Lcom/android/internal/telephony/SubscriptionController;->getSubIdFromNetworkRequest(Landroid/net/NetworkRequest;)J

    move-result-wide v12

    .line 572
    .local v12, "subId":J
    iget-object v1, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mSubController:Lcom/android/internal/telephony/SubscriptionController;

    invoke-virtual {v1, v12, v13}, Lcom/android/internal/telephony/SubscriptionController;->getPhoneId(J)I

    move-result v9

    .line 573
    .local v9, "phoneId":I
    iget-object v1, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mPhones:[Lcom/android/internal/telephony/PhoneProxy;

    aget-object v1, v1, v9

    invoke-virtual {v1}, Lcom/android/internal/telephony/PhoneProxy;->getActivePhone()Lcom/android/internal/telephony/Phone;

    move-result-object v8

    .line 574
    .local v8, "phone":Lcom/android/internal/telephony/Phone;
    check-cast v8, Lcom/android/internal/telephony/PhoneBase;

    .end local v8    # "phone":Lcom/android/internal/telephony/Phone;
    iget-object v6, v8, Lcom/android/internal/telephony/PhoneBase;->mDcTracker:Lcom/android/internal/telephony/dataconnection/DcTrackerBase;

    .line 578
    .local v6, "dcTracker":Lcom/android/internal/telephony/dataconnection/DcTrackerBase;
    new-instance v0, Lcom/android/internal/telephony/dataconnection/DctController$SwitchInfo;

    new-instance v1, Ljava/lang/Integer;

    invoke-direct {v1, v9}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/4 v4, 0x0

    move-object v1, p0

    move-object v3, p1

    invoke-direct/range {v0 .. v5}, Lcom/android/internal/telephony/dataconnection/DctController$SwitchInfo;-><init>(Lcom/android/internal/telephony/dataconnection/DctController;ILandroid/net/NetworkRequest;ZZ)V

    .line 580
    .local v0, "s":Lcom/android/internal/telephony/dataconnection/DctController$SwitchInfo;
    const/4 v1, 0x2

    invoke-static {p0, v1, v0}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v10

    .line 583
    .local v10, "psAttachDone":Landroid/os/Message;
    invoke-direct {p0}, Lcom/android/internal/telephony/dataconnection/DctController;->getDataConnectionFromSetting()I

    move-result v7

    .line 584
    .local v7, "defDdsPhoneId":I
    invoke-direct {p0, v7}, Lcom/android/internal/telephony/dataconnection/DctController;->informDefaultDdsToPropServ(I)V

    .line 585
    invoke-virtual {v6, v5, v10}, Lcom/android/internal/telephony/dataconnection/DcTrackerBase;->setDataAllowed(ZLandroid/os/Message;)V

    .line 586
    return-void
.end method

.method public doPsDetach()V
    .locals 10

    .prologue
    .line 593
    iget-object v7, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mSubController:Lcom/android/internal/telephony/SubscriptionController;

    invoke-virtual {v7}, Lcom/android/internal/telephony/SubscriptionController;->getCurrentDds()J

    move-result-wide v0

    .line 594
    .local v0, "currentDds":J
    iget-object v7, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mSubController:Lcom/android/internal/telephony/SubscriptionController;

    invoke-virtual {v7}, Lcom/android/internal/telephony/SubscriptionController;->getDefaultDataSubId()J

    move-result-wide v4

    .line 596
    .local v4, "defaultDds":J
    cmp-long v7, v0, v4

    if-nez v7, :cond_0

    .line 597
    const-string v7, "DctController"

    const-string v8, "PS DETACH on DDS sub is not allowed."

    invoke-static {v7, v8}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 608
    :goto_0
    return-void

    .line 600
    :cond_0
    const-string v7, "DctController"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "doPsDetach for sub:"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 602
    iget-object v7, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mSubController:Lcom/android/internal/telephony/SubscriptionController;

    iget-object v8, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mSubController:Lcom/android/internal/telephony/SubscriptionController;

    invoke-virtual {v8}, Lcom/android/internal/telephony/SubscriptionController;->getCurrentDds()J

    move-result-wide v8

    invoke-virtual {v7, v8, v9}, Lcom/android/internal/telephony/SubscriptionController;->getPhoneId(J)I

    move-result v6

    .line 605
    .local v6, "phoneId":I
    iget-object v7, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mPhones:[Lcom/android/internal/telephony/PhoneProxy;

    aget-object v7, v7, v6

    invoke-virtual {v7}, Lcom/android/internal/telephony/PhoneProxy;->getActivePhone()Lcom/android/internal/telephony/Phone;

    move-result-object v3

    .line 606
    .local v3, "phone":Lcom/android/internal/telephony/Phone;
    check-cast v3, Lcom/android/internal/telephony/PhoneBase;

    .end local v3    # "phone":Lcom/android/internal/telephony/Phone;
    iget-object v2, v3, Lcom/android/internal/telephony/PhoneBase;->mDcTracker:Lcom/android/internal/telephony/dataconnection/DcTrackerBase;

    .line 607
    .local v2, "dcTracker":Lcom/android/internal/telephony/dataconnection/DcTrackerBase;
    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-virtual {v2, v7, v8}, Lcom/android/internal/telephony/dataconnection/DcTrackerBase;->setDataAllowed(ZLandroid/os/Message;)V

    goto :goto_0
.end method

.method public declared-synchronized enableApnType(JLjava/lang/String;)I
    .locals 9
    .param p1, "subId"    # J
    .param p3, "type"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x3

    const/4 v7, -0x1

    .line 329
    monitor-enter p0

    :try_start_0
    invoke-static {p1, p2}, Landroid/telephony/SubscriptionManager;->getPhoneId(J)I

    move-result v3

    .line 331
    .local v3, "phoneId":I
    if-eq v3, v7, :cond_0

    invoke-direct {p0, v3}, Lcom/android/internal/telephony/dataconnection/DctController;->isValidphoneId(I)Z

    move-result v5

    if-nez v5, :cond_1

    .line 332
    :cond_0
    const-string v5, "enableApnType(): with PHONE_NONE or Invalid PHONE ID"

    invoke-static {v5}, Lcom/android/internal/telephony/dataconnection/DctController;->logw(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 388
    :goto_0
    monitor-exit p0

    return v4

    .line 336
    :cond_1
    :try_start_1
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "enableApnType():type="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ",phoneId="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ",powerOff="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mServicePowerOffFlag:[Z

    aget-boolean v6, v6, v3

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/android/internal/telephony/dataconnection/DctController;->logd(Ljava/lang/String;)V

    .line 339
    const-string v5, "default"

    invoke-virtual {v5, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_5

    .line 340
    const/4 v2, 0x0

    .local v2, "peerphoneId":I
    :goto_1
    iget v5, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mPhoneNum:I

    if-ge v2, v5, :cond_5

    .line 342
    if-ne v3, v2, :cond_3

    .line 340
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 346
    :cond_3
    iget-object v5, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mPhones:[Lcom/android/internal/telephony/PhoneProxy;

    aget-object v5, v5, v2

    invoke-virtual {v5}, Lcom/android/internal/telephony/PhoneProxy;->getActiveApnTypes()[Ljava/lang/String;

    move-result-object v0

    .line 347
    .local v0, "activeApnTypes":[Ljava/lang/String;
    if-eqz v0, :cond_2

    array-length v5, v0

    if-eqz v5, :cond_2

    .line 348
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_2
    array-length v5, v0

    if-ge v1, v5, :cond_2

    .line 349
    const-string v5, "default"

    aget-object v6, v0, v1

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_4

    iget-object v5, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mPhones:[Lcom/android/internal/telephony/PhoneProxy;

    aget-object v5, v5, v2

    aget-object v6, v0, v1

    invoke-virtual {v5, v6}, Lcom/android/internal/telephony/PhoneProxy;->getDataConnectionState(Ljava/lang/String;)Lcom/android/internal/telephony/PhoneConstants$DataState;

    move-result-object v5

    sget-object v6, Lcom/android/internal/telephony/PhoneConstants$DataState;->DISCONNECTED:Lcom/android/internal/telephony/PhoneConstants$DataState;

    if-eq v5, v6, :cond_4

    .line 352
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "enableApnType:Peer Phone still have non-default active APN type:activeApnTypes["

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "]="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    aget-object v6, v0, v1

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/android/internal/telephony/dataconnection/DctController;->logd(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto/16 :goto_0

    .line 329
    .end local v0    # "activeApnTypes":[Ljava/lang/String;
    .end local v1    # "i":I
    .end local v2    # "peerphoneId":I
    .end local v3    # "phoneId":I
    :catchall_0
    move-exception v4

    monitor-exit p0

    throw v4

    .line 348
    .restart local v0    # "activeApnTypes":[Ljava/lang/String;
    .restart local v1    # "i":I
    .restart local v2    # "peerphoneId":I
    .restart local v3    # "phoneId":I
    :cond_4
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 361
    .end local v0    # "activeApnTypes":[Ljava/lang/String;
    .end local v1    # "i":I
    .end local v2    # "peerphoneId":I
    :cond_5
    :try_start_2
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "enableApnType(): CurrentDataPhone="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mCurrentDataPhone:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", RequestedDataPhone="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mRequestedDataPhone:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/android/internal/telephony/dataconnection/DctController;->logd(Ljava/lang/String;)V

    .line 364
    iget v4, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mCurrentDataPhone:I

    if-ne v3, v4, :cond_6

    iget-object v4, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mDcSwitchAsyncChannel:[Lcom/android/internal/telephony/dataconnection/DcSwitchAsyncChannel;

    iget v5, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mCurrentDataPhone:I

    aget-object v4, v4, v5

    invoke-virtual {v4}, Lcom/android/internal/telephony/dataconnection/DcSwitchAsyncChannel;->isIdleOrDeactingSync()Z

    move-result v4

    if-nez v4, :cond_6

    .line 366
    const/4 v4, -0x1

    iput v4, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mRequestedDataPhone:I

    .line 367
    const-string v4, "enableApnType(): mRequestedDataPhone equals request PHONE ID."

    invoke-static {v4}, Lcom/android/internal/telephony/dataconnection/DctController;->logd(Ljava/lang/String;)V

    .line 368
    iget-object v4, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mDcSwitchAsyncChannel:[Lcom/android/internal/telephony/dataconnection/DcSwitchAsyncChannel;

    aget-object v4, v4, v3

    invoke-virtual {v4, p3}, Lcom/android/internal/telephony/dataconnection/DcSwitchAsyncChannel;->connectSync(Ljava/lang/String;)I

    move-result v4

    goto/16 :goto_0

    .line 372
    :cond_6
    iget v4, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mCurrentDataPhone:I

    if-ne v4, v7, :cond_7

    .line 373
    iput v3, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mCurrentDataPhone:I

    .line 374
    const/4 v4, -0x1

    iput v4, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mRequestedDataPhone:I

    .line 375
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "enableApnType(): current PHONE is NONE or IDLE, mCurrentDataPhone="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mCurrentDataPhone:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/android/internal/telephony/dataconnection/DctController;->logd(Ljava/lang/String;)V

    .line 377
    iget-object v4, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mDcSwitchAsyncChannel:[Lcom/android/internal/telephony/dataconnection/DcSwitchAsyncChannel;

    aget-object v4, v4, v3

    invoke-virtual {v4, p3}, Lcom/android/internal/telephony/dataconnection/DcSwitchAsyncChannel;->connectSync(Ljava/lang/String;)I

    move-result v4

    goto/16 :goto_0

    .line 379
    :cond_7
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "enableApnType(): current PHONE:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mCurrentDataPhone:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " is active."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/android/internal/telephony/dataconnection/DctController;->logd(Ljava/lang/String;)V

    .line 380
    iget v4, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mRequestedDataPhone:I

    if-eq v3, v4, :cond_8

    .line 381
    iget-object v4, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mApnTypes:Ljava/util/HashSet;

    invoke-virtual {v4}, Ljava/util/HashSet;->clear()V

    .line 383
    :cond_8
    iget-object v4, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mApnTypes:Ljava/util/HashSet;

    invoke-virtual {v4, p3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 384
    iput v3, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mRequestedDataPhone:I

    .line 385
    iget-object v4, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mDcSwitchState:[Lcom/android/internal/telephony/dataconnection/DcSwitchState;

    iget v5, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mCurrentDataPhone:I

    aget-object v4, v4, v5

    invoke-virtual {v4}, Lcom/android/internal/telephony/dataconnection/DcSwitchState;->cleanupAllConnection()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 388
    const/4 v4, 0x1

    goto/16 :goto_0
.end method

.method public getDataStateChangedCallback()Lcom/android/internal/telephony/DefaultPhoneNotifier$IDataStateChangedCallback;
    .locals 1

    .prologue
    .line 233
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mDataStateChangedCallback:Lcom/android/internal/telephony/DefaultPhoneNotifier$IDataStateChangedCallback;

    return-object v0
.end method

.method public handleMessage(Landroid/os/Message;)V
    .locals 18
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 645
    const/4 v6, 0x0

    .line 646
    .local v6, "isLegacySetDds":Z
    const-string v13, "DctController"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "handleMessage msg="

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p1

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 648
    move-object/from16 v0, p1

    iget v13, v0, Landroid/os/Message;->what:I

    sparse-switch v13, :sswitch_data_0

    .line 752
    :goto_0
    return-void

    .line 650
    :sswitch_0
    const/4 v6, 0x1

    .line 653
    :sswitch_1
    move-object/from16 v0, p1

    iget-object v3, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v3, Landroid/os/AsyncResult;

    .line 654
    .local v3, "ar":Landroid/os/AsyncResult;
    iget-object v11, v3, Landroid/os/AsyncResult;->userObj:Ljava/lang/Object;

    check-cast v11, Lcom/android/internal/telephony/dataconnection/DctController$SwitchInfo;

    .line 655
    .local v11, "s":Lcom/android/internal/telephony/dataconnection/DctController$SwitchInfo;
    iget v13, v11, Lcom/android/internal/telephony/dataconnection/DctController$SwitchInfo;->mPhoneId:I

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    .line 656
    .local v8, "phoneId":Ljava/lang/Integer;
    const-string v13, "DctController"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "EVENT_ALL_DATA_DISCONNECTED switchInfo :"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, " isLegacySetDds = "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 660
    if-nez v6, :cond_0

    .line 661
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/internal/telephony/dataconnection/DctController;->mSubController:Lcom/android/internal/telephony/SubscriptionController;

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/internal/telephony/dataconnection/DctController;->mSubController:Lcom/android/internal/telephony/SubscriptionController;

    invoke-virtual {v14}, Lcom/android/internal/telephony/SubscriptionController;->getCurrentDds()J

    move-result-wide v14

    invoke-virtual {v13, v14, v15}, Lcom/android/internal/telephony/SubscriptionController;->getPhoneId(J)I

    move-result v9

    .line 663
    .local v9, "prefPhoneId":I
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/internal/telephony/dataconnection/DctController;->mPhones:[Lcom/android/internal/telephony/PhoneProxy;

    aget-object v13, v13, v9

    move-object/from16 v0, p0

    invoke-virtual {v13, v0}, Lcom/android/internal/telephony/PhoneProxy;->unregisterForAllDataDisconnected(Landroid/os/Handler;)V

    .line 665
    .end local v9    # "prefPhoneId":I
    :cond_0
    const/4 v13, 0x2

    move-object/from16 v0, p0

    invoke-static {v0, v13, v11}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v2

    .line 667
    .local v2, "allowedDataDone":Landroid/os/Message;
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/internal/telephony/dataconnection/DctController;->mPhones:[Lcom/android/internal/telephony/PhoneProxy;

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v14

    aget-object v13, v13, v14

    invoke-virtual {v13}, Lcom/android/internal/telephony/PhoneProxy;->getActivePhone()Lcom/android/internal/telephony/Phone;

    move-result-object v7

    .line 669
    .local v7, "phone":Lcom/android/internal/telephony/Phone;
    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v13

    move-object/from16 v0, p0

    invoke-direct {v0, v13}, Lcom/android/internal/telephony/dataconnection/DctController;->informDefaultDdsToPropServ(I)V

    .line 671
    check-cast v7, Lcom/android/internal/telephony/PhoneBase;

    .end local v7    # "phone":Lcom/android/internal/telephony/Phone;
    iget-object v4, v7, Lcom/android/internal/telephony/PhoneBase;->mDcTracker:Lcom/android/internal/telephony/dataconnection/DcTrackerBase;

    .line 672
    .local v4, "dcTracker":Lcom/android/internal/telephony/dataconnection/DcTrackerBase;
    const/4 v13, 0x1

    invoke-virtual {v4, v13, v2}, Lcom/android/internal/telephony/dataconnection/DcTrackerBase;->setDataAllowed(ZLandroid/os/Message;)V

    goto :goto_0

    .line 678
    .end local v2    # "allowedDataDone":Landroid/os/Message;
    .end local v3    # "ar":Landroid/os/AsyncResult;
    .end local v4    # "dcTracker":Lcom/android/internal/telephony/dataconnection/DcTrackerBase;
    .end local v8    # "phoneId":Ljava/lang/Integer;
    .end local v11    # "s":Lcom/android/internal/telephony/dataconnection/DctController$SwitchInfo;
    :sswitch_2
    const-string v13, "DctController"

    const-string v14, "EVENT_DELAYED_RETRY"

    invoke-static {v13, v14}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 679
    move-object/from16 v0, p1

    iget-object v11, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v11, Lcom/android/internal/telephony/dataconnection/DctController$SwitchInfo;

    .line 680
    .restart local v11    # "s":Lcom/android/internal/telephony/dataconnection/DctController$SwitchInfo;
    const-string v13, "DctController"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, " Retry, switchInfo = "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 682
    iget v13, v11, Lcom/android/internal/telephony/dataconnection/DctController$SwitchInfo;->mPhoneId:I

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    .line 683
    .restart local v8    # "phoneId":Ljava/lang/Integer;
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/internal/telephony/dataconnection/DctController;->mSubController:Lcom/android/internal/telephony/SubscriptionController;

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v14

    invoke-virtual {v13, v14}, Lcom/android/internal/telephony/SubscriptionController;->getSubId(I)[J

    move-result-object v12

    .line 685
    .local v12, "subId":[J
    const/4 v13, 0x2

    move-object/from16 v0, p0

    invoke-static {v0, v13, v11}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v10

    .line 687
    .local v10, "psAttachDone":Landroid/os/Message;
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/internal/telephony/dataconnection/DctController;->mPhones:[Lcom/android/internal/telephony/PhoneProxy;

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v14

    aget-object v13, v13, v14

    invoke-virtual {v13}, Lcom/android/internal/telephony/PhoneProxy;->getActivePhone()Lcom/android/internal/telephony/Phone;

    move-result-object v7

    .line 688
    .restart local v7    # "phone":Lcom/android/internal/telephony/Phone;
    check-cast v7, Lcom/android/internal/telephony/PhoneBase;

    .end local v7    # "phone":Lcom/android/internal/telephony/Phone;
    iget-object v4, v7, Lcom/android/internal/telephony/PhoneBase;->mDcTracker:Lcom/android/internal/telephony/dataconnection/DcTrackerBase;

    .line 689
    .restart local v4    # "dcTracker":Lcom/android/internal/telephony/dataconnection/DcTrackerBase;
    const/4 v13, 0x1

    invoke-virtual {v4, v13, v10}, Lcom/android/internal/telephony/dataconnection/DcTrackerBase;->setDataAllowed(ZLandroid/os/Message;)V

    goto/16 :goto_0

    .line 694
    .end local v4    # "dcTracker":Lcom/android/internal/telephony/dataconnection/DcTrackerBase;
    .end local v8    # "phoneId":Ljava/lang/Integer;
    .end local v10    # "psAttachDone":Landroid/os/Message;
    .end local v11    # "s":Lcom/android/internal/telephony/dataconnection/DctController$SwitchInfo;
    .end local v12    # "subId":[J
    :sswitch_3
    move-object/from16 v0, p1

    iget-object v3, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v3, Landroid/os/AsyncResult;

    .line 695
    .restart local v3    # "ar":Landroid/os/AsyncResult;
    iget-object v11, v3, Landroid/os/AsyncResult;->userObj:Ljava/lang/Object;

    check-cast v11, Lcom/android/internal/telephony/dataconnection/DctController$SwitchInfo;

    .line 697
    .restart local v11    # "s":Lcom/android/internal/telephony/dataconnection/DctController$SwitchInfo;
    const/4 v5, 0x0

    .line 699
    .local v5, "errorEx":Ljava/lang/Exception;
    iget v13, v11, Lcom/android/internal/telephony/dataconnection/DctController$SwitchInfo;->mPhoneId:I

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    .line 700
    .restart local v8    # "phoneId":Ljava/lang/Integer;
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/internal/telephony/dataconnection/DctController;->mSubController:Lcom/android/internal/telephony/SubscriptionController;

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v14

    invoke-virtual {v13, v14}, Lcom/android/internal/telephony/SubscriptionController;->getSubId(I)[J

    move-result-object v12

    .line 701
    .restart local v12    # "subId":[J
    const-string v13, "DctController"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "EVENT_SET_DATA_ALLOWED_DONE  phoneId :"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const/4 v15, 0x0

    aget-wide v16, v12, v15

    move-wide/from16 v0, v16

    invoke-virtual {v14, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, ", switchInfo = "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 704
    iget-object v13, v3, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v13, :cond_2

    .line 705
    const-string v13, "DctController"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Failed, switchInfo = "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, " attempt delayed retry"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 707
    invoke-virtual {v11}, Lcom/android/internal/telephony/dataconnection/DctController$SwitchInfo;->incRetryCount()V

    .line 708
    invoke-virtual {v11}, Lcom/android/internal/telephony/dataconnection/DctController$SwitchInfo;->isRetryPossible()Z

    move-result v13

    if-eqz v13, :cond_1

    .line 709
    const/4 v13, 0x3

    move-object/from16 v0, p0

    invoke-virtual {v0, v13, v11}, Lcom/android/internal/telephony/dataconnection/DctController;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v13

    const-wide/16 v14, 0x2710

    move-object/from16 v0, p0

    invoke-virtual {v0, v13, v14, v15}, Lcom/android/internal/telephony/dataconnection/DctController;->sendMessageDelayed(Landroid/os/Message;J)Z

    goto/16 :goto_0

    .line 713
    :cond_1
    const-string v13, "DctController"

    const-string v14, "Already did max retries, notify failure"

    invoke-static {v13, v14}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 714
    new-instance v5, Ljava/lang/RuntimeException;

    .end local v5    # "errorEx":Ljava/lang/Exception;
    const-string v13, "PS ATTACH failed"

    invoke-direct {v5, v13}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 720
    .restart local v5    # "errorEx":Ljava/lang/Exception;
    :goto_1
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/internal/telephony/dataconnection/DctController;->mDdsSwitchSerializer:Lcom/android/internal/telephony/dataconnection/DctController$DdsSwitchSerializerHandler;

    invoke-virtual {v13}, Lcom/android/internal/telephony/dataconnection/DctController$DdsSwitchSerializerHandler;->unLock()V

    .line 722
    iget-boolean v13, v11, Lcom/android/internal/telephony/dataconnection/DctController$SwitchInfo;->mIsDefaultDataSwitchRequested:Z

    if-eqz v13, :cond_3

    .line 723
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/internal/telephony/dataconnection/DctController;->mNotifyDefaultDataSwitchInfo:Landroid/os/RegistrantList;

    new-instance v14, Landroid/os/AsyncResult;

    const/4 v15, 0x0

    const/16 v16, 0x0

    aget-wide v16, v12, v16

    invoke-static/range {v16 .. v17}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-direct {v14, v15, v0, v5}, Landroid/os/AsyncResult;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    invoke-virtual {v13, v14}, Landroid/os/RegistrantList;->notifyRegistrants(Landroid/os/AsyncResult;)V

    goto/16 :goto_0

    .line 717
    :cond_2
    const-string v13, "DctController"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "PS ATTACH success = "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 725
    :cond_3
    iget-boolean v13, v11, Lcom/android/internal/telephony/dataconnection/DctController$SwitchInfo;->mIsOnDemandPsAttachRequested:Z

    if-eqz v13, :cond_4

    .line 726
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/internal/telephony/dataconnection/DctController;->mNotifyOnDemandPsAttach:Landroid/os/RegistrantList;

    new-instance v14, Landroid/os/AsyncResult;

    const/4 v15, 0x0

    iget-object v0, v11, Lcom/android/internal/telephony/dataconnection/DctController$SwitchInfo;->mNetworkRequest:Landroid/net/NetworkRequest;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-direct {v14, v15, v0, v5}, Landroid/os/AsyncResult;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    invoke-virtual {v13, v14}, Landroid/os/RegistrantList;->notifyRegistrants(Landroid/os/AsyncResult;)V

    goto/16 :goto_0

    .line 729
    :cond_4
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/internal/telephony/dataconnection/DctController;->mNotifyOnDemandDataSwitchInfo:Landroid/os/RegistrantList;

    new-instance v14, Landroid/os/AsyncResult;

    const/4 v15, 0x0

    iget-object v0, v11, Lcom/android/internal/telephony/dataconnection/DctController$SwitchInfo;->mNetworkRequest:Landroid/net/NetworkRequest;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-direct {v14, v15, v0, v5}, Landroid/os/AsyncResult;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    invoke-virtual {v13, v14}, Landroid/os/RegistrantList;->notifyRegistrants(Landroid/os/AsyncResult;)V

    goto/16 :goto_0

    .line 735
    .end local v3    # "ar":Landroid/os/AsyncResult;
    .end local v5    # "errorEx":Ljava/lang/Exception;
    .end local v8    # "phoneId":Ljava/lang/Integer;
    .end local v11    # "s":Lcom/android/internal/telephony/dataconnection/DctController$SwitchInfo;
    .end local v12    # "subId":[J
    :sswitch_4
    move-object/from16 v0, p1

    iget v13, v0, Landroid/os/Message;->arg1:I

    if-nez v13, :cond_5

    .line 736
    const-string v13, "HALF_CONNECTED: Connection successful with DDS switch service"

    invoke-static {v13}, Lcom/android/internal/telephony/dataconnection/DctController;->logd(Ljava/lang/String;)V

    .line 738
    move-object/from16 v0, p1

    iget-object v13, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v13, Lcom/android/internal/util/AsyncChannel;

    move-object/from16 v0, p0

    iput-object v13, v0, Lcom/android/internal/telephony/dataconnection/DctController;->mDdsSwitchPropService:Lcom/android/internal/util/AsyncChannel;

    goto/16 :goto_0

    .line 740
    :cond_5
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "HALF_CONNECTED: Connection failed with DDS switch service, err = "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-object/from16 v0, p1

    iget v14, v0, Landroid/os/Message;->arg1:I

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Lcom/android/internal/telephony/dataconnection/DctController;->logd(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 747
    :sswitch_5
    const-string v13, "Connection disconnected with DDS switch service"

    invoke-static {v13}, Lcom/android/internal/telephony/dataconnection/DctController;->logd(Ljava/lang/String;)V

    .line 748
    const/4 v13, 0x0

    move-object/from16 v0, p0

    iput-object v13, v0, Lcom/android/internal/telephony/dataconnection/DctController;->mDdsSwitchPropService:Lcom/android/internal/util/AsyncChannel;

    goto/16 :goto_0

    .line 648
    nop

    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_1
        0x2 -> :sswitch_3
        0x3 -> :sswitch_2
        0x4 -> :sswitch_0
        0x11000 -> :sswitch_4
        0x11004 -> :sswitch_5
    .end sparse-switch
.end method

.method isActiveSubId(J)Z
    .locals 5
    .param p1, "subId"    # J

    .prologue
    .line 158
    iget-object v2, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mSubController:Lcom/android/internal/telephony/SubscriptionController;

    invoke-virtual {v2}, Lcom/android/internal/telephony/SubscriptionController;->getActiveSubIdList()[J

    move-result-object v0

    .line 159
    .local v0, "activeSubs":[J
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_1

    .line 160
    aget-wide v2, v0, v1

    cmp-long v2, p1, v2

    if-nez v2, :cond_0

    .line 161
    const/4 v2, 0x1

    .line 164
    :goto_1
    return v2

    .line 159
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 164
    :cond_1
    const/4 v2, 0x0

    goto :goto_1
.end method

.method public isDataConnectivityPossible(Ljava/lang/String;I)Z
    .locals 1
    .param p1, "type"    # Ljava/lang/String;
    .param p2, "phoneId"    # I

    .prologue
    .line 417
    const/4 v0, -0x1

    if-eq p2, v0, :cond_0

    invoke-direct {p0, p2}, Lcom/android/internal/telephony/dataconnection/DctController;->isValidphoneId(I)Z

    move-result v0

    if-nez v0, :cond_1

    .line 418
    :cond_0
    const-string v0, "isDataConnectivityPossible(): with PHONE_NONE or Invalid PHONE ID"

    invoke-static {v0}, Lcom/android/internal/telephony/dataconnection/DctController;->logw(Ljava/lang/String;)V

    .line 419
    const/4 v0, 0x0

    .line 421
    :goto_0
    return v0

    :cond_1
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mPhones:[Lcom/android/internal/telephony/PhoneProxy;

    aget-object v0, v0, p2

    invoke-virtual {v0, p1}, Lcom/android/internal/telephony/PhoneProxy;->isDataConnectivityPossible(Ljava/lang/String;)Z

    move-result v0

    goto :goto_0
.end method

.method public isDctControllerLocked()Z
    .locals 1

    .prologue
    .line 834
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mDdsSwitchSerializer:Lcom/android/internal/telephony/dataconnection/DctController$DdsSwitchSerializerHandler;

    invoke-virtual {v0}, Lcom/android/internal/telephony/dataconnection/DctController$DdsSwitchSerializerHandler;->isLocked()Z

    move-result v0

    return v0
.end method

.method public isIdleOrDeacting(I)Z
    .locals 1
    .param p1, "phoneId"    # I

    .prologue
    .line 426
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mDcSwitchAsyncChannel:[Lcom/android/internal/telephony/dataconnection/DcSwitchAsyncChannel;

    aget-object v0, v0, p1

    invoke-virtual {v0}, Lcom/android/internal/telephony/dataconnection/DcSwitchAsyncChannel;->isIdleOrDeactingSync()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 427
    const/4 v0, 0x1

    .line 429
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public registerDdsSwitchPropService(Landroid/os/Messenger;)V
    .locals 3
    .param p1, "messenger"    # Landroid/os/Messenger;

    .prologue
    .line 638
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Got messenger from DDS switch service, messenger = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/android/internal/telephony/dataconnection/DctController;->logd(Ljava/lang/String;)V

    .line 639
    new-instance v0, Lcom/android/internal/util/AsyncChannel;

    invoke-direct {v0}, Lcom/android/internal/util/AsyncChannel;-><init>()V

    .line 640
    .local v0, "ac":Lcom/android/internal/util/AsyncChannel;
    iget-object v1, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mContext:Landroid/content/Context;

    sget-object v2, Lcom/android/internal/telephony/dataconnection/DctController;->sDctController:Lcom/android/internal/telephony/dataconnection/DctController;

    invoke-virtual {v0, v1, v2, p1}, Lcom/android/internal/util/AsyncChannel;->connect(Landroid/content/Context;Landroid/os/Handler;Landroid/os/Messenger;)V

    .line 641
    return-void
.end method

.method public registerForDefaultDataSwitchInfo(Landroid/os/Handler;ILjava/lang/Object;)V
    .locals 3
    .param p1, "h"    # Landroid/os/Handler;
    .param p2, "what"    # I
    .param p3, "obj"    # Ljava/lang/Object;

    .prologue
    .line 617
    new-instance v0, Landroid/os/Registrant;

    invoke-direct {v0, p1, p2, p3}, Landroid/os/Registrant;-><init>(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 618
    .local v0, "r":Landroid/os/Registrant;
    iget-object v2, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mNotifyDefaultDataSwitchInfo:Landroid/os/RegistrantList;

    monitor-enter v2

    .line 619
    :try_start_0
    iget-object v1, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mNotifyDefaultDataSwitchInfo:Landroid/os/RegistrantList;

    invoke-virtual {v1, v0}, Landroid/os/RegistrantList;->add(Landroid/os/Registrant;)V

    .line 620
    monitor-exit v2

    .line 621
    return-void

    .line 620
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public registerForOnDemandDataSwitchInfo(Landroid/os/Handler;ILjava/lang/Object;)V
    .locals 3
    .param p1, "h"    # Landroid/os/Handler;
    .param p2, "what"    # I
    .param p3, "obj"    # Ljava/lang/Object;

    .prologue
    .line 624
    new-instance v0, Landroid/os/Registrant;

    invoke-direct {v0, p1, p2, p3}, Landroid/os/Registrant;-><init>(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 625
    .local v0, "r":Landroid/os/Registrant;
    iget-object v2, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mNotifyOnDemandDataSwitchInfo:Landroid/os/RegistrantList;

    monitor-enter v2

    .line 626
    :try_start_0
    iget-object v1, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mNotifyOnDemandDataSwitchInfo:Landroid/os/RegistrantList;

    invoke-virtual {v1, v0}, Landroid/os/RegistrantList;->add(Landroid/os/Registrant;)V

    .line 627
    monitor-exit v2

    .line 628
    return-void

    .line 627
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public registerForOnDemandPsAttach(Landroid/os/Handler;ILjava/lang/Object;)V
    .locals 3
    .param p1, "h"    # Landroid/os/Handler;
    .param p2, "what"    # I
    .param p3, "obj"    # Ljava/lang/Object;

    .prologue
    .line 631
    new-instance v0, Landroid/os/Registrant;

    invoke-direct {v0, p1, p2, p3}, Landroid/os/Registrant;-><init>(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 632
    .local v0, "r":Landroid/os/Registrant;
    iget-object v2, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mNotifyOnDemandPsAttach:Landroid/os/RegistrantList;

    monitor-enter v2

    .line 633
    :try_start_0
    iget-object v1, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mNotifyOnDemandPsAttach:Landroid/os/RegistrantList;

    invoke-virtual {v1, v0}, Landroid/os/RegistrantList;->add(Landroid/os/Registrant;)V

    .line 634
    monitor-exit v2

    .line 635
    return-void

    .line 634
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public setDefaultDataSubId(J)V
    .locals 13
    .param p1, "reqSubId"    # J

    .prologue
    const/4 v11, 0x0

    const/4 v10, 0x1

    .line 524
    iget-object v7, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mSubController:Lcom/android/internal/telephony/SubscriptionController;

    invoke-virtual {v7, p1, p2}, Lcom/android/internal/telephony/SubscriptionController;->getPhoneId(J)I

    move-result v3

    .line 525
    .local v3, "reqPhoneId":I
    iget-object v7, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mSubController:Lcom/android/internal/telephony/SubscriptionController;

    invoke-virtual {v7}, Lcom/android/internal/telephony/SubscriptionController;->getCurrentDds()J

    move-result-wide v0

    .line 526
    .local v0, "currentDds":J
    iget-object v7, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mSubController:Lcom/android/internal/telephony/SubscriptionController;

    invoke-virtual {v7}, Lcom/android/internal/telephony/SubscriptionController;->getDefaultDataSubId()J

    move-result-wide v4

    .line 527
    .local v4, "defaultDds":J
    new-instance v6, Lcom/android/internal/telephony/dataconnection/DctController$SwitchInfo;

    new-instance v7, Ljava/lang/Integer;

    invoke-direct {v7, v3}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    invoke-direct {v6, p0, v7, v10}, Lcom/android/internal/telephony/dataconnection/DctController$SwitchInfo;-><init>(Lcom/android/internal/telephony/dataconnection/DctController;IZ)V

    .line 528
    .local v6, "s":Lcom/android/internal/telephony/dataconnection/DctController$SwitchInfo;
    iget-object v7, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mSubController:Lcom/android/internal/telephony/SubscriptionController;

    invoke-virtual {v7, v0, v1}, Lcom/android/internal/telephony/SubscriptionController;->getPhoneId(J)I

    move-result v2

    .line 529
    .local v2, "currentDdsPhoneId":I
    if-ltz v2, :cond_0

    iget v7, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mPhoneNum:I

    if-lt v2, v7, :cond_1

    .line 532
    :cond_0
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, " setDefaultDataSubId,  reqSubId = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " currentDdsPhoneId  "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/android/internal/telephony/dataconnection/DctController;->logd(Ljava/lang/String;)V

    .line 534
    iget-object v7, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mSubController:Lcom/android/internal/telephony/SubscriptionController;

    invoke-virtual {v7, p1, p2}, Lcom/android/internal/telephony/SubscriptionController;->setDataSubId(J)V

    .line 535
    move-wide v4, p1

    .line 536
    iget-object v7, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mSubController:Lcom/android/internal/telephony/SubscriptionController;

    invoke-virtual {v7, v4, v5}, Lcom/android/internal/telephony/SubscriptionController;->getPhoneId(J)I

    move-result v2

    .line 538
    :cond_1
    const-string v7, "DctController"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "setDefaultDataSubId reqSubId :"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " reqPhoneId = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 542
    cmp-long v7, p1, v4

    if-eqz v7, :cond_2

    if-eq v3, v2, :cond_2

    .line 543
    invoke-direct {p0, v2}, Lcom/android/internal/telephony/dataconnection/DctController;->doDetach(I)V

    .line 551
    iget-object v7, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mPhones:[Lcom/android/internal/telephony/PhoneProxy;

    aget-object v7, v7, v2

    invoke-virtual {v7, p0, v10, v6}, Lcom/android/internal/telephony/PhoneProxy;->registerForAllDataDisconnected(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 553
    :goto_0
    return-void

    .line 545
    :cond_2
    const-string v7, "setDefaultDataSubId for default DDS, skip PS detach on DDS subs"

    invoke-static {v7}, Lcom/android/internal/telephony/dataconnection/DctController;->logd(Ljava/lang/String;)V

    .line 546
    const/4 v7, 0x4

    new-instance v8, Landroid/os/AsyncResult;

    invoke-direct {v8, v6, v11, v11}, Landroid/os/AsyncResult;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    invoke-virtual {p0, v7, v8}, Lcom/android/internal/telephony/dataconnection/DctController;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v7

    invoke-virtual {p0, v7}, Lcom/android/internal/telephony/dataconnection/DctController;->sendMessage(Landroid/os/Message;)Z

    goto :goto_0
.end method

.method public setOnDemandDataSubId(Landroid/net/NetworkRequest;)V
    .locals 3
    .param p1, "n"    # Landroid/net/NetworkRequest;

    .prologue
    .line 611
    const-string v0, "DctController"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setDataAllowed for :"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 612
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mDdsSwitchSerializer:Lcom/android/internal/telephony/dataconnection/DctController$DdsSwitchSerializerHandler;

    iget-object v1, p0, Lcom/android/internal/telephony/dataconnection/DctController;->mDdsSwitchSerializer:Lcom/android/internal/telephony/dataconnection/DctController$DdsSwitchSerializerHandler;

    const/16 v2, 0x9

    invoke-virtual {v1, v2, p1}, Lcom/android/internal/telephony/dataconnection/DctController$DdsSwitchSerializerHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/dataconnection/DctController$DdsSwitchSerializerHandler;->sendMessage(Landroid/os/Message;)Z

    .line 614
    return-void
.end method
