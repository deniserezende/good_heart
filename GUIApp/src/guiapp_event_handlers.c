

#include "gui/guiapp_resources.h"
#include "gui/guiapp_specifications.h"
#include "neural_network/NeuralNetwork.h"
#include "neural_network/Layer.h"
#include "neural_network/ECG.h"
#include "neural_network/Lista.h"
#include "dhcp/dhcp_setup.h"
#include <stdio.h>

NeuralNetwork neural_network = NULL;
Layer input_layer, hidden_layer, output_layer = NULL;
Lista lista = NULL;

int N=0, A=0;

ECG ecg = NULL;

char txt_result[100];
double nn_result;

//extern GX_WINDOW_ROOT * p_window_root;

//static UINT show_window(GX_WINDOW * p_new, GX_WIDGET * p_widget, bool detach_old);
static void update_prompt_text(GX_WIDGET * p_widget, GX_RESOURCE_ID id, char* text);
//static void update_button_text_id(GX_WIDGET * p_widget, GX_RESOURCE_ID id, UINT string_id);

UINT window1_handler(GX_WINDOW *widget, GX_EVENT *event_ptr)
{
    UINT result = gx_window_event_process(widget, event_ptr);

    switch (event_ptr->gx_event_type)
    {
    case GX_SIGNAL(BTN_START, GX_EVENT_CLICKED):
        update_prompt_text(widget->gx_widget_parent, TXT_IP, getIpText());
        if(neural_network == NULL){
            neural_network = createNeuralNetwork();
            input_layer = createLayer(NULL,8,INPUT);
            addLayer(neural_network, input_layer);
            hidden_layer = createLayer("relu",4,HIDDEN);
            addLayer(neural_network, hidden_layer);
            output_layer = createLayer("sigmoid",1,OUTPUT);
            addLayer(neural_network, output_layer);
        }
        lista = inserir(lista,createECG(-0.67,-0.4,0.435,-2.12,-1.495,0.85,-1.4277777777777778,0.058333333333333334));
        lista = inserir(lista,createECG(-0.655,-0.215,0.295,-2.15,-1.375,0.8416666666666667,-1.4444444444444444,0.06944444444444445));
        lista = inserir(lista,createECG(-0.695,-0.205,0.28,-2.095,-1.36,0.8444444444444444,-1.4444444444444444,0.07222222222222222));
        lista = inserir(lista,createECG(-0.79,-0.26,0.345,-1.885,-1.39,0.8111111111111111,-1.4444444444444444,0.07222222222222222));
        lista = inserir(lista,createECG(-0.625,-0.16,0.405,-2.06,-1.32,0.8222222222222222,-1.4,0.06388888888888888));
        lista = inserir(lista,createECG(-0.62,-0.14,0.415,-1.945,-1.315,0.8333333333333334,-1.3916666666666666,0.06388888888888888));
        lista = inserir(lista,createECG(-0.605,-0.19,0.4,-2.02,-1.185,0.8083333333333333,-1.4083333333333334,0.05555555555555555));
        lista = inserir(lista,createECG(-0.72,-0.245,0.32,-1.895,-1.2,0.7972222222222223,-1.4,0.06666666666666667));
        lista = inserir(lista,createECG(-0.68,-1.12,0.23,-1.975,-1.23,0.8638888888888889,-1.3416666666666666,0.09444444444444444));
        lista = inserir(lista,createECG(-0.715,-0.585,0.05,-2.26,-1.16,0.8611111111111112,-1.4111111111111112,0.06944444444444445));
        lista = inserir(lista,createECG(-0.96,-0.515,0.115,-2.29,-1.26,0.8444444444444444,-1.4694444444444446,0.06944444444444445));
        lista = inserir(lista,createECG(-0.94,-0.385,0.185,-2.215,-1.55,0.8444444444444444,-1.4694444444444446,0.05555555555555555));
        lista = inserir(lista,createECG(-0.875,-0.42,0.22,-1.965,-1.46,0.8277777777777777,-1.4444444444444444,0.05555555555555555));
        lista = inserir(lista,createECG(-0.75,-0.78,0.565,-1.805,-1.405,0.8416666666666667,-1.3833333333333333,0.08888888888888889));
        lista = inserir(lista,createECG(0.035,-0.45,2.03,-0.74,0.625,1.0027777777777778,-0.7388888888888889,0.04722222222222222));
        lista = inserir(lista,createECG(0.06,-0.435,2.03,-0.75,0.635,1.0055555555555555,-0.7166666666666667,0.044444444444444446));
        lista = inserir(lista,createECG(0.035,-0.5,2.01,-0.755,0.595,1.0611111111111111,-0.7111111111111111,0.044444444444444446));
        lista = inserir(lista,createECG(0.07,-0.53,1.955,-0.83,0.545,1.0222222222222221,-0.7472222222222222,0.04722222222222222));
        lista = inserir(lista,createECG(-0.085,-0.51,1.965,-0.79,0.52,1.0361111111111112,-0.7083333333333334,0.04722222222222222));
        lista = inserir(lista,createECG(-0.05,-0.25,2.075,-0.51,0.595,0.9666666666666667,-0.7277777777777777,0.044444444444444446));
        lista = inserir(lista,createECG(0.2,-0.625,1.9,-1.035,0.71,0.875,-0.6583333333333333,0.04722222222222222));
        lista = inserir(lista,createECG(0.075,-0.595,1.915,-1.05,0.38,0.9361111111111111,-0.5833333333333334,0.044444444444444446));
        lista = inserir(lista,createECG(-0.085,-0.615,1.87,-0.855,0.48,1.0,-0.6388888888888888,0.04722222222222222));
        lista = inserir(lista,createECG(-0.095,-0.73,1.93,-1.025,0.49,0.975,-0.6888888888888889,0.05));
        lista = inserir(lista,createECG(-0.325,-0.53,2.095,-0.755,0.325,0.9194444444444444,-0.6583333333333333,0.04722222222222222));
        lista = inserir(lista,createECG(-0.045,-0.445,2.065,-0.775,0.55,0.9277777777777778,-0.6055555555555555,0.04722222222222222));
        lista = inserir(lista,createECG(0.105,-0.66,2.045,-0.855,0.485,0.8555555555555555,-0.6277777777777778,0.041666666666666664));
        //update_button_text_id(widget->gx_widget_parent, ID_WINDOWCHANGER, GX_STRING_ID_BUTTON_ENABLED);
        //update_prompt_text_id(widget->gx_widget_parent, ID_INSTRUCTIONS, GX_STRING_ID_INSTRUCT_BUTTON);
        break;
    case GX_SIGNAL(CK_ECG1, GX_EVENT_RADIO_SELECT):
        ecg = createECG(0.06,-0.435,2.03,-0.75,0.635,1.0055555555555555,-0.7166666666666667,0.044444444444444446);
        if(ecg == NULL){
            update_prompt_text(widget->gx_widget_parent, P_RESULT, "ECG NULL");
        }else{
            update_prompt_text(widget->gx_widget_parent, P_RESULT, "ECG106");
        }
        break;
    case GX_SIGNAL(CK_ECG2, GX_EVENT_RADIO_SELECT):
        ecg = createECG(-0.605,-0.19,0.4,-2.02,-1.185,0.8083333333333333,-1.4083333333333334,0.05555555555555555);
        if(ecg == NULL){
            update_prompt_text(widget->gx_widget_parent, P_RESULT, "ECG NULL");
        }else{
            update_prompt_text(widget->gx_widget_parent, P_RESULT, "ECG118");
        }
        break;
    case GX_SIGNAL(BTN_RUN, GX_EVENT_CLICKED):
        if(neural_network != NULL && lista != NULL){
            while(lista != NULL){
                nn_result = executeNeuralNetwork(neural_network, get(lista));
                nn_result>0.5 ? A++ : N++;
                lista = getProx(lista);
            }
            //nn_result = executeNeuralNetwork(neural_network, ecg);
            sprintf(txt_result, "N:%d A:%d", N, A);
            //update_prompt_text(widget->gx_widget_parent, P_RESULT, nn_result>0.5?"POSSUI":"NAO POSSUI");
            update_prompt_text(widget->gx_widget_parent, P_RESULT, txt_result);
        }else if(neural_network == NULL){
            update_prompt_text(widget->gx_widget_parent, P_RESULT, "NN NULL!");
        }else if(lista == NULL){
            update_prompt_text(widget->gx_widget_parent, P_RESULT, "ECG NULL!");
        }

        break;
    default:
        gx_window_event_process(widget, event_ptr);
        break;
    }

    return result;
}


static void update_prompt_text(GX_WIDGET * p_widget, GX_RESOURCE_ID id, char* text)
{
    GX_PROMPT * p_prompt = NULL;

    ssp_err_t err = (ssp_err_t)gx_widget_find(p_widget, (USHORT)id, GX_SEARCH_DEPTH_INFINITE, (GX_WIDGET**)&p_prompt);
    if (TX_SUCCESS == err)
    {
        gx_prompt_text_set(p_prompt, text);
    }
}


//show_window((GX_WINDOW*)&window2, (GX_WIDGET*)widget, true);
/*UINT window2_handler(GX_WINDOW *widget, GX_EVENT *event_ptr)
{
    UINT result = gx_window_event_process(widget, event_ptr);

    switch (event_ptr->gx_event_type){
        case GX_EVENT_PEN_UP:
            show_window((GX_WINDOW*)&window1, (GX_WIDGET*)widget, true);
            break;
        default:
            result = gx_window_event_process(widget, event_ptr);
            break;
    }
    return result;
}

static UINT show_window(GX_WINDOW * p_new, GX_WIDGET * p_widget, bool detach_old)
{
    UINT err = GX_SUCCESS;

    if (!p_new->gx_widget_parent)
    {
        err = gx_widget_attach(p_window_root, p_new);
    }
    else
    {
        err = gx_widget_show(p_new);
    }

    gx_system_focus_claim(p_new);

    GX_WIDGET * p_old = p_widget;
    if (p_old && detach_old)
    {
        if (p_old != (GX_WIDGET*)p_new)
        {
            gx_widget_detach(p_old);
        }
    }

    return err;
}*/


/*static void update_button_text_id(GX_WIDGET * p_widget, GX_RESOURCE_ID id, UINT string_id)
{
    GX_TEXT_BUTTON * p_button = NULL;

    ssp_err_t err = (ssp_err_t)gx_widget_find(p_widget, (USHORT)id, GX_SEARCH_DEPTH_INFINITE, (GX_WIDGET**)&p_button);
    if (TX_SUCCESS == err)
    {
        gx_text_button_text_id_set(p_button, string_id);
    }
}*/
