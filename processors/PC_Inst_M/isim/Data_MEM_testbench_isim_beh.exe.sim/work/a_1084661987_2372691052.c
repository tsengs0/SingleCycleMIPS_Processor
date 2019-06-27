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
static const char *ng0 = "C:/Users/BO-YU TSENG/Documents/FPGA/Xilinx/ATLYS/Prj/processors/PC_Inst_M/Data_MEM_testbench.vhd";



static void work_a_1084661987_2372691052_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    int64 t7;
    int64 t8;

LAB0:    t1 = (t0 + 3112U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(82, ng0);
    t2 = (t0 + 3744);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(83, ng0);
    t2 = (t0 + 2128U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 2920);
    xsi_process_wait(t2, t8);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(84, ng0);
    t2 = (t0 + 3744);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(85, ng0);
    t2 = (t0 + 2128U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 2920);
    xsi_process_wait(t2, t8);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    goto LAB2;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

}

static void work_a_1084661987_2372691052_p_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    int64 t10;

LAB0:    t1 = (t0 + 3360U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(94, ng0);
    t2 = (t0 + 6956);
    t4 = (32U != 32U);
    if (t4 == 1)
        goto LAB4;

LAB5:    t5 = (t0 + 3808);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 32U);
    xsi_driver_first_trans_delta(t5, 0U, 32U, 0LL);
    xsi_set_current_line(95, ng0);
    t2 = (t0 + 6988);
    t4 = (32U != 32U);
    if (t4 == 1)
        goto LAB6;

LAB7:    t5 = (t0 + 3872);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 32U);
    xsi_driver_first_trans_delta(t5, 0U, 32U, 0LL);
    xsi_set_current_line(96, ng0);
    t10 = (100 * 1000LL);
    t2 = (t0 + 3168);
    xsi_process_wait(t2, t10);

LAB10:    *((char **)t1) = &&LAB11;

LAB1:    return;
LAB4:    xsi_size_not_matching(32U, 32U, 0);
    goto LAB5;

LAB6:    xsi_size_not_matching(32U, 32U, 0);
    goto LAB7;

LAB8:    xsi_set_current_line(100, ng0);
    t10 = (200 * 1000LL);
    t2 = (t0 + 3168);
    xsi_process_wait(t2, t10);

LAB14:    *((char **)t1) = &&LAB15;
    goto LAB1;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

LAB12:    xsi_set_current_line(104, ng0);
    t10 = (50 * 1000LL);
    t2 = (t0 + 3168);
    xsi_process_wait(t2, t10);

LAB18:    *((char **)t1) = &&LAB19;
    goto LAB1;

LAB13:    goto LAB12;

LAB15:    goto LAB13;

LAB16:    xsi_set_current_line(107, ng0);
    t2 = (t0 + 7020);
    t4 = (32U != 32U);
    if (t4 == 1)
        goto LAB20;

LAB21:    t5 = (t0 + 3872);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 32U);
    xsi_driver_first_trans_delta(t5, 0U, 32U, 0LL);
    xsi_set_current_line(108, ng0);
    t2 = (t0 + 7052);
    t4 = (32U != 32U);
    if (t4 == 1)
        goto LAB22;

LAB23:    t5 = (t0 + 3808);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 32U);
    xsi_driver_first_trans_delta(t5, 0U, 32U, 0LL);
    xsi_set_current_line(110, ng0);
    t2 = (t0 + 3936);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(110, ng0);
    t2 = (t0 + 4000);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(111, ng0);
    t10 = (100 * 1000LL);
    t2 = (t0 + 3168);
    xsi_process_wait(t2, t10);

LAB26:    *((char **)t1) = &&LAB27;
    goto LAB1;

LAB17:    goto LAB16;

LAB19:    goto LAB17;

LAB20:    xsi_size_not_matching(32U, 32U, 0);
    goto LAB21;

LAB22:    xsi_size_not_matching(32U, 32U, 0);
    goto LAB23;

LAB24:    xsi_set_current_line(116, ng0);
    t2 = (t0 + 7084);
    t4 = (32U != 32U);
    if (t4 == 1)
        goto LAB28;

LAB29:    t5 = (t0 + 3872);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 32U);
    xsi_driver_first_trans_delta(t5, 0U, 32U, 0LL);
    xsi_set_current_line(117, ng0);
    t2 = (t0 + 7116);
    t4 = (32U != 32U);
    if (t4 == 1)
        goto LAB30;

LAB31:    t5 = (t0 + 3808);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 32U);
    xsi_driver_first_trans_delta(t5, 0U, 32U, 0LL);
    xsi_set_current_line(119, ng0);
    t2 = (t0 + 3936);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(119, ng0);
    t2 = (t0 + 4000);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(120, ng0);
    t10 = (100 * 1000LL);
    t2 = (t0 + 3168);
    xsi_process_wait(t2, t10);

LAB34:    *((char **)t1) = &&LAB35;
    goto LAB1;

LAB25:    goto LAB24;

LAB27:    goto LAB25;

LAB28:    xsi_size_not_matching(32U, 32U, 0);
    goto LAB29;

LAB30:    xsi_size_not_matching(32U, 32U, 0);
    goto LAB31;

LAB32:    xsi_set_current_line(125, ng0);
    t2 = (t0 + 7148);
    t4 = (32U != 32U);
    if (t4 == 1)
        goto LAB36;

LAB37:    t5 = (t0 + 3872);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 32U);
    xsi_driver_first_trans_delta(t5, 0U, 32U, 0LL);
    xsi_set_current_line(126, ng0);
    t2 = (t0 + 7180);
    t4 = (32U != 32U);
    if (t4 == 1)
        goto LAB38;

LAB39:    t5 = (t0 + 3808);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 32U);
    xsi_driver_first_trans_delta(t5, 0U, 32U, 0LL);
    xsi_set_current_line(128, ng0);
    t2 = (t0 + 3936);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(128, ng0);
    t2 = (t0 + 4000);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(129, ng0);
    t10 = (100 * 1000LL);
    t2 = (t0 + 3168);
    xsi_process_wait(t2, t10);

LAB42:    *((char **)t1) = &&LAB43;
    goto LAB1;

LAB33:    goto LAB32;

LAB35:    goto LAB33;

LAB36:    xsi_size_not_matching(32U, 32U, 0);
    goto LAB37;

LAB38:    xsi_size_not_matching(32U, 32U, 0);
    goto LAB39;

LAB40:    xsi_set_current_line(134, ng0);
    t2 = (t0 + 7212);
    t4 = (32U != 32U);
    if (t4 == 1)
        goto LAB44;

LAB45:    t5 = (t0 + 3872);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 32U);
    xsi_driver_first_trans_delta(t5, 0U, 32U, 0LL);
    xsi_set_current_line(135, ng0);
    t2 = (t0 + 7244);
    t4 = (32U != 32U);
    if (t4 == 1)
        goto LAB46;

LAB47:    t5 = (t0 + 3808);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 32U);
    xsi_driver_first_trans_delta(t5, 0U, 32U, 0LL);
    xsi_set_current_line(137, ng0);
    t2 = (t0 + 3936);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(137, ng0);
    t2 = (t0 + 4000);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(138, ng0);
    t10 = (100 * 1000LL);
    t2 = (t0 + 3168);
    xsi_process_wait(t2, t10);

LAB50:    *((char **)t1) = &&LAB51;
    goto LAB1;

LAB41:    goto LAB40;

LAB43:    goto LAB41;

LAB44:    xsi_size_not_matching(32U, 32U, 0);
    goto LAB45;

LAB46:    xsi_size_not_matching(32U, 32U, 0);
    goto LAB47;

LAB48:    xsi_set_current_line(142, ng0);
    t2 = (t0 + 3936);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(142, ng0);
    t2 = (t0 + 4000);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(143, ng0);
    t2 = (t0 + 7276);
    t4 = (32U != 32U);
    if (t4 == 1)
        goto LAB52;

LAB53:    t5 = (t0 + 3808);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 32U);
    xsi_driver_first_trans_delta(t5, 0U, 32U, 0LL);
    xsi_set_current_line(144, ng0);
    t2 = (t0 + 7308);
    t4 = (32U != 32U);
    if (t4 == 1)
        goto LAB54;

LAB55:    t5 = (t0 + 3872);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 32U);
    xsi_driver_first_trans_delta(t5, 0U, 32U, 0LL);
    xsi_set_current_line(145, ng0);
    t10 = (200 * 1000LL);
    t2 = (t0 + 3168);
    xsi_process_wait(t2, t10);

LAB58:    *((char **)t1) = &&LAB59;
    goto LAB1;

LAB49:    goto LAB48;

LAB51:    goto LAB49;

LAB52:    xsi_size_not_matching(32U, 32U, 0);
    goto LAB53;

LAB54:    xsi_size_not_matching(32U, 32U, 0);
    goto LAB55;

LAB56:    xsi_set_current_line(150, ng0);
    t2 = (t0 + 3936);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(150, ng0);
    t2 = (t0 + 4000);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(151, ng0);
    t2 = (t0 + 7340);
    t4 = (32U != 32U);
    if (t4 == 1)
        goto LAB60;

LAB61:    t5 = (t0 + 3808);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 32U);
    xsi_driver_first_trans_delta(t5, 0U, 32U, 0LL);
    xsi_set_current_line(152, ng0);
    t10 = (100 * 1000LL);
    t2 = (t0 + 3168);
    xsi_process_wait(t2, t10);

LAB64:    *((char **)t1) = &&LAB65;
    goto LAB1;

LAB57:    goto LAB56;

LAB59:    goto LAB57;

LAB60:    xsi_size_not_matching(32U, 32U, 0);
    goto LAB61;

LAB62:    xsi_set_current_line(155, ng0);
    t2 = (t0 + 3936);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(155, ng0);
    t2 = (t0 + 4000);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(156, ng0);
    t2 = (t0 + 7372);
    t4 = (32U != 32U);
    if (t4 == 1)
        goto LAB66;

LAB67:    t5 = (t0 + 3808);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 32U);
    xsi_driver_first_trans_delta(t5, 0U, 32U, 0LL);
    xsi_set_current_line(157, ng0);
    t10 = (100 * 1000LL);
    t2 = (t0 + 3168);
    xsi_process_wait(t2, t10);

LAB70:    *((char **)t1) = &&LAB71;
    goto LAB1;

LAB63:    goto LAB62;

LAB65:    goto LAB63;

LAB66:    xsi_size_not_matching(32U, 32U, 0);
    goto LAB67;

LAB68:    xsi_set_current_line(160, ng0);
    t2 = (t0 + 3936);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(160, ng0);
    t2 = (t0 + 4000);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(161, ng0);
    t2 = (t0 + 7404);
    t4 = (32U != 32U);
    if (t4 == 1)
        goto LAB72;

LAB73:    t5 = (t0 + 3808);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 32U);
    xsi_driver_first_trans_delta(t5, 0U, 32U, 0LL);
    xsi_set_current_line(162, ng0);
    t10 = (100 * 1000LL);
    t2 = (t0 + 3168);
    xsi_process_wait(t2, t10);

LAB76:    *((char **)t1) = &&LAB77;
    goto LAB1;

LAB69:    goto LAB68;

LAB71:    goto LAB69;

LAB72:    xsi_size_not_matching(32U, 32U, 0);
    goto LAB73;

LAB74:    xsi_set_current_line(165, ng0);
    t2 = (t0 + 3936);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(165, ng0);
    t2 = (t0 + 4000);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(166, ng0);
    t2 = (t0 + 7436);
    t4 = (32U != 32U);
    if (t4 == 1)
        goto LAB78;

LAB79:    t5 = (t0 + 3808);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 32U);
    xsi_driver_first_trans_delta(t5, 0U, 32U, 0LL);
    xsi_set_current_line(167, ng0);
    t10 = (100 * 1000LL);
    t2 = (t0 + 3168);
    xsi_process_wait(t2, t10);

LAB82:    *((char **)t1) = &&LAB83;
    goto LAB1;

LAB75:    goto LAB74;

LAB77:    goto LAB75;

LAB78:    xsi_size_not_matching(32U, 32U, 0);
    goto LAB79;

LAB80:    xsi_set_current_line(170, ng0);
    t2 = (t0 + 3936);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(170, ng0);
    t2 = (t0 + 4000);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(171, ng0);
    t2 = (t0 + 7468);
    t4 = (32U != 32U);
    if (t4 == 1)
        goto LAB84;

LAB85:    t5 = (t0 + 3808);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 32U);
    xsi_driver_first_trans_delta(t5, 0U, 32U, 0LL);
    xsi_set_current_line(173, ng0);

LAB88:    *((char **)t1) = &&LAB89;
    goto LAB1;

LAB81:    goto LAB80;

LAB83:    goto LAB81;

LAB84:    xsi_size_not_matching(32U, 32U, 0);
    goto LAB85;

LAB86:    goto LAB2;

LAB87:    goto LAB86;

LAB89:    goto LAB87;

}


extern void work_a_1084661987_2372691052_init()
{
	static char *pe[] = {(void *)work_a_1084661987_2372691052_p_0,(void *)work_a_1084661987_2372691052_p_1};
	xsi_register_didat("work_a_1084661987_2372691052", "isim/Data_MEM_testbench_isim_beh.exe.sim/work/a_1084661987_2372691052.didat");
	xsi_register_executes(pe);
}
