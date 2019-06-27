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
static const char *ng0 = "C:/Users/BO-YU TSENG/Documents/Lecture/I467/final_report/processors/REG_FILE/REG_FILE.vhd";
extern char *IEEE_P_3620187407;

unsigned char ieee_p_3620187407_sub_4042748798_3965413181(char *, char *, char *, char *, char *);
int ieee_p_3620187407_sub_514432868_3965413181(char *, char *, char *);


static void work_a_3412061098_3212880686_p_0(char *t0)
{
    char t15[16];
    unsigned char t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    unsigned char t8;
    char *t9;
    unsigned char t10;
    unsigned char t11;
    char *t12;
    char *t13;
    char *t16;
    char *t17;
    int t18;
    unsigned int t19;
    unsigned char t20;
    char *t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;
    char *t25;
    int t26;
    int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    char *t31;
    char *t32;
    char *t33;
    char *t34;
    char *t35;

LAB0:    xsi_set_current_line(92, ng0);
    t2 = (t0 + 2112U);
    t3 = xsi_signal_has_event(t2);
    if (t3 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:
LAB3:    t2 = (t0 + 4200);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(93, ng0);
    t4 = (t0 + 1672U);
    t9 = *((char **)t4);
    t10 = *((unsigned char *)t9);
    t11 = (t10 == (unsigned char)3);
    if (t11 == 1)
        goto LAB11;

LAB12:    t8 = (unsigned char)0;

LAB13:    if (t8 != 0)
        goto LAB8;

LAB10:
LAB9:    goto LAB3;

LAB5:    t4 = (t0 + 2152U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)3);
    t1 = t7;
    goto LAB7;

LAB8:    xsi_set_current_line(94, ng0);
    t17 = (t0 + 1512U);
    t21 = *((char **)t17);
    t19 = (31 - 31);
    t22 = (t19 * 1U);
    t23 = (0 + t22);
    t17 = (t21 + t23);
    t24 = (t0 + 1352U);
    t25 = *((char **)t24);
    t24 = (t0 + 7500U);
    t26 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t25, t24);
    t27 = (t26 - 0);
    t28 = (t27 * 1);
    t29 = (32U * t28);
    t30 = (0U + t29);
    t31 = (t0 + 4296);
    t32 = (t31 + 56U);
    t33 = *((char **)t32);
    t34 = (t33 + 56U);
    t35 = *((char **)t34);
    memcpy(t35, t17, 32U);
    xsi_driver_first_trans_delta(t31, t30, 32U, 0LL);
    goto LAB9;

LAB11:    t4 = (t0 + 1352U);
    t12 = *((char **)t4);
    t4 = (t0 + 7500U);
    t13 = (t0 + 8678);
    t16 = (t15 + 0U);
    t17 = (t16 + 0U);
    *((int *)t17) = 0;
    t17 = (t16 + 4U);
    *((int *)t17) = 4;
    t17 = (t16 + 8U);
    *((int *)t17) = 1;
    t18 = (4 - 0);
    t19 = (t18 * 1);
    t19 = (t19 + 1);
    t17 = (t16 + 12U);
    *((unsigned int *)t17) = t19;
    t20 = ieee_p_3620187407_sub_4042748798_3965413181(IEEE_P_3620187407, t12, t4, t13, t15);
    t8 = t20;
    goto LAB13;

}

static void work_a_3412061098_3212880686_p_1(char *t0)
{
    unsigned char t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    char *t8;
    char *t9;
    int t10;
    int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;

LAB0:    xsi_set_current_line(102, ng0);
    t2 = (t0 + 2112U);
    t3 = xsi_signal_has_event(t2);
    if (t3 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(106, ng0);
    t2 = (t0 + 8683);
    t1 = (32U != 32U);
    if (t1 == 1)
        goto LAB8;

LAB9:    t5 = (t0 + 4360);
    t8 = (t5 + 56U);
    t9 = *((char **)t8);
    t15 = (t9 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t2, 32U);
    xsi_driver_first_trans_delta(t5, 0U, 32U, 0LL);
    xsi_set_current_line(107, ng0);
    t2 = (t0 + 8715);
    t1 = (32U != 32U);
    if (t1 == 1)
        goto LAB10;

LAB11:    t5 = (t0 + 4424);
    t8 = (t5 + 56U);
    t9 = *((char **)t8);
    t15 = (t9 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t2, 32U);
    xsi_driver_first_trans_delta(t5, 0U, 32U, 0LL);

LAB3:    t2 = (t0 + 4216);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(103, ng0);
    t4 = (t0 + 2472U);
    t8 = *((char **)t4);
    t4 = (t0 + 1032U);
    t9 = *((char **)t4);
    t4 = (t0 + 7468U);
    t10 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t9, t4);
    t11 = (t10 - 0);
    t12 = (t11 * 1);
    xsi_vhdl_check_range_of_index(0, 31, 1, t10);
    t13 = (32U * t12);
    t14 = (0 + t13);
    t15 = (t8 + t14);
    t16 = (t0 + 4360);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    memcpy(t20, t15, 32U);
    xsi_driver_first_trans_delta(t16, 0U, 32U, 0LL);
    xsi_set_current_line(104, ng0);
    t2 = (t0 + 2472U);
    t4 = *((char **)t2);
    t2 = (t0 + 1192U);
    t5 = *((char **)t2);
    t2 = (t0 + 7484U);
    t10 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t5, t2);
    t11 = (t10 - 0);
    t12 = (t11 * 1);
    xsi_vhdl_check_range_of_index(0, 31, 1, t10);
    t13 = (32U * t12);
    t14 = (0 + t13);
    t8 = (t4 + t14);
    t9 = (t0 + 4424);
    t15 = (t9 + 56U);
    t16 = *((char **)t15);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    memcpy(t18, t8, 32U);
    xsi_driver_first_trans_delta(t9, 0U, 32U, 0LL);
    goto LAB3;

LAB5:    t4 = (t0 + 2152U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)2);
    t1 = t7;
    goto LAB7;

LAB8:    xsi_size_not_matching(32U, 32U, 0);
    goto LAB9;

LAB10:    xsi_size_not_matching(32U, 32U, 0);
    goto LAB11;

}


extern void work_a_3412061098_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3412061098_3212880686_p_0,(void *)work_a_3412061098_3212880686_p_1};
	xsi_register_didat("work_a_3412061098_3212880686", "isim/CPU_test_isim_beh.exe.sim/work/a_3412061098_3212880686.didat");
	xsi_register_executes(pe);
}
