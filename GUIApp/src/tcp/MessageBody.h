#ifndef MESSAGE_BODY
#define MESSAGE_BODY

#define TEST_OP 500
#define RESPONSE_TEST_OP 510

#define FILE_EVALUATION 100
#define RESPONSE_FILE_EVALUATION 400

#define GET_FILES 600

typedef void * MessageBody;

MessageBody createMessageBody();

void setIdMsg(MessageBody messageBody, int IdMsg);

void setOpCode(MessageBody messageBody, int opCode);

int getOpCode(MessageBody messageBody);

void setECGTime(MessageBody messageBody, int ECGTime);

void setECGFile(MessageBody messageBody, int ECGFile);

int getECGFile(MessageBody messageBody);

void setFreqCard(MessageBody messageBody, int FreqCard);

void setGoodComplex(MessageBody messageBody, int GoodComplex);

void setBadComplex(MessageBody messageBody, int BadComplex);

char * MessageBodyToJson(MessageBody messageBody);

MessageBody JsonToMessageBody(char* string);

char * getECGFiles();

#endif
