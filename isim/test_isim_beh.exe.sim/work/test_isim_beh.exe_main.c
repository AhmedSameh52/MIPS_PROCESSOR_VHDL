/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;

char *IEEE_P_2592010699;
char *IEEE_P_1242562249;
char *STD_STANDARD;
char *IEEE_P_0774719531;
char *IEEE_P_3499444699;
char *WORK_P_0804141302;
char *IEEE_P_3620187407;
char *WORK_P_4053066488;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    work_p_4053066488_init();
    ieee_p_1242562249_init();
    work_p_0804141302_init();
    ieee_p_3499444699_init();
    ieee_p_0774719531_init();
    ieee_p_3620187407_init();
    work_a_1007874614_3212880686_init();
    work_a_1748821512_3212880686_init();
    work_a_2428793757_3212880686_init();
    work_a_2023191012_3212880686_init();
    work_a_2278322344_3212880686_init();
    work_a_2166523021_3212880686_init();
    work_a_3222946569_3212880686_init();
    work_a_2750190074_3212880686_init();
    work_a_4106131694_2372691052_init();
    work_a_0832606739_3212880686_init();
    work_a_3500093725_3212880686_init();
    work_a_0186603999_2372691052_init();
    work_a_2209945435_3212880686_init();
    work_a_2004783041_3212880686_init();
    work_a_2950848275_3212880686_init();
    work_a_0790869286_3212880686_init();
    work_a_0431830435_3212880686_init();
    work_a_1985558087_2372691052_init();


    xsi_register_tops("work_a_1985558087_2372691052");

    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    IEEE_P_1242562249 = xsi_get_engine_memory("ieee_p_1242562249");
    STD_STANDARD = xsi_get_engine_memory("std_standard");
    IEEE_P_0774719531 = xsi_get_engine_memory("ieee_p_0774719531");
    IEEE_P_3499444699 = xsi_get_engine_memory("ieee_p_3499444699");
    WORK_P_0804141302 = xsi_get_engine_memory("work_p_0804141302");
    IEEE_P_3620187407 = xsi_get_engine_memory("ieee_p_3620187407");
    WORK_P_4053066488 = xsi_get_engine_memory("work_p_4053066488");

    return xsi_run_simulation(argc, argv);

}
