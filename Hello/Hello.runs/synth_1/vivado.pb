
�
Command: %s
1870*	planAhead2�
read_checkpoint -auto_incremental -incremental {D:/TAIST Hardware Lab/Hello/Hello.srcs/utils_1/imports/synth_1/hello_world.dcp}Z12-2866h px� 
�
;Read reference checkpoint from %s for incremental synthesis3154*	planAhead2P
ND:/TAIST Hardware Lab/Hello/Hello.srcs/utils_1/imports/synth_1/hello_world.dcpZ12-5825h px� 
T
-Please ensure there are no constraint changes3725*	planAheadZ12-7989h px� 
n
Command: %s
53*	vivadotcl2=
;synth_design -top uart_imu_processor -part xc7a100tcsg324-1Z4-113h px� 
:
Starting synth_design
149*	vivadotclZ4-321h px� 
{
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2

xc7a100tZ17-347h px� 
k
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2

xc7a100tZ17-349h px� 
E
Loading part %s157*device2
xc7a100tcsg324-1Z21-403h px� 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
o
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
2Z8-7079h px� 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px� 
N
#Helper process launched with PID %s4824*oasys2
17052Z8-7075h px� 
�
%s*synth2{
yStarting RTL Elaboration : Time (s): cpu = 00:00:15 ; elapsed = 00:00:16 . Memory (MB): peak = 1046.102 ; gain = 469.590
h px� 
�
synthesizing module '%s'638*oasys2
uart_imu_processor2B
>D:/TAIST Hardware Lab/Hello/Hello.srcs/sources_1/new/hello.vhd2
148@Z8-638h px� 
�
synthesizing module '%s'638*oasys2	
uart_rx2C
?D:/TAIST Hardware Lab/Hello/Hello.srcs/sources_1/new/module.vhd2
198@Z8-638h px� 
S
%s
*synth2;
9	Parameter CLK_FREQ bound to: 100000000 - type: integer 
h p
x
� 
Q
%s
*synth29
7	Parameter BAUD_RATE bound to: 115200 - type: integer 
h p
x
� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2	
uart_rx2
02
12C
?D:/TAIST Hardware Lab/Hello/Hello.srcs/sources_1/new/module.vhd2
198@Z8-256h px� 
�
synthesizing module '%s'638*oasys2	
uart_tx2C
?D:/TAIST Hardware Lab/Hello/Hello.srcs/sources_1/new/module.vhd2
1068@Z8-638h px� 
S
%s
*synth2;
9	Parameter CLK_FREQ bound to: 100000000 - type: integer 
h p
x
� 
Q
%s
*synth29
7	Parameter BAUD_RATE bound to: 115200 - type: integer 
h p
x
� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2	
uart_tx2
02
12C
?D:/TAIST Hardware Lab/Hello/Hello.srcs/sources_1/new/module.vhd2
1068@Z8-256h px� 
�
synthesizing module '%s'638*oasys2
logistic_regression2C
?D:/TAIST Hardware Lab/Hello/Hello.srcs/sources_1/new/module.vhd2
1858@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
logistic_regression2
02
12C
?D:/TAIST Hardware Lab/Hello/Hello.srcs/sources_1/new/module.vhd2
1858@Z8-256h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
uart_imu_processor2
02
12B
>D:/TAIST Hardware Lab/Hello/Hello.srcs/sources_1/new/hello.vhd2
148@Z8-256h px� 
s
+design %s has port %s driven by constant %s3447*oasys2
uart_imu_processor2	
led[15]2
0Z8-3917h px� 
s
+design %s has port %s driven by constant %s3447*oasys2
uart_imu_processor2	
led[14]2
0Z8-3917h px� 
s
+design %s has port %s driven by constant %s3447*oasys2
uart_imu_processor2	
led[13]2
0Z8-3917h px� 
s
+design %s has port %s driven by constant %s3447*oasys2
uart_imu_processor2	
led[12]2
0Z8-3917h px� 
s
+design %s has port %s driven by constant %s3447*oasys2
uart_imu_processor2	
led[11]2
0Z8-3917h px� 
s
+design %s has port %s driven by constant %s3447*oasys2
uart_imu_processor2	
led[10]2
0Z8-3917h px� 
r
+design %s has port %s driven by constant %s3447*oasys2
uart_imu_processor2
led[9]2
0Z8-3917h px� 
r
+design %s has port %s driven by constant %s3447*oasys2
uart_imu_processor2
led[8]2
0Z8-3917h px� 
r
+design %s has port %s driven by constant %s3447*oasys2
uart_imu_processor2
led[7]2
0Z8-3917h px� 
r
+design %s has port %s driven by constant %s3447*oasys2
uart_imu_processor2
led[6]2
0Z8-3917h px� 
r
+design %s has port %s driven by constant %s3447*oasys2
uart_imu_processor2
led[5]2
0Z8-3917h px� 
r
+design %s has port %s driven by constant %s3447*oasys2
uart_imu_processor2
led[4]2
0Z8-3917h px� 
�
%s*synth2{
yFinished RTL Elaboration : Time (s): cpu = 00:00:19 ; elapsed = 00:00:21 . Memory (MB): peak = 1154.617 ; gain = 578.105
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
;
%s
*synth2#
!Start Handling Custom Attributes
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:19 ; elapsed = 00:00:21 . Memory (MB): peak = 1154.617 ; gain = 578.105
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:19 ; elapsed = 00:00:21 . Memory (MB): peak = 1154.617 ; gain = 578.105
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0242

1154.6172
0.000Z17-268h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
>

Processing XDC Constraints
244*projectZ1-262h px� 
=
Initializing timing engine
348*projectZ1-569h px� 
�
Parsing XDC File [%s]
179*designutils2B
>D:/TAIST Hardware Lab/Hello/Hello.srcs/constrs_1/new/const.xdc8Z20-179h px� 
�
Finished Parsing XDC File [%s]
178*designutils2B
>D:/TAIST Hardware Lab/Hello/Hello.srcs/constrs_1/new/const.xdc8Z20-178h px� 
�
�Implementation specific constraints were found while reading constraint file [%s]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [%s].
233*project2@
>D:/TAIST Hardware Lab/Hello/Hello.srcs/constrs_1/new/const.xdc2&
$.Xil/uart_imu_processor_propImpl.xdcZ1-236h px� 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0012

1236.2032
0.000Z17-268h px� 
l
!Unisim Transformation Summary:
%s111*project2'
%No Unisim elements were transformed.
Z1-111h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
 Constraint Validation Runtime : 2

00:00:002
00:00:00.0062

1236.2032
0.000Z17-268h px� 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
Finished Constraint Validation : Time (s): cpu = 00:00:40 ; elapsed = 00:00:43 . Memory (MB): peak = 1236.203 ; gain = 659.691
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
D
%s
*synth2,
*Start Loading Part and Timing Information
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Loading part: xc7a100tcsg324-1
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Loading Part and Timing Information : Time (s): cpu = 00:00:40 ; elapsed = 00:00:43 . Memory (MB): peak = 1236.203 ; gain = 659.691
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
H
%s
*synth20
.Start Applying 'set_property' XDC Constraints
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:40 ; elapsed = 00:00:43 . Memory (MB): peak = 1236.203 ; gain = 659.691
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
k
3inferred FSM for state register '%s' in module '%s'802*oasys2
	state_reg2	
uart_rxZ8-802h px� 
k
3inferred FSM for state register '%s' in module '%s'802*oasys2
	state_reg2	
uart_txZ8-802h px� 
v
3inferred FSM for state register '%s' in module '%s'802*oasys2
	state_reg2
uart_imu_processorZ8-802h px� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
z
%s
*synth2b
`                   State |                     New Encoding |                Previous Encoding 
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
y
%s
*synth2a
_                    idle |                               00 |                               00
h p
x
� 
y
%s
*synth2a
_                   start |                               01 |                               01
h p
x
� 
y
%s
*synth2a
_                    data |                               10 |                               10
h p
x
� 
y
%s
*synth2a
_                    stop |                               11 |                               11
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2
	state_reg2

sequential2	
uart_rxZ8-3354h px� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
z
%s
*synth2b
`                   State |                     New Encoding |                Previous Encoding 
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
y
%s
*synth2a
_                    idle |                               00 |                               00
h p
x
� 
y
%s
*synth2a
_               start_bit |                               01 |                               01
h p
x
� 
y
%s
*synth2a
_               data_bits |                               10 |                               10
h p
x
� 
y
%s
*synth2a
_                stop_bit |                               11 |                               11
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2
	state_reg2

sequential2	
uart_txZ8-3354h px� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
z
%s
*synth2b
`                   State |                     New Encoding |                Previous Encoding 
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
y
%s
*synth2a
_                    idle |                            00001 |                              000
h p
x
� 
y
%s
*synth2a
_              check_sign |                            00010 |                              001
h p
x
� 
y
%s
*synth2a
_             read_digits |                            00100 |                              010
h p
x
� 
y
%s
*synth2a
_                evaluate |                            01000 |                              011
h p
x
� 
y
%s
*synth2a
_           send_response |                            10000 |                              100
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2
	state_reg2	
one-hot2
uart_imu_processorZ8-3354h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:41 ; elapsed = 00:00:45 . Memory (MB): peak = 1236.203 ; gain = 659.691
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
:
%s
*synth2"
 Start RTL Component Statistics 
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Detailed RTL Component Info : 
h p
x
� 
(
%s
*synth2
+---Adders : 
h p
x
� 
F
%s
*synth2.
,	   2 Input   32 Bit       Adders := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input   31 Bit       Adders := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input   10 Bit       Adders := 2     
h p
x
� 
F
%s
*synth2.
,	   2 Input    9 Bit       Adders := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    8 Bit       Adders := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    3 Bit       Adders := 2     
h p
x
� 
F
%s
*synth2.
,	   2 Input    2 Bit       Adders := 1     
h p
x
� 
+
%s
*synth2
+---Registers : 
h p
x
� 
H
%s
*synth20
.	               32 Bit    Registers := 1     
h p
x
� 
H
%s
*synth20
.	               10 Bit    Registers := 2     
h p
x
� 
H
%s
*synth20
.	                9 Bit    Registers := 1     
h p
x
� 
H
%s
*synth20
.	                8 Bit    Registers := 5     
h p
x
� 
H
%s
*synth20
.	                7 Bit    Registers := 1     
h p
x
� 
H
%s
*synth20
.	                3 Bit    Registers := 2     
h p
x
� 
H
%s
*synth20
.	                2 Bit    Registers := 1     
h p
x
� 
H
%s
*synth20
.	                1 Bit    Registers := 7     
h p
x
� 
'
%s
*synth2
+---Muxes : 
h p
x
� 
F
%s
*synth2.
,	   2 Input   32 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input   31 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   5 Input   12 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   4 Input   10 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   2 Input    9 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   4 Input    8 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    8 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   5 Input    8 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   3 Input    7 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   5 Input    5 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    5 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   4 Input    3 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   4 Input    2 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   2 Input    2 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   5 Input    2 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    1 Bit        Muxes := 3     
h p
x
� 
F
%s
*synth2.
,	   4 Input    1 Bit        Muxes := 11    
h p
x
� 
F
%s
*synth2.
,	   5 Input    1 Bit        Muxes := 7     
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
=
%s
*synth2%
#Finished RTL Component Statistics 
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
6
%s
*synth2
Start Part Resource Summary
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
q
%s
*synth2Y
WPart Resources:
DSPs: 240 (col length:80)
BRAMs: 270 (col length: RAMB18 80 RAMB36 40)
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Finished Part Resource Summary
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
E
%s
*synth2-
+Start Cross Boundary and Area Optimization
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
H
&Parallel synthesis criteria is not met4829*oasysZ8-7080h px� 
s
+design %s has port %s driven by constant %s3447*oasys2
uart_imu_processor2	
led[15]2
0Z8-3917h px� 
s
+design %s has port %s driven by constant %s3447*oasys2
uart_imu_processor2	
led[14]2
0Z8-3917h px� 
s
+design %s has port %s driven by constant %s3447*oasys2
uart_imu_processor2	
led[13]2
0Z8-3917h px� 
s
+design %s has port %s driven by constant %s3447*oasys2
uart_imu_processor2	
led[12]2
0Z8-3917h px� 
s
+design %s has port %s driven by constant %s3447*oasys2
uart_imu_processor2	
led[11]2
0Z8-3917h px� 
s
+design %s has port %s driven by constant %s3447*oasys2
uart_imu_processor2	
led[10]2
0Z8-3917h px� 
r
+design %s has port %s driven by constant %s3447*oasys2
uart_imu_processor2
led[9]2
0Z8-3917h px� 
r
+design %s has port %s driven by constant %s3447*oasys2
uart_imu_processor2
led[8]2
0Z8-3917h px� 
r
+design %s has port %s driven by constant %s3447*oasys2
uart_imu_processor2
led[7]2
0Z8-3917h px� 
r
+design %s has port %s driven by constant %s3447*oasys2
uart_imu_processor2
led[6]2
0Z8-3917h px� 
r
+design %s has port %s driven by constant %s3447*oasys2
uart_imu_processor2
led[5]2
0Z8-3917h px� 
r
+design %s has port %s driven by constant %s3447*oasys2
uart_imu_processor2
led[4]2
0Z8-3917h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
1st2
led_reg[11]/Q2B
>D:/TAIST Hardware Lab/Hello/Hello.srcs/sources_1/new/hello.vhd2
1268@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
2nd2
GND2B
>D:/TAIST Hardware Lab/Hello/Hello.srcs/sources_1/new/hello.vhd2
1268@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2B
>D:/TAIST Hardware Lab/Hello/Hello.srcs/sources_1/new/hello.vhd2
1268@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
1st2
led_reg[10]/Q2B
>D:/TAIST Hardware Lab/Hello/Hello.srcs/sources_1/new/hello.vhd2
1268@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
2nd2
GND2B
>D:/TAIST Hardware Lab/Hello/Hello.srcs/sources_1/new/hello.vhd2
1268@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2B
>D:/TAIST Hardware Lab/Hello/Hello.srcs/sources_1/new/hello.vhd2
1268@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
1st2
led_reg[9]/Q2B
>D:/TAIST Hardware Lab/Hello/Hello.srcs/sources_1/new/hello.vhd2
1268@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
2nd2
GND2B
>D:/TAIST Hardware Lab/Hello/Hello.srcs/sources_1/new/hello.vhd2
1268@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2B
>D:/TAIST Hardware Lab/Hello/Hello.srcs/sources_1/new/hello.vhd2
1268@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
1st2
led_reg[8]/Q2B
>D:/TAIST Hardware Lab/Hello/Hello.srcs/sources_1/new/hello.vhd2
1268@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
2nd2
GND2B
>D:/TAIST Hardware Lab/Hello/Hello.srcs/sources_1/new/hello.vhd2
1268@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2B
>D:/TAIST Hardware Lab/Hello/Hello.srcs/sources_1/new/hello.vhd2
1268@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
1st2
led_reg[7]/Q2B
>D:/TAIST Hardware Lab/Hello/Hello.srcs/sources_1/new/hello.vhd2
1268@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
2nd2
GND2B
>D:/TAIST Hardware Lab/Hello/Hello.srcs/sources_1/new/hello.vhd2
1268@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2B
>D:/TAIST Hardware Lab/Hello/Hello.srcs/sources_1/new/hello.vhd2
1268@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
1st2
led_reg[6]/Q2B
>D:/TAIST Hardware Lab/Hello/Hello.srcs/sources_1/new/hello.vhd2
1268@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
2nd2
GND2B
>D:/TAIST Hardware Lab/Hello/Hello.srcs/sources_1/new/hello.vhd2
1268@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2B
>D:/TAIST Hardware Lab/Hello/Hello.srcs/sources_1/new/hello.vhd2
1268@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
1st2
led_reg[5]/Q2B
>D:/TAIST Hardware Lab/Hello/Hello.srcs/sources_1/new/hello.vhd2
1268@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
2nd2
GND2B
>D:/TAIST Hardware Lab/Hello/Hello.srcs/sources_1/new/hello.vhd2
1268@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2B
>D:/TAIST Hardware Lab/Hello/Hello.srcs/sources_1/new/hello.vhd2
1268@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
1st2
led_reg[4]/Q2B
>D:/TAIST Hardware Lab/Hello/Hello.srcs/sources_1/new/hello.vhd2
1268@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
2nd2
GND2B
>D:/TAIST Hardware Lab/Hello/Hello.srcs/sources_1/new/hello.vhd2
1268@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2B
>D:/TAIST Hardware Lab/Hello/Hello.srcs/sources_1/new/hello.vhd2
1268@Z8-6858h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:52 ; elapsed = 00:00:57 . Memory (MB): peak = 1236.203 ; gain = 659.691
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
@
%s
*synth2(
&Start Applying XDC Timing Constraints
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Applying XDC Timing Constraints : Time (s): cpu = 00:01:08 ; elapsed = 00:01:13 . Memory (MB): peak = 1349.520 ; gain = 773.008
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
4
%s
*synth2
Start Timing Optimization
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2
}Finished Timing Optimization : Time (s): cpu = 00:01:08 ; elapsed = 00:01:13 . Memory (MB): peak = 1349.742 ; gain = 773.230
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
3
%s
*synth2
Start Technology Mapping
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2~
|Finished Technology Mapping : Time (s): cpu = 00:01:08 ; elapsed = 00:01:13 . Memory (MB): peak = 1378.352 ; gain = 801.840
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
-
%s
*synth2
Start IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
?
%s
*synth2'
%Start Flattening Before IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
B
%s
*synth2*
(Finished Flattening Before IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
6
%s
*synth2
Start Final Netlist Cleanup
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Finished Final Netlist Cleanup
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2x
vFinished IO Insertion : Time (s): cpu = 00:01:19 ; elapsed = 00:01:26 . Memory (MB): peak = 1576.059 ; gain = 999.547
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
=
%s
*synth2%
#Start Renaming Generated Instances
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Instances : Time (s): cpu = 00:01:19 ; elapsed = 00:01:26 . Memory (MB): peak = 1576.059 ; gain = 999.547
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
:
%s
*synth2"
 Start Rebuilding User Hierarchy
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Rebuilding User Hierarchy : Time (s): cpu = 00:01:19 ; elapsed = 00:01:26 . Memory (MB): peak = 1576.059 ; gain = 999.547
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Start Renaming Generated Ports
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Ports : Time (s): cpu = 00:01:19 ; elapsed = 00:01:26 . Memory (MB): peak = 1576.059 ; gain = 999.547
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
;
%s
*synth2#
!Start Handling Custom Attributes
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:01:19 ; elapsed = 00:01:26 . Memory (MB): peak = 1576.059 ; gain = 999.547
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
8
%s
*synth2 
Start Renaming Generated Nets
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Nets : Time (s): cpu = 00:01:19 ; elapsed = 00:01:26 . Memory (MB): peak = 1576.059 ; gain = 999.547
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Start Writing Synthesis Report
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
/
%s
*synth2

Report BlackBoxes: 
h p
x
� 
8
%s
*synth2 
+-+--------------+----------+
h p
x
� 
8
%s
*synth2 
| |BlackBox name |Instances |
h p
x
� 
8
%s
*synth2 
+-+--------------+----------+
h p
x
� 
8
%s
*synth2 
+-+--------------+----------+
h p
x
� 
/
%s*synth2

Report Cell Usage: 
h px� 
2
%s*synth2
+------+-------+------+
h px� 
2
%s*synth2
|      |Cell   |Count |
h px� 
2
%s*synth2
+------+-------+------+
h px� 
2
%s*synth2
|1     |BUFG   |     1|
h px� 
2
%s*synth2
|2     |CARRY4 |    11|
h px� 
2
%s*synth2
|3     |LUT1   |    12|
h px� 
2
%s*synth2
|4     |LUT2   |    33|
h px� 
2
%s*synth2
|5     |LUT3   |    22|
h px� 
2
%s*synth2
|6     |LUT4   |    34|
h px� 
2
%s*synth2
|7     |LUT5   |    27|
h px� 
2
%s*synth2
|8     |LUT6   |    49|
h px� 
2
%s*synth2
|9     |FDRE   |    92|
h px� 
2
%s*synth2
|10    |IBUF   |     2|
h px� 
2
%s*synth2
|11    |OBUF   |    17|
h px� 
2
%s*synth2
+------+-------+------+
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Writing Synthesis Report : Time (s): cpu = 00:01:19 ; elapsed = 00:01:26 . Memory (MB): peak = 1576.059 ; gain = 999.547
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
b
%s
*synth2J
HSynthesis finished with 0 errors, 24 critical warnings and 13 warnings.
h p
x
� 
�
%s
*synth2�
Synthesis Optimization Runtime : Time (s): cpu = 00:00:56 ; elapsed = 00:01:21 . Memory (MB): peak = 1576.059 ; gain = 917.961
h p
x
� 
�
%s
*synth2�
�Synthesis Optimization Complete : Time (s): cpu = 00:01:20 ; elapsed = 00:01:26 . Memory (MB): peak = 1576.059 ; gain = 999.547
h p
x
� 
B
 Translating synthesized netlist
350*projectZ1-571h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0082

1576.0592
0.000Z17-268h px� 
T
-Analyzing %s Unisim elements for replacement
17*netlist2
11Z29-17h px� 
X
2Unisim Transformation completed in %s CPU seconds
28*netlist2
0Z29-28h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
Q
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02
0Z31-138h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002

00:00:002

1576.0592
0.000Z17-268h px� 
l
!Unisim Transformation Summary:
%s111*project2'
%No Unisim elements were transformed.
Z1-111h px� 
V
%Synth Design complete | Checksum: %s
562*	vivadotcl2

f8460276Z4-1430h px� 
C
Releasing license: %s
83*common2
	SynthesisZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
352
252
242
0Z4-41h px� 
L
%s completed successfully
29*	vivadotcl2
synth_designZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
synth_design: 2

00:01:292

00:01:422

1576.0592

1204.438Z17-268h px� 
c
%s6*runtcl2G
ESynthesis results are not added to the cache due to CRITICAL_WARNING
h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Write ShapeDB Complete: 2

00:00:002
00:00:00.0042

1576.0592
0.000Z17-268h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2G
ED:/TAIST Hardware Lab/Hello/Hello.runs/synth_1/uart_imu_processor.dcpZ17-1381h px� 
�
Executing command : %s
56330*	planAhead2o
mreport_utilization -file uart_imu_processor_utilization_synth.rpt -pb uart_imu_processor_utilization_synth.pbZ12-24828h px� 
\
Exiting %s at %s...
206*common2
Vivado2
Sat Apr 12 01:56:55 2025Z17-206h px� 


End Record