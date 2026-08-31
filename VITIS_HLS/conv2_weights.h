#ifndef CONV2_H
#define CONV2_H
#include "denoiser.h"

const fixed_t conv2_kernel[288] = {
    fixed_t(-0.11948268f), fixed_t(-0.34985361f), fixed_t(-0.25080523f), fixed_t(0.30713287f), fixed_t(0.73305094f), fixed_t(-0.18772846f), fixed_t(-0.30416116f), fixed_t(0.28439391f), 
    fixed_t(-0.06784106f), fixed_t(-0.07917395f), fixed_t(-0.23329924f), fixed_t(-0.40302914f), fixed_t(-0.03532035f), fixed_t(0.14852604f), fixed_t(-0.30029026f), fixed_t(-0.06097562f), 
    fixed_t(0.19533719f), fixed_t(-0.11054890f), fixed_t(0.05335249f), fixed_t(0.10088340f), fixed_t(0.04960672f), fixed_t(-0.07562825f), fixed_t(-0.10738987f), fixed_t(0.18456922f), 
    fixed_t(-0.25110233f), fixed_t(-0.17001295f), fixed_t(0.15008056f), fixed_t(0.22626394f), fixed_t(0.32203916f), fixed_t(0.26552734f), fixed_t(-0.28651771f), fixed_t(-0.41273764f), 
    fixed_t(0.32425395f), fixed_t(-0.21295415f), fixed_t(-0.09355421f), fixed_t(0.12616503f), fixed_t(-0.04439132f), fixed_t(-0.10008861f), fixed_t(-0.34071910f), fixed_t(-0.19663019f), 
    fixed_t(0.94804782f), fixed_t(-0.10335480f), fixed_t(-0.03471296f), fixed_t(-0.05086529f), fixed_t(-0.04805219f), fixed_t(0.01800106f), fixed_t(0.26101544f), fixed_t(-0.14098901f), 
    fixed_t(0.06899679f), fixed_t(0.93976450f), fixed_t(0.24748258f), fixed_t(-0.22139011f), fixed_t(0.27576566f), fixed_t(0.04810162f), fixed_t(0.03913070f), fixed_t(0.09300666f), 
    fixed_t(0.08125782f), fixed_t(0.03080433f), fixed_t(-0.55880636f), fixed_t(0.04461604f), fixed_t(0.07159612f), fixed_t(0.07947966f), fixed_t(0.13352056f), fixed_t(-0.02407626f), 
    fixed_t(-0.00087823f), fixed_t(-0.17987370f), fixed_t(-0.01136041f), fixed_t(-0.03243764f), fixed_t(-0.07371038f), fixed_t(0.09453591f), fixed_t(-0.03602391f), fixed_t(-0.01384876f), 
    fixed_t(0.29619333f), fixed_t(0.16544493f), fixed_t(-0.06951950f), fixed_t(0.00884650f), fixed_t(-0.11318887f), fixed_t(-0.29069963f), fixed_t(-0.05177337f), fixed_t(-0.13917662f), 
    fixed_t(0.12826556f), fixed_t(0.20052621f), fixed_t(0.00724532f), fixed_t(-0.08805775f), fixed_t(0.13357911f), fixed_t(0.09641530f), fixed_t(-0.08539383f), fixed_t(-0.11135119f), 
    fixed_t(0.09298564f), fixed_t(0.32104656f), fixed_t(-0.01056908f), fixed_t(0.01431828f), fixed_t(0.37764996f), fixed_t(0.28188175f), fixed_t(0.06879660f), fixed_t(0.00625369f), 
    fixed_t(0.29748082f), fixed_t(0.16485225f), fixed_t(0.01411454f), fixed_t(-0.05534356f), fixed_t(-0.08367568f), fixed_t(0.34366566f), fixed_t(0.25528362f), fixed_t(-0.19852050f), 
    fixed_t(-0.24314523f), fixed_t(-0.00945617f), fixed_t(0.26670468f), fixed_t(-0.21185483f), fixed_t(-0.17722355f), fixed_t(0.10188964f), fixed_t(0.14512542f), fixed_t(-0.17536874f), 
    fixed_t(0.66959572f), fixed_t(0.05837040f), fixed_t(0.02247580f), fixed_t(-0.45076424f), fixed_t(-0.22526640f), fixed_t(-0.03333337f), fixed_t(0.21951075f), fixed_t(-0.00016758f), 
    fixed_t(-0.45588419f), fixed_t(0.07391158f), fixed_t(0.16090174f), fixed_t(-0.10656192f), fixed_t(-0.30364862f), fixed_t(-0.01060137f), fixed_t(0.11189134f), fixed_t(-0.11238132f), 
    fixed_t(-0.32869360f), fixed_t(0.15336217f), fixed_t(-0.10121354f), fixed_t(-0.14609776f), fixed_t(0.22825816f), fixed_t(0.15129645f), fixed_t(0.15084140f), fixed_t(0.14199433f), 
    fixed_t(0.08451683f), fixed_t(-0.39293754f), fixed_t(0.14946559f), fixed_t(0.45130816f), fixed_t(0.20748739f), fixed_t(-0.06204116f), fixed_t(-0.02832729f), fixed_t(-0.05816519f), 
    fixed_t(0.05160265f), fixed_t(-0.03007578f), fixed_t(0.25950277f), fixed_t(-0.07585784f), fixed_t(0.45378146f), fixed_t(0.08186893f), fixed_t(0.01121086f), fixed_t(0.11328103f), 
    fixed_t(-0.18510567f), fixed_t(-0.01723518f), fixed_t(-0.05947680f), fixed_t(0.34486914f), fixed_t(0.08282078f), fixed_t(0.10921562f), fixed_t(0.20254993f), fixed_t(0.11271474f), 
    fixed_t(0.04240337f), fixed_t(-0.12430776f), fixed_t(0.05646152f), fixed_t(0.06513740f), fixed_t(-0.03874760f), fixed_t(0.33053571f), fixed_t(0.21915561f), fixed_t(-0.04174206f), 
    fixed_t(-0.09552690f), fixed_t(0.00022299f), fixed_t(0.12345756f), fixed_t(0.10591552f), fixed_t(0.31584021f), fixed_t(0.02319405f), fixed_t(-0.25523233f), fixed_t(0.11480804f), 
    fixed_t(0.07793491f), fixed_t(-0.09375500f), fixed_t(-0.08594244f), fixed_t(-0.06738114f), fixed_t(0.15798593f), fixed_t(0.72121221f), fixed_t(0.04257300f), fixed_t(0.10326903f), 
    fixed_t(-0.55048102f), fixed_t(0.35350636f), fixed_t(-0.30261573f), fixed_t(0.51265091f), fixed_t(-0.34229714f), fixed_t(0.30973718f), fixed_t(0.19178334f), fixed_t(-0.07470969f), 
    fixed_t(0.18454675f), fixed_t(-0.61993450f), fixed_t(0.06416759f), fixed_t(0.02796215f), fixed_t(0.26124567f), fixed_t(0.00201763f), fixed_t(0.06881951f), fixed_t(-0.16006587f), 
    fixed_t(-0.12270629f), fixed_t(-0.23736884f), fixed_t(0.01452142f), fixed_t(-0.24350880f), fixed_t(-0.28203139f), fixed_t(-0.16010354f), fixed_t(0.02229346f), fixed_t(0.03117230f), 
    fixed_t(-0.37310410f), fixed_t(-0.34063753f), fixed_t(0.02328722f), fixed_t(-0.53888625f), fixed_t(-0.46730551f), fixed_t(0.27827826f), fixed_t(0.00197219f), fixed_t(0.04487922f), 
    fixed_t(0.11049999f), fixed_t(0.02586945f), fixed_t(0.32520977f), fixed_t(0.10272192f), fixed_t(0.17903879f), fixed_t(0.30569398f), fixed_t(0.25186533f), fixed_t(0.09140185f), 
    fixed_t(0.08257476f), fixed_t(0.09145135f), fixed_t(0.21730800f), fixed_t(0.15379548f), fixed_t(0.24841778f), fixed_t(0.18269916f), fixed_t(0.23167208f), fixed_t(0.28427529f), 
    fixed_t(0.29705524f), fixed_t(0.02808864f), fixed_t(-0.07994888f), fixed_t(-0.04632482f), fixed_t(-0.13576211f), fixed_t(0.02208743f), fixed_t(-0.02740223f), fixed_t(-0.22359894f), 
    fixed_t(-0.21891272f), fixed_t(-0.00484211f), fixed_t(-0.20592442f), fixed_t(-0.06590360f), fixed_t(0.07298915f), fixed_t(-0.05061010f), fixed_t(-0.11159842f), fixed_t(-0.17766744f), 
    fixed_t(-0.16724300f), fixed_t(0.01702123f), fixed_t(-0.17135094f), fixed_t(-0.04507097f), fixed_t(0.00995342f), fixed_t(-0.70905912f), fixed_t(0.00169498f), fixed_t(-0.03226376f), 
    fixed_t(0.79311800f), fixed_t(-0.68902534f), fixed_t(-0.06012177f), fixed_t(-0.15164386f), fixed_t(0.52129829f), fixed_t(0.01770520f), fixed_t(-0.13671760f), fixed_t(0.31149435f), 
    fixed_t(0.12427828f), fixed_t(-0.34592938f), fixed_t(-0.40683290f), fixed_t(0.13809630f), fixed_t(-0.01360759f), fixed_t(-0.09148420f), fixed_t(0.09294014f), fixed_t(0.23962383f), 
    fixed_t(0.25762403f), fixed_t(0.12622640f), fixed_t(0.31205988f), fixed_t(0.22676699f), fixed_t(-0.23468654f), fixed_t(-0.01119441f), fixed_t(0.02519353f), fixed_t(-0.05951884f), 
    fixed_t(0.29925206f), fixed_t(0.08617020f), fixed_t(-0.41637534f), fixed_t(-0.44020078f), fixed_t(0.22366962f), fixed_t(-0.03383016f), fixed_t(-0.36595282f), fixed_t(-0.01901007f)
    
};

const fixed_t conv2_bias[8] = {
    fixed_t(0.07017247f), fixed_t(0.19866394f), fixed_t(0.10522947f), fixed_t(-0.08240034f), fixed_t(0.05555438f), fixed_t(0.35655469f), fixed_t(-0.18381046f), fixed_t(-0.05696139f)
};
#endif
