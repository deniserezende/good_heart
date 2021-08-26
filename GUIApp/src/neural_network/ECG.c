#include"ECG.h"
#include<stdio.h>
#include<stdlib.h>

typedef struct elemento{
    double P, Q, R, S, T, RR, QT, QRS;
}ECGImpl;

ECG createECG(double P, double Q, double R, double S, double T, double RR, double QT, double QRS){
    ECGImpl* ecg = malloc(sizeof(ECGImpl));
    ecg->P = P;
    ecg->Q = Q;
    ecg->R = R;
    ecg->S = S;
    ecg->T = T;
    ecg->RR = RR;
    ecg->QT = QT;
    ecg->QRS = QRS;
    return ecg;
}

double getPValue(ECG ecg){
    ECGImpl* e = ecg;
    return e->P;
}

double getQValue(ECG ecg){
    ECGImpl* e = ecg;
    return e->Q;
}

double getRValue(ECG ecg){
    ECGImpl* e = ecg;
    return e->R;
}

double getSValue(ECG ecg){
    ECGImpl* e = ecg;
    return e->S;
}

double getTValue(ECG ecg){
    ECGImpl* e = ecg;
    return e->T;
}

double getRRValue(ECG ecg){
    ECGImpl* e = ecg;
    return e->RR;
}

double getQTValue(ECG ecg){
    ECGImpl* e = ecg;
    return e->QT;
}

double getQRSValue(ECG ecg){
    ECGImpl* e = ecg;
    return e->QRS;
}

