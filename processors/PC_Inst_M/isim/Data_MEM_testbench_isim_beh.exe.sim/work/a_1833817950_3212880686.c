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

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/BO-YU TSENG/Documents/FPGA/Xilinx/ATLYS/Prj/processors/PC_Inst_M/Data_MEM.vhd";
extern char *IEEE_P_3620187407;

int ieee_p_3620187407_sub_514432868_3965413181(char *, char *, char *);


static void work_a_1833817950_3212880686_p_0(char *t0)
{
    char t25[16];
    char t38[16];
    unsigned char t1;
    unsigned char t2;
    unsigned char t3;
    char *t4;
    unsigned char t5;
    char *t6;
    char *t7;
    unsigned char t8;
    unsigned char t9;
    char *t10;
    unsigned char t11;
    unsigned char t12;
    char *t13;
    unsigned char t14;
    unsigned char t15;
    char *t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    char *t20;
    char *t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    char *t26;
    char *t27;
    int t28;
    unsigned int t29;
    int t30;
    int t31;
    unsigned int t32;
    unsigned int t33;
    char *t34;
    char *t35;
    char *t36;
    char *t37;
    int t39;
    unsigned int t40;
    int t41;
    int t42;
    unsigned int t43;
    unsigned int t44;

LAB0:    xsi_set_current_line(52, ng0);
    t4 = (t0 + 992U);
    t5 = xsi_signal_has_event(t4);
    if (t5 == 1)
        goto LAB11;

LAB12:    t3 = (unsigned char)0;

LAB13:    if (t3 == 1)
        goto LAB8;

LAB9:    t2 = (unsigned char)0;

LAB10:    if (t2 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(55, ng0);
    t4 = (t0 + 1992U);
    t6 = *((char **)t4);
    t4 = (t0 + 1192U);
    t7 = *((char **)t4);
    t17 = (31 - 31);
    t18 = (t17 * 1U);
    t19 = (0 + t18);
    t4 = (t7 + t19);
    t10 = (t25 + 0U);
    t13 = (t10 + 0U);
    *((int *)t13) = 31;
    t13 = (t10 + 4U);
    *((int *)t13) = 2;
    t13 = (t10 + 8U);
    *((int *)t13) = -1;
    t28 = (2 - 31);
    t22 = (t28 * -1);
    t22 = (t22 + 1);
    t13 = (t10 + 12U);
    *((unsigned int *)t13) = t22;
    t30 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t4, t25);
    t31 = (t30 - 0);
    t22 = (t31 * 1);
    xsi_vhdl_check_range_of_index(0, 255, 1, t30);
    t23 = (32U * t22);
    t24 = (0 + t23);
    t13 = (t6 + t24);
    t16 = (t0 + 1192U);
    t20 = *((char **)t16);
    t29 = (31 - 31);
    t32 = (t29 * 1U);
    t33 = (0 + t32);
    t16 = (t20 + t33);
    t21 = (t38 + 0U);
    t26 = (t21 + 0U);
    *((int *)t26) = 31;
    t26 = (t21 + 4U);
    *((int *)t26) = 2;
    t26 = (t21 + 8U);
    *((int *)t26) = -1;
    t39 = (2 - 31);
    t40 = (t39 * -1);
    t40 = (t40 + 1);
    t26 = (t21 + 12U);
    *((unsigned int *)t26) = t40;
    t41 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t16, t38);
    t42 = (t41 - 0);
    t40 = (t42 * 1);
    t43 = (32U * t40);
    t44 = (0U + t43);
    t26 = (t0 + 3816);
    t27 = (t26 + 56U);
    t34 = *((char **)t27);
    t35 = (t34 + 56U);
    t36 = *((char **)t35);
    memcpy(t36, t13, 32U);
    xsi_driver_first_trans_delta(t26, t44, 32U, 0LL);

LAB3:    t4 = (t0 + 3720);
    *((int *)t4) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(53, ng0);
    t6 = (t0 + 1672U);
    t16 = *((char **)t6);
    t17 = (31 - 31);
    t18 = (t17 * 1U);
    t19 = (0 + t18);
    t6 = (t16 + t19);
    t20 = (t0 + 1192U);
    t21 = *((char **)t20);
    t22 = (31 - 31);
    t23 = (t22 * 1U);
    t24 = (0 + t23);
    t20 = (t21 + t24);
    t26 = (t25 + 0U);
    t27 = (t26 + 0U);
    *((int *)t27) = 31;
    t27 = (t26 + 4U);
    *((int *)t27) = 2;
    t27 = (t26 + 8U);
    *((int *)t27) = -1;
    t28 = (2 - 31);
    t29 = (t28 * -1);
    t29 = (t29 + 1);
    t27 = (t26 + 12U);
    *((unsigned int *)t27) = t29;
    t30 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t20, t25);
    t31 = (t30 - 0);
    t29 = (t31 * 1);
    t32 = (32U * t29);
    t33 = (0U + t32);
    t27 = (t0 + 3816);
    t34 = (t27 + 56U);
    t35 = *((char **)t34);
    t36 = (t35 + 56U);
    t37 = *((char **)t36);
    memcpy(t37, t6, 32U);
    xsi_driver_first_trans_delta(t27, t33, 32U, 0LL);
    goto LAB3;

LAB5:    t6 = (t0 + 1512U);
    t13 = *((char **)t6);
    t14 = *((unsigned char *)t13);
    t15 = (t14 == (unsigned char)3);
    t1 = t15;
    goto LAB7;

LAB8:    t6 = (t0 + 1352U);
    t10 = *((char **)t6);
    t11 = *((unsigned char *)t10);
    t12 = (t11 == (unsigned char)2);
    t2 = t12;
    goto LAB10;

LAB11:    t6 = (t0 + 1032U);
    t7 = *((char **)t6);
    t8 = *((unsigned char *)t7);
    t9 = (t8 == (unsigned char)2);
    t3 = t9;
    goto LAB13;

}

static void work_a_1833817950_3212880686_p_1(char *t0)
{
    char t21[16];
    unsigned char t1;
    unsigned char t2;
    unsigned char t3;
    char *t4;
    unsigned char t5;
    char *t6;
    char *t7;
    unsigned char t8;
    unsigned char t9;
    char *t10;
    unsigned char t11;
    unsigned char t12;
    char *t13;
    unsigned char t14;
    unsigned char t15;
    char *t16;
    char *t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    char *t22;
    char *t23;
    int t24;
    unsigned int t25;
    int t26;
    int t27;
    unsigned int t28;
    unsigned int t29;
    char *t30;
    char *t31;
    char *t32;
    char *t33;
    char *t34;

LAB0:    xsi_set_current_line(62, ng0);
    t4 = (t0 + 992U);
    t5 = xsi_signal_has_event(t4);
    if (t5 == 1)
        goto LAB11;

LAB12:    t3 = (unsigned char)0;

LAB13:    if (t3 == 1)
        goto LAB8;

LAB9:    t2 = (unsigned char)0;

LAB10:    if (t2 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:
LAB3:    t4 = (t0 + 3736);
    *((int *)t4) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(63, ng0);
    t6 = (t0 + 1992U);
    t16 = *((char **)t6);
    t6 = (t0 + 1192U);
    t17 = *((char **)t6);
    t18 = (31 - 31);
    t19 = (t18 * 1U);
    t20 = (0 + t19);
    t6 = (t17 + t20);
    t22 = (t21 + 0U);
    t23 = (t22 + 0U);
    *((int *)t23) = 31;
    t23 = (t22 + 4U);
    *((int *)t23) = 2;
    t23 = (t22 + 8U);
    *((int *)t23) = -1;
    t24 = (2 - 31);
    t25 = (t24 * -1);
    t25 = (t25 + 1);
    t23 = (t22 + 12U);
    *((unsigned int *)t23) = t25;
    t26 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t6, t21);
    t27 = (t26 - 0);
    t25 = (t27 * 1);
    xsi_vhdl_check_range_of_index(0, 255, 1, t26);
    t28 = (32U * t25);
    t29 = (0 + t28);
    t23 = (t16 + t29);
    t30 = (t0 + 3880);
    t31 = (t30 + 56U);
    t32 = *((char **)t31);
    t33 = (t32 + 56U);
    t34 = *((char **)t33);
    memcpy(t34, t23, 32U);
    xsi_driver_first_trans_delta(t30, 0U, 32U, 0LL);
    goto LAB3;

LAB5:    t6 = (t0 + 1512U);
    t13 = *((char **)t6);
    t14 = *((unsigned char *)t13);
    t15 = (t14 == (unsigned char)2);
    t1 = t15;
    goto LAB7;

LAB8:    t6 = (t0 + 1352U);
    t10 = *((char **)t6);
    t11 = *((unsigned char *)t10);
    t12 = (t11 == (unsigned char)3);
    t2 = t12;
    goto LAB10;

LAB11:    t6 = (t0 + 1032U);
    t7 = *((char **)t6);
    t8 = *((unsigned char *)t7);
    t9 = (t8 == (unsigned char)2);
    t3 = t9;
    goto LAB13;

}


extern void work_a_1833817950_3212880686_init()
{
	static char *pe[] = {(void *)work_a_1833817950_3212880686_p_0,(void *)work_a_1833817950_3212880686_p_1};
	xsi_register_didat("work_a_1833817950_3212880686", "isim/Data_MEM_testbench_isim_beh.exe.sim/work/a_1833817950_3212880686.didat");
	xsi_register_executes(pe);
}
