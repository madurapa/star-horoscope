#pragma once
// STAR.EXE Phase 3 — ephemeris core (Sun + 8 planets via sub_220B3 + nodes).
// Provenance: PROGRAM Sun block (0x11d57-0x12100), sub_195D3 element blocks,
// sub_220B3 solver, sub_195D3 node block (0x1a265-0x1a328).
// CRITICAL: IDA FLIRT swapped the Sin/Cos runtime names (@Sin$q4Real is at
// 0x26b36 and computes COSINE; @Cos$q4Real is at 0x26b49 and computes SINE -
// proven by runtime small-x shortcut + Sun 0.67" closure + tan-half structure).
// Blueprint @Sin calls are therefore emitted as cos() and @Cos as sin() below.
// All immediates are exact real48 decodes. Angles in degrees; trig in radians
// via kR2D = 57.29577951307874 (dseg 27C52).
// GENERATED FROM ASM — DO NOT HAND-EDIT the t1..t276 bodies below: machine
// translation of sub_220B3/sunResult/moonSayana where rounding order is load-bearing.
// PROVENANCE: DECODED (PROGRAM 0x11d57-0x12100 Sun block, sub_195D3 elements/nodes,
// sub_220B3 solver; exact real48 immediates throughout, Sin/Cos swap per header).

#include <cmath>
#include <map>
#include <string>
#include "Ayanamsa.hpp"

namespace star {
// PROVENANCE: DECODED (dseg 27C52).
inline constexpr double kR2D = 57.29577951307874;
inline double intr(double x) { return std::trunc(x); }  // Pascal Int() truncates toward zero

struct PlanetElements {
  double L0,L1,L2,L3,e0,e1,e2,e3,i0,i1,i2,i3,
         O0,O1,O2,O3,M0,M1,M2,M3,a,type;
};
// Planet elements database - single inline instance + accessor.
// PROVENANCE: DECODED (exact real48 element decodes, sub_195D3 blocks).
inline const std::map<std::string, PlanetElements> kPlanetElements = {
    {"Budha", {178.17907799989916, 149474.07078003883, 0.0003011000000001651, 0.0, 0.20561421000002156, 2.0462999999998344e-05, -2.9999999999984466e-08, 0.0, 7.002881000000343, 0.0018607999999993297, -1.8299999999984466e-05, 0.0, 47.14594399998896, 1.185208299999431, 0.00017390000000006012, 0.0, 102.27937999996357, 149472.5152900219, 7.000000000000062e-06, 0.0, 0.38709860000017215, 1.0}},
    {"Sikuru", {342.7670530001633, 58519.211910009384, 0.0003096999999998573, 0.0, 0.006820689999997853, -4.7699999999983866e-05, 9.099998999999304e-08, 0.0, 3.3936309999990044, 0.0010057999999997236, -9.999999999992654e-07, 0.0, 75.77964700001758, 0.8998498999999356, 0.00041000000000002146, 0.0, 212.60321999993175, 58517.8038700223, 0.0012860000000003424, 0.0, 0.723331600000165, 2.0}},
    {"Kuja", {293.7373339999467, 19141.69550999999, 0.0003106999999999971, 0.0, 0.09331288999999288, 9.206398999994647e-05, -7.700000000001976e-08, 0.0, 1.8503330000003189, -0.0006750000000002032, 1.2600000000001499e-05, 0.0, 48.78644200001145, 0.7709917000001951, -1.4000000000003593e-06, -5.3299999999978365e-06, 319.5191299999133, 19139.85475000739, 0.00018099999999998673, 0.0, 1.523688299999776, 3.0}},
    {"Guru", {238.04925699997693, 3036.301986001432, 0.00033469999999979905, -1.6500000000006093e-06, 0.048334749999980886, 0.00016418000000006927, -4.675999999998598e-07, -1.7000000000003395e-09, 1.308736000000863, -0.005696100000001536, 3.900000000001125e-06, 0.0, 99.44341399997938, 1.0105299999995623, 0.00035221999999990317, -8.510000000003237e-06, 225.32832999993116, 3034.6920199990273, -0.0007220000999996756, 0.0, 5.202560999998241, 4.0}},
    {"Shani", {266.56437700008973, 1223.5098839998245, 0.00032450000000006085, -5.800000000000249e-06, 0.05589231999999811, -0.00034549999999988756, -7.280000000001868e-07, 7.400000000000979e-10, 2.4925189999994473, -0.003918900000002168, -1.5490000000006887e-05, 3.999999999997929e-08, 112.79041400004644, 0.8731950999999754, -0.00015217999999994625, -5.310000000001425e-06, 175.46622000006028, 1221.5514700002968, -0.0005020000000000024, 0.0, 9.554745999994338, 5.0}},
    {"Urenus", {243.49747000006028, 429.86354599986225, 0.000316000000000205, -5.999999999999062e-07, 0.0463444000000095, -2.657999999999827e-05, -7.700000000001976e-08, 0.0, 0.7724639999996725, 0.0006253000000002729, 3.9500000000025626e-05, 0.0, 73.4771109999856, 0.4986678000000211, 0.0013117000000004708, 0.0, 0.0, 0.0, 0.0, 0.0, 19.218140000011772, 6.0}},
    {"Neptun", {84.95799469994381, 219.88591399998404, 0.00032049999999994583, 5.999999999999062e-07, 0.008977040000004877, 6.3299999999988366e-06, -2.0000000000009973e-09, 0.0, 1.7792420000005222, -0.009543598999997016, -9.099999999997999e-06, 0.0, 130.68138900003396, 1.0989358000006177, 0.0002498700000002074, 4.718000000000777e-06, 0.0, 0.0, 0.0, 0.0, 30.10957000000053, 7.0}},
    {"Pluto", {181.64632000005804, 0.0, 0.0, 0.0, 0.2502359999998589, 0.0, 0.0, 0.0, 17.169900000008056, 0.0, 0.0, 0.0, 109.88561999995727, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 39.43871000001673, 8.0}},
  };


// Accessor for backward compatibility (returns the inline table above).
inline const std::map<std::string, PlanetElements>& getPlanetElements() {
  return kPlanetElements;
}


struct SunResult { double lon = 0.0, M = 0.0, Ceq = 0.0, MplusC = 0.0, ecc = 0.0; };
inline SunResult sunResult(double T) {
  double L0sun = 0.0, Msun = 0.0, Ceq = 0.0, ecc = 0.0, sun = 0.0;
  double t1 = (0.00030250000000009436) * (T);
  double t2 = (t1) * (T);
  double t3 = (36000.76892000437) * (T);
  double t4 = (t3) + (279.69668000005186);
  double t5 = (t4) + (t2);
  L0sun = t5;
  double t6 = (L0sun) / (360.0);
  double t7 = intr(t6);
  double t8 = (L0sun) / (360.0);
  double t9 = (t8) - (t7);
  double t10 = (t9) * (360.0);
  L0sun = t10;
  double t11 = (3.3000000000012186e-06) * (T);
  double t12 = (t11) * (T);
  double t13 = (t12) * (T);
  double t14 = (0.0001500000000000945) * (T);
  double t15 = (t14) * (T);
  double t16 = (35999.049749970436) * (T);
  double t17 = (t16) + (358.4758299998939);
  double t18 = (t17) - (t15);
  double t19 = (t18) - (t13);
  Msun = t19;
  double t20 = (Msun) / (360.0);
  double t21 = intr(t20);
  double t22 = (Msun) / (360.0);
  double t23 = (t22) - (t21);
  double t24 = (t23) * (360.0);
  Msun = t24;
  double t25 = (1.2600000000003234e-07) * (T);
  double t26 = (t25) * (T);
  double t27 = (4.179999999998074e-05) * (T);
  double t28 = (0.016751040000002604) - (t27);
  double t29 = (t28) - (t26);
  ecc = t29;
  double t30 = (3.0) * (Msun);
  double t31 = (t30) / (kR2D);
  double t32 = sin(t31);
  double t33 = (t32) * (0.00029300000000009874);
  double t34 = (2.0) * (Msun);
  double t35 = (t34) / (kR2D);
  double t36 = sin(t35);
  double t37 = (9.999999999998899e-05) * (T);
  double t38 = (0.02009400000000028) - (t37);
  double t39 = (t38) * (t36);
  double t40 = (Msun) / (kR2D);
  double t41 = sin(t40);
  double t42 = (1.4000000000000123e-05) * (T);
  double t43 = (t42) * (T);
  double t44 = (0.004789000000002375) * (T);
  double t45 = (1.9194599999991624) - (t44);
  double t46 = (t45) - (t43);
  double t47 = (t46) * (t41);
  double t48 = (t47) + (t39);
  double t49 = (t48) + (t33);
  Ceq = t49;
  double t50 = (L0sun) + (Ceq);
  sun = t50;
  SunResult r; r.lon = sun; r.M = Msun; r.Ceq = Ceq; r.MplusC = Msun + Ceq; r.ecc = ecc;
  return r;
}
[[nodiscard]] inline double earthRadius(double ecc, double MplusCdeg) {
  // 27C7C = K*(1-e^2)/(e*cos(27C46)+1); 27C46 = M + Ceq (NOT pure M).
  return 1.000000199999704 * (1.0 - ecc * ecc) / (ecc * std::cos(MplusCdeg / kR2D) + 1.0);
}


[[nodiscard]] inline double planetSayana(const PlanetElements& el, double T,
                                          double jd, double sunLon, double Rsun,
                                          bool nirayana) {
  double ayan = AyanamsaExact(jd);
  double fA = 0.0, fB = 0.0, l_12 = 0.0, l_18 = 0.0, l_1E = 0.0, l_24 = 0.0, l_2A = 0.0, l_30 = 0.0, l_36 = 0.0, l_48 = 0.0, l_4E = 0.0, l_54 = 0.0, l_5A = 0.0, l_6 = 0.0, l_60 = 0.0, l_66 = 0.0, l_6C = 0.0, l_72 = 0.0, l_78 = 0.0, l_7E = 0.0, l_84 = 0.0, l_8A = 0.0, l_90 = 0.0, l_96 = 0.0, l_9C = 0.0, l_A2 = 0.0, l_C = 0.0, d12 = 0.0, lon = 0.0;
  double t1 = (T) / (5.0);
  double t2 = (t1) + (0.10000000000002274);
  l_6 = t2;
  double t3 = (3034.906100001186) * (T);
  double t4 = (t3) + (237.47555000009015);
  double t5 = (t4) / (kR2D);
  l_C = t5;
  double t6 = (1222.1139000002295) * (T);
  double t7 = (t6) + (265.91649999981746);
  double t8 = (t7) / (kR2D);
  l_12 = t8;
  double t9 = (2.0) * (l_C);
  double t10 = (5.0) * (l_12);
  double t11 = (t10) - (t9);
  l_18 = t11;
  double t12 = (l_12) - (l_C);
  l_1E = t12;
  double t13 = (el.e3) * (T);
  double t14 = (t13) * (T);
  double t15 = (t14) * (T);
  double t16 = (el.e2) * (T);
  double t17 = (t16) * (T);
  double t18 = (el.e1) * (T);
  double t19 = (t18) + (el.e0);
  double t20 = (t19) + (t17);
  double t21 = (t20) + (t15);
  l_4E = t21;
  double t22 = cos(l_12);
  double t23 = sin(l_1E);
  double t24 = (t23) * (0.036000000000001364);
  double t25 = (t24) * (t22);
  double t26 = sin(l_12);
  double t27 = cos(l_1E);
  double t28 = (t27) * (0.033999999999991815);
  double t29 = (t28) * (t26);
  double t30 = cos(l_18);
  double t31 = (0.06399999999996453) * (l_6);
  double t32 = (t31) * (t30);
  double t33 = sin(l_18);
  double t34 = (t33) * (0.33100000000013097);
  double t35 = (t34) - (t32);
  double t36 = (t35) - (t29);
  double t37 = (t36) - (t25);
  l_24 = t37;
  double t38 = cos(l_12);
  double t39 = sin(l_1E);
  double t40 = (t39) * (0.03699999999997772);
  double t41 = (t40) * (t38);
  double t42 = sin(l_12);
  double t43 = cos(l_1E);
  double t44 = (t43) * (0.033999999999991815);
  double t45 = (t44) * (t42);
  double t46 = cos(l_18);
  double t47 = (t46) * (-0.020000000000010232);
  double t48 = (t47) + (t45);
  double t49 = (t48) + (t41);
  double t50 = (t49) / (l_4E);
  double t51 = (l_24) - (t50);
  l_30 = t51;
  double t52 = cos(l_12);
  double t53 = sin(l_1E);
  double t54 = (t53) * (0.08600000000001273);
  double t55 = (t54) * (t52);
  double t56 = sin(l_12);
  double t57 = cos(l_1E);
  double t58 = (t57) * (0.08100000000001728);
  double t59 = (t58) * (t56);
  double t60 = (2.0) * (l_1E);
  double t61 = sin(t60);
  double t62 = (t61) * (0.04099999999999682);
  double t63 = sin(l_1E);
  double t64 = (t63) * (0.14899999999988722);
  double t65 = cos(l_18);
  double t66 = (0.1610000000000582) * (l_6);
  double t67 = (t66) * (t65);
  double t68 = sin(l_18);
  double t69 = (t68) * (-0.8140000000003056);
  double t70 = (t69) + (t67);
  double t71 = (t70) - (t64);
  double t72 = (t71) - (t62);
  double t73 = (t72) + (t59);
  double t74 = (t73) + (t55);
  l_2A = t74;
  double t75 = cos(l_12);
  double t76 = cos(l_1E);
  double t77 = (t76) * (0.15000000000009095);
  double t78 = (t77) * (t75);
  double t79 = cos(l_12);
  double t80 = (t79) * (0.07299999999997908);
  double t81 = sin(l_12);
  double t82 = sin(l_1E);
  double t83 = (t82) * (0.07600001000002976);
  double t84 = (t83) * (t81);
  double t85 = cos(l_18);
  double t86 = (t85) * (0.0460000100000002);
  double t87 = sin(l_18);
  double t88 = (t87) * (0.07700001000000611);
  double t89 = (t88) + (t86);
  double t90 = (t89) - (t84);
  double t91 = (t90) - (t80);
  double t92 = (t91) - (t78);
  double t93 = (t92) / (l_4E);
  double t94 = (l_2A) - (t93);
  l_36 = t94;
  fA = ((el.type) == (4.0)) ? 1.0 : 0.0;
  fB = ((el.type) == (5.0)) ? 1.0 : 0.0;
  double t95 = (fB) * (l_2A);
  double t96 = (fA) * (l_24);
  double t97 = (el.L3) * (T);
  double t98 = (t97) * (T);
  double t99 = (t98) * (T);
  double t100 = (el.L2) * (T);
  double t101 = (t100) * (T);
  double t102 = (el.L1) * (T);
  double t103 = (t102) + (el.L0);
  double t104 = (t103) + (t101);
  double t105 = (t104) + (t99);
  double t106 = (t105) + (t96);
  double t107 = (t106) + (t95);
  l_90 = t107;
  if ((el.type) == (8.0)) {
  /*OPEN660*/
  double t108 = (jd) - (2437200.5);
  double t109 = (t108) * (360.0);
  double t110 = (t109) / (90467.31149995327);
  double t111 = (t110) + (l_90);
  l_90 = t111;
  } /*type==8*/
  double t112 = (l_90) / (360.0);
  double t113 = intr(t112);
  double t114 = (l_90) / (360.0);
  double t115 = (t114) - (t113);
  double t116 = (t115) * (360.0);
  l_90 = t116;
  double t117 = (el.i3) * (T);
  double t118 = (t117) * (T);
  double t119 = (t118) * (T);
  double t120 = (el.i2) * (T);
  double t121 = (t120) * (T);
  double t122 = (el.i1) * (T);
  double t123 = (t122) + (el.i0);
  double t124 = (t123) + (t121);
  double t125 = (t124) + (t119);
  l_96 = t125;
  double t126 = (el.O3) * (T);
  double t127 = (t126) * (T);
  double t128 = (t127) * (T);
  double t129 = (el.O2) * (T);
  double t130 = (t129) * (T);
  double t131 = (el.O1) * (T);
  double t132 = (t131) + (el.O0);
  double t133 = (t132) + (t130);
  double t134 = (t133) + (t128);
  l_9C = t134;
  double t135 = (el.M3) * (T);
  double t136 = (t135) * (T);
  double t137 = (t136) * (T);
  double t138 = (fB) * (l_36);
  double t139 = (fA) * (l_30);
  double t140 = (el.M2) * (T);
  double t141 = (t140) * (T);
  double t142 = (el.M1) * (T);
  double t143 = (t142) + (el.M0);
  double t144 = (t143) + (t141);
  double t145 = (t144) + (t139);
  double t146 = (t145) + (t138);
  double t147 = (t146) + (t137);
  l_A2 = t147;
  double t148 = (l_A2) / (360.0);
  double t149 = intr(t148);
  double t150 = (l_A2) / (360.0);
  double t151 = (t150) - (t149);
  double t152 = (t151) * (360.0);
  l_A2 = t152;
  if ((el.type) == (6.0)) {
  /*OPEN938*/
  double t153 = (0.9857650000003559) * (T);
  double t154 = (l_90) - (l_9C);
  double t155 = (t154) - (98.07158099999651);
  double t156 = (t155) - (t153);
  l_A2 = t156;
  } /*type==6*/
  if ((el.type) == (7.0)) {
  /*OPEN974*/
  double t157 = (0.3256394) * (T);
  double t158 = (l_90) - (l_9C);
  double t159 = (t158) - (276.0459750001319);
  double t160 = (t159) - (t157);
  l_A2 = t160;
  } /*type==7*/
  if ((el.type) == (8.0)) {
  /*OPEN1010*/
  double t161 = (l_90) - (224.16024000011384);
  l_A2 = t161;
  } /*type==8*/
  if ((l_A2) < (0.0)) {
  double t162 = (l_A2) + (360.0);
  l_A2 = t162;
  }
  l_48 = l_A2;
  double t163 = (l_48) / (kR2D);
  double t164 = sin(t163);
  double t165 = (t164) * (l_4E);
  double t166 = (t165) * (kR2D);
  double t167 = (t166) + (l_A2);
  l_48 = t167;
  double t168 = (l_48) / (kR2D);
  double t169 = sin(t168);
  double t170 = (t169) * (l_4E);
  double t171 = (t170) * (kR2D);
  double t172 = (t171) + (l_A2);
  l_48 = t172;
  double t173 = (l_48) / (kR2D);
  double t174 = sin(t173);
  double t175 = (t174) * (l_4E);
  double t176 = (t175) * (kR2D);
  double t177 = (t176) + (l_A2);
  l_48 = t177;
  double t178 = (l_48) / (kR2D);
  double t179 = sin(t178);
  double t180 = (t179) * (l_4E);
  double t181 = (t180) * (kR2D);
  double t182 = (t181) + (l_A2);
  l_48 = t182;
  double t183 = (l_48) / (kR2D);
  double t184 = sin(t183);
  double t185 = (t184) * (l_4E);
  double t186 = (t185) * (kR2D);
  double t187 = (t186) + (l_A2);
  l_48 = t187;
  double t188 = (l_48) / (kR2D);
  double t189 = sin(t188);
  double t190 = (t189) * (l_4E);
  double t191 = (t190) * (kR2D);
  double t192 = (t191) + (l_A2);
  l_48 = t192;
  double t193 = (1.0) - (l_4E);
  double t194 = (1.0) + (l_4E);
  double t195 = (t194) / (t193);
  l_84 = t195;
  double t196 = (l_48) / (kR2D);
  double t197 = (t196) / (2.0);
  double t198 = cos(t197);
  double t199 = (l_48) / (kR2D);
  double t200 = (t199) / (2.0);
  double t201 = sin(t200);
  double t202 = (t201) / (t198);
  double t203 = sqrt(l_84);
  double t204 = (t203) * (t202);
  l_84 = t204;
  double t205 = atan(l_84);
  double t206 = (t205) * (2.0);
  double t207 = (t206) * (kR2D);
  l_54 = t207;
  if ((l_54) < (0.0)) {
  double t208 = (l_54) + (360.0);
  l_54 = t208;
  }
  if ((l_54) > (360.0)) {
  double t209 = (l_54) - (360.0);
  l_54 = t209;
  }
  double t210 = (l_48) / (kR2D);
  double t211 = cos(t210);
  double t212 = (t211) * (l_4E);
  double t213 = (1.0) - (t212);
  double t214 = (t213) * (el.a);
  l_5A = t214;
  double t215 = (l_90) + (l_54);
  double t216 = (t215) - (l_A2);
  double t217 = (t216) - (l_9C);
  l_60 = t217;
  double t218 = (l_60) / (kR2D);
  double t219 = cos(t218);
  double t220 = (l_60) / (kR2D);
  double t221 = sin(t220);
  double t222 = (l_96) / (kR2D);
  double t223 = cos(t222);
  double t224 = (t223) * (t221);
  double t225 = (t224) / (t219);
  l_66 = t225;
  double t226 = (l_60) / (kR2D);
  double t227 = sin(t226);
  double t228 = (l_96) / (kR2D);
  double t229 = cos(t228);
  double t230 = (t229) * (t227);
  d12 = t230;
  double t231 = atan(l_66);
  double t232 = (t231) * (kR2D);
  l_8A = t232;
  if ((d12 > 0.0) && (l_66 > 0.0)) { }  /* keep */
  if ((d12 < 0.0) && (l_66 > 0.0)) {
  double t233 = (l_8A) + (180.0);
  l_8A = t233;
  }
  if ((d12 > 0.0) && (l_66 < 0.0)) {
  double t234 = (l_8A) + (180.0);
  l_8A = t234;
  }
  if ((d12 < 0.0) && (l_66 < 0.0)) {
  double t235 = (l_8A) + (360.0);
  l_8A = t235;
  }
  double t236 = (l_8A) + (l_9C);
  l_8A = t236;
  if ((l_8A) > (360.0)) {
  double t237 = (l_8A) - (360.0);
  l_8A = t237;
  }
  double t238 = (l_96) / (kR2D);
  double t239 = sin(t238);
  double t240 = (l_60) / (kR2D);
  double t241 = sin(t240);
  double t242 = (t241) * (t239);
  l_72 = t242;
  double t243 = (l_72) * (l_72);
  double t244 = (1.0) - (t243);
  double t245 = sqrt(t244);
  double t246 = (l_72) / (t245);
  double t247 = atan(t246);
  l_6C = t247;
  double t248 = (sunLon) / (kR2D);
  double t249 = (l_8A) / (kR2D);
  double t250 = (t249) - (t248);
  double t251 = sin(t250);
  double t252 = cos(l_6C);
  double t253 = (t252) * (l_5A);
  double t254 = (t253) * (t251);
  l_78 = t254;
  double t255 = (sunLon) / (kR2D);
  double t256 = (l_8A) / (kR2D);
  double t257 = (t256) - (t255);
  double t258 = cos(t257);
  double t259 = cos(l_6C);
  double t260 = (t259) * (l_5A);
  double t261 = (t260) * (t258);
  double t262 = (t261) + (Rsun);
  l_7E = t262;
  double t263 = (l_78) / (l_7E);
  double t264 = atan(t263);
  double t265 = (t264) * (kR2D);
  lon = t265;
  double t266 = (l_78) / (l_7E);
  if ((l_78 > 0.0) && (t266 > 0.0)) { }  /* keep */
  double t267 = (l_78) / (l_7E);
  if ((l_78 < 0.0) && (t267 > 0.0)) {
  double t268 = (lon) + (180.0);
  lon = t268;
  }
  double t269 = (l_78) / (l_7E);
  if ((l_78 > 0.0) && (t269 < 0.0)) {
  double t270 = (lon) + (180.0);
  lon = t270;
  }
  double t271 = (l_78) / (l_7E);
  if ((l_78 < 0.0) && (t271 < 0.0)) {
  double t272 = (lon) + (360.0);
  lon = t272;
  }
  double t273 = (lon) + (sunLon);
  lon = t273;
  if ((lon) > (360.0)) {
  double t274 = (lon) - (360.0);
  lon = t274;
  }
  if (nirayana) {
  double t275 = (lon) - (ayan);
  lon = t275;
  } /*end nirayana*/
  if ((lon) < (0.0)) {
  double t276 = (lon) + (360.0);
  lon = t276;
  }
  /* lon kept in return value */
  return lon;
}


[[nodiscard]] inline double moonSayana(double T, double MplusC) {
  double Dmoon = 0.0, Fmoon = 0.0, Lmoon = 0.0, Mmoon = 0.0, m58 = 0.0, moon = 0.0;
  double t56 = (481267.8831000328) * (T);
  double t57 = (t56) + (270.4341640002094);
  Lmoon = t57;
  double t58 = (Lmoon) / (360.0);
  double t59 = intr(t58);
  double t60 = (Lmoon) / (360.0);
  double t61 = (t60) - (t59);
  double t62 = (t61) * (360.0);
  Lmoon = t62;
  double t63 = (477198.8491001129) * (T);
  double t64 = (t63) + (296.10460799979046);
  Mmoon = t64;
  double t65 = (Mmoon) / (360.0);
  double t66 = intr(t65);
  double t67 = (Mmoon) / (360.0);
  double t68 = (t67) - (t66);
  double t69 = (t68) * (360.0);
  Mmoon = t69;
  double t70 = (445267.1142001152) * (T);
  double t71 = (t70) + (350.7374860001728);
  Dmoon = t71;
  double t72 = (Dmoon) / (360.0);
  double t73 = intr(t72);
  double t74 = (Dmoon) / (360.0);
  double t75 = (t74) - (t73);
  double t76 = (t75) * (360.0);
  Dmoon = t76;
  double t77 = (2.0) * (Mmoon);
  double t78 = (t77) / (kR2D);
  double t79 = sin(t78);
  double t80 = (t79) * (0.2136160000000018);
  double t81 = (2.0) * (Dmoon);
  double t82 = (t81) / (kR2D);
  double t83 = sin(t82);
  double t84 = (t83) * (0.6853090000004158);
  double t85 = (Mmoon) / (kR2D);
  double t86 = (2.0) * (Dmoon);
  double t87 = (t86) / (kR2D);
  double t88 = (t87) - (t85);
  double t89 = sin(t88);
  double t90 = (t89) * (1.2740180000000692);
  double t91 = (Mmoon) / (kR2D);
  double t92 = sin(t91);
  double t93 = (t92) * (6.288749999999709);
  double t94 = (t93) + (Lmoon);
  double t95 = (t94) + (t90);
  double t96 = (t95) + (t84);
  double t97 = (t96) + (t80);
  moon = t97;
  double t98 = (7.5199999999969735e-06) * (T);
  double t99 = (t98) * (T);
  double t100 = (0.002494999999999692) * (T);
  double t101 = (1.0) - (t100);
  double t102 = (t101) - (t99);
  m58 = t102;
  double t103 = (483202.02510023117) * (T);
  double t104 = (t103) + (11.250889000002644);
  Fmoon = t104;
  double t105 = (2.0) * (Fmoon);
  double t106 = (t105) / (kR2D);
  double t107 = sin(t106);
  double t108 = (t107) * (0.11433599999998023);
  double t109 = (MplusC) / (kR2D);
  double t110 = sin(t109);
  double t111 = (m58) * (0.1855960000000323);
  double t112 = (t111) * (t110);
  double t113 = (moon) - (t112);
  double t114 = (t113) - (t108);
  moon = t114;
  double t115 = (Mmoon) / (kR2D);
  double t116 = (MplusC) / (kR2D);
  double t117 = (2.0) * (Dmoon);
  double t118 = (t117) / (kR2D);
  double t119 = (t118) - (t116);
  double t120 = (t119) - (t115);
  double t121 = sin(t120);
  double t122 = (m58) * (0.05721199999999271);
  double t123 = (t122) * (t121);
  double t124 = (2.0) * (Mmoon);
  double t125 = (t124) / (kR2D);
  double t126 = (2.0) * (Dmoon);
  double t127 = (t126) / (kR2D);
  double t128 = (t127) - (t125);
  double t129 = sin(t128);
  double t130 = (t129) * (0.05879299999998011);
  double t131 = (t130) + (moon);
  double t132 = (t131) + (t123);
  moon = t132;
  double t133 = (Mmoon) / (kR2D);
  double t134 = (MplusC) / (kR2D);
  double t135 = (t134) + (t133);
  double t136 = sin(t135);
  double t137 = (m58) * (0.030464999999992415);
  double t138 = (t137) * (t136);
  double t139 = (Dmoon) / (kR2D);
  double t140 = sin(t139);
  double t141 = (t140) * (0.03471799999999803);
  double t142 = (MplusC) / (kR2D);
  double t143 = (Mmoon) / (kR2D);
  double t144 = (t143) - (t142);
  double t145 = sin(t144);
  double t146 = (m58) * (0.041023999999993066);
  double t147 = (t146) * (t145);
  double t148 = (MplusC) / (kR2D);
  double t149 = (2.0) * (Dmoon);
  double t150 = (t149) / (kR2D);
  double t151 = (t150) - (t148);
  double t152 = sin(t151);
  double t153 = (m58) * (0.04587400000002617);
  double t154 = (t153) * (t152);
  double t155 = (Mmoon) / (kR2D);
  double t156 = (2.0) * (Dmoon);
  double t157 = (t156) / (kR2D);
  double t158 = (t157) + (t155);
  double t159 = sin(t158);
  double t160 = (t159) * (0.05331999999998516);
  double t161 = (t160) + (moon);
  double t162 = (t161) + (t154);
  double t163 = (t162) + (t147);
  double t164 = (t163) - (t141);
  double t165 = (t164) - (t138);
  moon = t165;
  return moon;
}

// Mean lunar node, Sayana degrees (sub_195D3 0x1a265: K2*T^2 - K1*T + K0, fmod 360).
[[nodiscard]] inline double meanNodeSayana(double T) {
  double n = 0.0020780000000009125 * T * T - 1934.1420000009239 * T + 259.1832750001922;
  n = n - std::trunc(n / 360.0) * 360.0;
  if (n < 0.0) n += 360.0;
  return n;
}
}  // namespace star
