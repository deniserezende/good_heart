#include "MessageBody.h"
#include <json/cJSON.h>
#include <stdio.h>
#include <stdlib.h>

typedef struct elemento{
    int IdMsg;
    int OpCode;
    int ECGTime;
    int ECGFile;
    int FreqCard;
    int GoodComplex;
    int BadComplex;
}MessageBodyImpl;

MessageBody createMessageBody(){
    MessageBodyImpl* m = malloc(sizeof(MessageBodyImpl));
    m->IdMsg = -1;
    m->OpCode = -1;
    m->ECGTime = -1;
    m->ECGFile = -1;
    m->FreqCard = -1;
    m->GoodComplex = -1;
    m->BadComplex = -1;
    return m;
}

void setIdMsg(MessageBody messageBody, int IdMsg){
    MessageBodyImpl* m = messageBody;
    m->IdMsg = IdMsg;
}

void setOpCode(MessageBody messageBody, int opCode){
    MessageBodyImpl* m = messageBody;
    m->OpCode = opCode;
}

int getOpCode(MessageBody messageBody){
    MessageBodyImpl* m = messageBody;
    return m->OpCode;
}

void setECGTime(MessageBody messageBody, int ECGTime){
    MessageBodyImpl* m = messageBody;
    m->ECGTime = ECGTime;
}

void setECGFile(MessageBody messageBody, int ECGFile){
    MessageBodyImpl* m = messageBody;
    m->ECGFile = ECGFile;
}

int getECGFile(MessageBody messageBody){
    MessageBodyImpl* m = messageBody;
    return m->ECGFile;
}


void setFreqCard(MessageBody messageBody, int FreqCard){
    MessageBodyImpl* m = messageBody;
    m->FreqCard = FreqCard;
}

void setGoodComplex(MessageBody messageBody, int GoodComplex){
    MessageBodyImpl* m = messageBody;
    m->GoodComplex = GoodComplex;
}

void setBadComplex(MessageBody messageBody, int BadComplex){
    MessageBodyImpl* m = messageBody;
    m->BadComplex = BadComplex;
}

char * MessageBodyToJson(MessageBody messageBody){
    MessageBodyImpl* m = messageBody;
    char *string = NULL;
    cJSON *json = cJSON_CreateObject();
    if(m->IdMsg != -1){
        cJSON* IdMsg = cJSON_CreateNumber((double)m->IdMsg);
        cJSON_AddItemToObject(json, "IdMsg", IdMsg);
    }
    if(m->OpCode != -1){
        cJSON* OpCode = cJSON_CreateNumber((double)m->OpCode);
        cJSON_AddItemToObject(json, "OpCode", OpCode);
    }
    if(m->ECGTime != -1){
        cJSON* ECGTime = cJSON_CreateNumber((double)m->ECGTime);
        cJSON_AddItemToObject(json, "ECGTime", ECGTime);
    }
    if(m->ECGFile != -1){
        cJSON* ECGFile = cJSON_CreateNumber((double)m->ECGFile);
        cJSON_AddItemToObject(json, "ECGFile", ECGFile);
    }
    if(m->FreqCard != -1){
        cJSON* FreqCard = cJSON_CreateNumber((double)m->FreqCard);
        cJSON_AddItemToObject(json, "FreqCard", FreqCard);
    }
    if(m->GoodComplex != -1){
        cJSON* GoodComplex = cJSON_CreateNumber((double)m->GoodComplex);
        cJSON_AddItemToObject(json, "GoodComplex", GoodComplex);
    }
    if(m->BadComplex != -1){
        cJSON* BadComplex = cJSON_CreateNumber((double)m->BadComplex);
        cJSON_AddItemToObject(json, "BadComplex", BadComplex);
    }

    string = cJSON_Print(json);
    cJSON_Delete(json);
    return string;
}

MessageBody JsonToMessageBody(char* string){
    MessageBodyImpl* messageBody = createMessageBody();
    cJSON *json = cJSON_Parse(string);

    cJSON *obj = cJSON_GetObjectItemCaseSensitive(json, "IdMsg");
    if (cJSON_IsNumber(obj)){
        setIdMsg(messageBody, obj->valueint);
    }

    obj = cJSON_GetObjectItemCaseSensitive(json, "OpCode");
    if (cJSON_IsNumber(obj)){
        setOpCode(messageBody, obj->valueint);
    }

    obj = cJSON_GetObjectItemCaseSensitive(json, "ECGTime");
    if (cJSON_IsNumber(obj)){
        setECGTime(messageBody, obj->valueint);
    }

    obj = cJSON_GetObjectItemCaseSensitive(json, "ECGFile");
    if (cJSON_IsNumber(obj)){
        setECGFile(messageBody, obj->valueint);
    }

    obj = cJSON_GetObjectItemCaseSensitive(json, "FreqCard");
    if (cJSON_IsNumber(obj)){
        setFreqCard(messageBody, obj->valueint);
    }

    obj = cJSON_GetObjectItemCaseSensitive(json, "GoodComplex");
    if (cJSON_IsNumber(obj)){
        setGoodComplex(messageBody, obj->valueint);
    }

    obj = cJSON_GetObjectItemCaseSensitive(json, "BadComplex");
    if (cJSON_IsNumber(obj)){
        setBadComplex(messageBody, obj->valueint);
    }

    cJSON_Delete(json);
    return messageBody;
}

