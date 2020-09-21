(set-info :smt-lib-version 2.6)
(set-logic LIA)
(set-info
  :source |
 Generated by PSyCO 0.1
 More info in N. P. Lopes and J. Monteiro. Weakest Precondition Synthesis for
 Compiler Optimizations, VMCAI'14.
|)
(set-info :category "industrial")
(set-info :status unsat)
(declare-fun W_S1_V1 () Bool)
(declare-fun W_S1_V2 () Bool)
(declare-fun W_S1_V4 () Bool)
(declare-fun R_S1_V1 () Bool)
(declare-fun R_E1_V1 () Bool)
(declare-fun R_E1_V3 () Bool)
(declare-fun R_E1_V2 () Bool)
(declare-fun R_E1_V4 () Bool)
(declare-fun DISJ_W_S1_R_E1 () Bool)
(declare-fun R_S1_V3 () Bool)
(declare-fun R_S1_V2 () Bool)
(declare-fun R_S1_V4 () Bool)
(declare-fun DISJ_W_S1_R_S1 () Bool)
(declare-fun W_S1_V3 () Bool)
(assert
 (let
 (($x324
   (forall
    ((V4_0 Int) (V2_0 Int) 
     (V3_0 Int) (V1_0 Int) 
     (MW_S1_V4 Bool) (MW_S1_V2 Bool) 
     (MW_S1_V3 Bool) (MW_S1_V1 Bool) 
     (S1_V3_!14 Int) (S1_V3_!20 Int) 
     (E1_!11 Int) (E1_!16 Int) 
     (E1_!17 Int) (S1_V1_!15 Int) 
     (S1_V1_!21 Int) (S1_V2_!13 Int) 
     (S1_V2_!19 Int) (S1_V4_!12 Int) 
     (S1_V4_!18 Int))
    (let ((?x257 (ite MW_S1_V1 S1_V1_!21 E1_!17)))
    (let ((?x258 (ite MW_S1_V1 S1_V1_!15 E1_!11)))
    (let (($x259 (= ?x258 ?x257)))
    (let ((?x260 (ite MW_S1_V3 S1_V3_!20 V3_0)))
    (let ((?x261 (ite MW_S1_V3 S1_V3_!14 V3_0)))
    (let (($x262 (= ?x261 ?x260)))
    (let (($x263 (= E1_!16 ?x257)))
    (let ((?x264 (ite MW_S1_V4 S1_V4_!18 V4_0)))
    (let ((?x265 (ite MW_S1_V4 S1_V4_!12 V4_0)))
    (let (($x266 (= ?x265 ?x264)))
    (let (($x267 (and $x266 $x263 $x262 $x259)))
    (let (($x269 (not MW_S1_V1)))
    (let (($x270 (or $x269 W_S1_V1)))
    (let (($x273 (not MW_S1_V2)))
    (let (($x274 (or $x273 W_S1_V2)))
    (let (($x275 (not MW_S1_V4)))
    (let (($x276 (or $x275 W_S1_V4)))
    (let (($x278 (= S1_V4_!18 S1_V4_!12)))
    (let (($x279 (= E1_!17 E1_!11)))
    (let (($x88 (not R_S1_V1)))
    (let (($x280 (or $x88 $x279)))
    (let (($x281 (not $x280)))
    (let (($x282 (or $x281 $x278)))
    (let (($x283 (= S1_V2_!19 S1_V2_!13)))
    (let (($x284 (or $x281 $x283)))
    (let (($x285 (= S1_V1_!21 S1_V1_!15)))
    (let (($x286 (or $x281 $x285)))
    (let (($x287 (= E1_!16 E1_!17)))
    (let (($x288 (= ?x258 V1_0)))
    (let (($x99 (not R_E1_V1)))
    (let (($x289 (or $x99 $x288)))
    (let (($x290 (= ?x261 V3_0)))
    (let (($x97 (not R_E1_V3)))
    (let (($x291 (or $x97 $x290)))
    (let ((?x292 (ite MW_S1_V2 S1_V2_!13 V2_0)))
    (let (($x293 (= ?x292 V2_0)))
    (let (($x95 (not R_E1_V2)))
    (let (($x294 (or $x95 $x293)))
    (let (($x295 (= ?x265 V4_0)))
    (let (($x93 (not R_E1_V4)))
    (let (($x296 (or $x93 $x295)))
    (let (($x297 (and $x296 $x294 $x291 $x289)))
    (let (($x298 (not $x297)))
    (let (($x299 (or $x298 $x287)))
    (let (($x300 (= E1_!11 E1_!17)))
    (let (($x301 (= E1_!11 E1_!16)))
    (let (($x302 (= V1_0 ?x258)))
    (let (($x303 (or $x99 $x302)))
    (let (($x304 (= V3_0 ?x261)))
    (let (($x305 (or $x97 $x304)))
    (let (($x306 (= V2_0 ?x292)))
    (let (($x307 (or $x95 $x306)))
    (let (($x308 (= V4_0 ?x265)))
    (let (($x309 (or $x93 $x308)))
    (let (($x310 (and $x309 $x307 $x305 $x303)))
    (let (($x311 (not $x310)))
    (let (($x312 (or $x311 $x301)))
    (let (($x313 (= S1_V3_!20 S1_V3_!14)))
    (let (($x314 (or $x281 $x313)))
    (let
    (($x321
      (and $x314 $x312 $x300 $x299 $x286 $x284 $x282 $x276 $x274 $x270)))
    (let (($x322 (not $x321))) (or $x322 $x267)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
 (let (($x30 (and W_S1_V1 R_E1_V1)))
 (let (($x26 (and W_S1_V2 R_E1_V2)))
 (let (($x24 (and W_S1_V4 R_E1_V4)))
 (let (($x40 (or $x24 $x26 R_E1_V3 $x30)))
 (let (($x41 (not $x40)))
 (let (($x42 (= DISJ_W_S1_R_E1 $x41)))
 (let (($x18 (and W_S1_V1 R_S1_V1)))
 (let (($x13 (and W_S1_V2 R_S1_V2)))
 (let (($x10 (and W_S1_V4 R_S1_V4)))
 (let (($x37 (or $x10 $x13 R_S1_V3 $x18)))
 (let (($x38 (not $x37)))
 (let (($x39 (= DISJ_W_S1_R_S1 $x38))) (and W_S1_V3 $x39 $x42 $x324)))))))))))))))
(assert
 (let (($x155 (not W_S1_V1)))
 (let (($x99 (not R_E1_V1)))
 (let (($x380 (and $x99 $x155 DISJ_W_S1_R_E1))) (not $x380)))))
(check-sat)
(exit)
