################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/neural_network/ECG.c \
../src/neural_network/Edge.c \
../src/neural_network/Layer.c \
../src/neural_network/Lista.c \
../src/neural_network/NeuralNetwork.c \
../src/neural_network/Neuron.c 

OBJS += \
./src/neural_network/ECG.o \
./src/neural_network/Edge.o \
./src/neural_network/Layer.o \
./src/neural_network/Lista.o \
./src/neural_network/NeuralNetwork.o \
./src/neural_network/Neuron.o 

C_DEPS += \
./src/neural_network/ECG.d \
./src/neural_network/Edge.d \
./src/neural_network/Layer.d \
./src/neural_network/Lista.d \
./src/neural_network/NeuralNetwork.d \
./src/neural_network/Neuron.d 


# Each subdirectory must supply rules for building sources it contributes
src/neural_network/%.o: ../src/neural_network/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	C:\Users\joao_\.eclipse\com.renesas.platform_1328754054\Utilities\\/isdebuild arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -O2 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wunused -Wuninitialized -Wall -Wextra -Wmissing-declarations -Wconversion -Wpointer-arith -Wshadow -Wlogical-op -Waggregate-return -Wfloat-equal  -g3 -DSF_MESSAGE_CLASS -I../GUIApp/synergy_cfg/ssp_cfg/bsp/ -I../GUIApp/synergy_cfg/ssp_cfg/driver/ -I../GUIApp/synergy/ssp/inc/ -I../GUIApp/synergy/ssp/inc/bsp/ -I../GUIApp/synergy/ssp/inc/bsp/cmsis/Include/ -I../GUIApp/synergy/ssp/inc/driver/api/ -I../GUIApp/synergy/ssp/inc/driver/instances/ -I../GUIApp/synergy_cfg/ssp_cfg/framework/el/ -I../GUIApp/synergy/ssp/inc/framework/el/ -I../GUIApp/synergy/ssp/src/framework/el/tx/ -I../GUIApp/synergy_cfg/ssp_cfg/framework/ -I../GUIApp/synergy/ssp/inc/framework/api/ -I../GUIApp/synergy/ssp/inc/framework/instances/ -I../GUIApp/synergy_cfg/ssp_cfg/framework/tes/ -I../GUIApp/synergy/ssp/inc/framework/tes/ -I../GUIApp/synergy_cfg/framework/ -I../GUIApp/synergy_cfg/ssp_cfg/framework -I../GUIApp/synergy/ssp/inc/framework/api -I../GUIApp/synergy/ssp/inc/framework/instances -I../GUIApp/synergy_cfg/ssp_cfg/framework/tes -I../GUIApp/synergy/ssp/inc/framework/tes -I../GUIApp/synergy_cfg/ssp_cfg/framework/el -I../GUIApp/synergy/ssp/inc/framework/el -I../GUIApp/synergy/ssp/src/framework/el/tx -I../GUIApp/synergy_cfg/ssp_cfg/bsp -I../GUIApp/synergy_cfg/ssp_cfg/driver -I../GUIApp/synergy/ssp/inc -I../GUIApp/synergy/ssp/inc/bsp -I../GUIApp/synergy/ssp/inc/bsp/cmsis/Include -I../GUIApp/synergy/ssp/inc/driver/api -I../GUIApp/synergy/ssp/inc/driver/instances -I"C:\Users\joao_\Documents\GUIX_Hello_World_SK_S7G2\GUIApp\synergy_cfg\ssp_cfg\framework" -I"C:\Users\joao_\Documents\GUIX_Hello_World_SK_S7G2\GUIApp\synergy\ssp\inc\framework\api" -I"C:\Users\joao_\Documents\GUIX_Hello_World_SK_S7G2\GUIApp\synergy\ssp\inc\framework\instances" -I"C:\Users\joao_\Documents\GUIX_Hello_World_SK_S7G2\GUIApp\synergy\ssp\inc\framework\tes" -I"C:\Users\joao_\Documents\GUIX_Hello_World_SK_S7G2\GUIApp\synergy_cfg\ssp_cfg\framework\el" -I"C:\Users\joao_\Documents\GUIX_Hello_World_SK_S7G2\GUIApp\synergy\ssp\inc\framework\el" -I"C:\Users\joao_\Documents\GUIX_Hello_World_SK_S7G2\GUIApp\synergy\ssp\src\framework\el\tx" -I"C:\Users\joao_\Documents\GUIX_Hello_World_SK_S7G2\GUIApp\synergy_cfg\ssp_cfg\bsp" -I"C:\Users\joao_\Documents\GUIX_Hello_World_SK_S7G2\GUIApp\synergy_cfg\ssp_cfg\driver" -I"C:\Users\joao_\Documents\GUIX_Hello_World_SK_S7G2\GUIApp\synergy\ssp\inc" -I"C:\Users\joao_\Documents\GUIX_Hello_World_SK_S7G2\GUIApp\synergy\ssp\inc\bsp" -I"C:\Users\joao_\Documents\GUIX_Hello_World_SK_S7G2\GUIApp\synergy\ssp\inc\bsp\cmsis\Include" -I"C:\Users\joao_\Documents\GUIX_Hello_World_SK_S7G2\GUIApp\synergy\ssp\inc\driver\api" -I"C:\Users\joao_\Documents\GUIX_Hello_World_SK_S7G2\GUIApp\synergy\ssp\inc\driver\instances" -I"C:\Users\joao_\Documents\GUIX_Hello_World_SK_S7G2\GUIApp\src" -I"C:\Users\joao_\Documents\GUIX_Hello_World_SK_S7G2\GUIApp\src\synergy_gen" -std=c99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" -x c "$<"
	@echo 'Finished building: $<'
	@echo ' '


