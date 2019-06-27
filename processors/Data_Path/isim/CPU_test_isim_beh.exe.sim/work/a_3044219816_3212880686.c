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
static const char *ng0 = "C:/Users/BO-YU TSENG/Documents/Lecture/I467/final_report/processors/Data_Path/ALU_control.vhd";



static void work_a_3044219816_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    int t4;
    char *t5;
    char *t6;
    int t7;
    char *t8;
    char *t9;
    int t10;
    char *t11;
    unsigned char t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    int t19;
    int t20;
    int t21;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;

LAB0:    xsi_set_current_line(45, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 4908);
    t4 = xsi_mem_cmp(t1, t2, 2U);
    if (t4 == 1)
        goto LAB3;

LAB7:    t5 = (t0 + 4910);
    t7 = xsi_mem_cmp(t5, t2, 2U);
    if (t7 == 1)
        goto LAB4;

LAB8:    t8 = (t0 + 4912);
    t10 = xsi_mem_cmp(t8, t2, 2U);
    if (t10 == 1)
        goto LAB5;

LAB9:
LAB6:    xsi_set_current_line(58, ng0);
    t1 = (t0 + 4986);
    t13 = (4U != 4U);
    if (t13 == 1)
        goto LAB44;

LAB45:    t3 = (t0 + 2912);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 4U);
    xsi_driver_first_trans_delta(t3, 0U, 4U, 0LL);

LAB2:    t1 = (t0 + 2832);
    *((int *)t1) = 1;

LAB1:    return;
LAB3:    xsi_set_current_line(46, ng0);
    t11 = (t0 + 4914);
    t13 = (4U != 4U);
    if (t13 == 1)
        goto LAB11;

LAB12:    t14 = (t0 + 2912);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    memcpy(t18, t11, 4U);
    xsi_driver_first_trans_delta(t14, 0U, 4U, 0LL);
    goto LAB2;

LAB4:    xsi_set_current_line(47, ng0);
    t1 = (t0 + 4918);
    t13 = (4U != 4U);
    if (t13 == 1)
        goto LAB13;

LAB14:    t3 = (t0 + 2912);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 4U);
    xsi_driver_first_trans_delta(t3, 0U, 4U, 0LL);
    goto LAB2;

LAB5:    xsi_set_current_line(49, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t1 = (t0 + 4922);
    t4 = xsi_mem_cmp(t1, t2, 6U);
    if (t4 == 1)
        goto LAB16;

LAB23:    t5 = (t0 + 4928);
    t7 = xsi_mem_cmp(t5, t2, 6U);
    if (t7 == 1)
        goto LAB17;

LAB24:    t8 = (t0 + 4934);
    t10 = xsi_mem_cmp(t8, t2, 6U);
    if (t10 == 1)
        goto LAB18;

LAB25:    t11 = (t0 + 4940);
    t19 = xsi_mem_cmp(t11, t2, 6U);
    if (t19 == 1)
        goto LAB19;

LAB26:    t14 = (t0 + 4946);
    t20 = xsi_mem_cmp(t14, t2, 6U);
    if (t20 == 1)
        goto LAB20;

LAB27:    t16 = (t0 + 4952);
    t21 = xsi_mem_cmp(t16, t2, 6U);
    if (t21 == 1)
        goto LAB21;

LAB28:
LAB22:    xsi_set_current_line(56, ng0);
    t1 = (t0 + 4982);
    t13 = (4U != 4U);
    if (t13 == 1)
        goto LAB42;

LAB43:    t3 = (t0 + 2912);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 4U);
    xsi_driver_first_trans_delta(t3, 0U, 4U, 0LL);

LAB15:    goto LAB2;

LAB10:;
LAB11:    xsi_size_not_matching(4U, 4U, 0);
    goto LAB12;

LAB13:    xsi_size_not_matching(4U, 4U, 0);
    goto LAB14;

LAB16:    xsi_set_current_line(50, ng0);
    t18 = (t0 + 4958);
    t13 = (4U != 4U);
    if (t13 == 1)
        goto LAB30;

LAB31:    t23 = (t0 + 2912);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    t26 = (t25 + 56U);
    t27 = *((char **)t26);
    memcpy(t27, t18, 4U);
    xsi_driver_first_trans_delta(t23, 0U, 4U, 0LL);
    goto LAB15;

LAB17:    xsi_set_current_line(51, ng0);
    t1 = (t0 + 4962);
    t13 = (4U != 4U);
    if (t13 == 1)
        goto LAB32;

LAB33:    t3 = (t0 + 2912);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 4U);
    xsi_driver_first_trans_delta(t3, 0U, 4U, 0LL);
    goto LAB15;

LAB18:    xsi_set_current_line(52, ng0);
    t1 = (t0 + 4966);
    t13 = (4U != 4U);
    if (t13 == 1)
        goto LAB34;

LAB35:    t3 = (t0 + 2912);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 4U);
    xsi_driver_first_trans_delta(t3, 0U, 4U, 0LL);
    goto LAB15;

LAB19:    xsi_set_current_line(53, ng0);
    t1 = (t0 + 4970);
    t13 = (4U != 4U);
    if (t13 == 1)
        goto LAB36;

LAB37:    t3 = (t0 + 2912);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 4U);
    xsi_driver_first_trans_delta(t3, 0U, 4U, 0LL);
    goto LAB15;

LAB20:    xsi_set_current_line(54, ng0);
    t1 = (t0 + 4974);
    t13 = (4U != 4U);
    if (t13 == 1)
        goto LAB38;

LAB39:    t3 = (t0 + 2912);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 4U);
    xsi_driver_first_trans_delta(t3, 0U, 4U, 0LL);
    goto LAB15;

LAB21:    xsi_set_current_line(55, ng0);
    t1 = (t0 + 4978);
    t13 = (4U != 4U);
    if (t13 == 1)
        goto LAB40;

LAB41:    t3 = (t0 + 2912);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 4U);
    xsi_driver_first_trans_delta(t3, 0U, 4U, 0LL);
    goto LAB15;

LAB29:;
LAB30:    xsi_size_not_matching(4U, 4U, 0);
    goto LAB31;

LAB32:    xsi_size_not_matching(4U, 4U, 0);
    goto LAB33;

LAB34:    xsi_size_not_matching(4U, 4U, 0);
    goto LAB35;

LAB36:    xsi_size_not_matching(4U, 4U, 0);
    goto LAB37;

LAB38:    xsi_size_not_matching(4U, 4U, 0);
    goto LAB39;

LAB40:    xsi_size_not_matching(4U, 4U, 0);
    goto LAB41;

LAB42:    xsi_size_not_matching(4U, 4U, 0);
    goto LAB43;

LAB44:    xsi_size_not_matching(4U, 4U, 0);
    goto LAB45;

}


extern void work_a_3044219816_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3044219816_3212880686_p_0};
	xsi_register_didat("work_a_3044219816_3212880686", "isim/CPU_test_isim_beh.exe.sim/work/a_3044219816_3212880686.didat");
	xsi_register_executes(pe);
}
