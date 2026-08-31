#ifndef CONV3_H
#define CONV3_H
#include "denoiser.h"

const fixed_t conv3_kernel[288] = {
    fixed_t(-0.35002726f), fixed_t(0.29790255f), fixed_t(-0.31535676f), fixed_t(-0.31997401f), fixed_t(0.59446692f), fixed_t(0.31724766f), fixed_t(-0.29453838f), fixed_t(-0.04037739f), 
    fixed_t(-0.06791771f), fixed_t(-0.41023296f), fixed_t(0.09495792f), fixed_t(0.00762685f), fixed_t(0.15738262f), fixed_t(0.78714514f), fixed_t(0.27591074f), fixed_t(0.32733622f), 
    fixed_t(0.55502450f), fixed_t(0.06322409f), fixed_t(-0.03074537f), fixed_t(0.11105137f), fixed_t(-0.16713993f), fixed_t(0.07461170f), fixed_t(0.43032783f), fixed_t(0.00012683f), 
    fixed_t(-0.28681651f), fixed_t(0.05578112f), fixed_t(0.28989625f), fixed_t(-0.24290028f), fixed_t(-0.11410034f), fixed_t(0.21008497f), fixed_t(-0.19828816f), fixed_t(0.11151890f), 
    fixed_t(0.07749373f), fixed_t(0.69505465f), fixed_t(0.64571154f), fixed_t(0.12456610f), fixed_t(0.23610084f), fixed_t(0.29205477f), fixed_t(0.16636126f), fixed_t(0.26619169f), 
    fixed_t(0.42697451f), fixed_t(-0.09012566f), fixed_t(0.07309342f), fixed_t(0.05456716f), fixed_t(-0.22475727f), fixed_t(-0.03148328f), fixed_t(0.50008035f), fixed_t(0.05970880f), 
    fixed_t(0.32185230f), fixed_t(-0.49187467f), fixed_t(0.22987498f), fixed_t(0.09935132f), fixed_t(-0.07828077f), fixed_t(0.76956892f), fixed_t(-0.34350684f), fixed_t(-0.05144019f), 
    fixed_t(-0.28359264f), fixed_t(-0.14713362f), fixed_t(0.03309390f), fixed_t(0.10514110f), fixed_t(-0.36424896f), fixed_t(0.63937587f), fixed_t(0.13142459f), fixed_t(-0.51892555f), 
    fixed_t(-0.15524061f), fixed_t(0.17961444f), fixed_t(-0.15154481f), fixed_t(0.21200265f), fixed_t(0.35470128f), fixed_t(0.15867409f), fixed_t(0.33987233f), fixed_t(-0.01210803f), 
    fixed_t(-0.13979107f), fixed_t(-0.09275666f), fixed_t(-0.22010751f), fixed_t(0.14596289f), fixed_t(0.01736712f), fixed_t(0.13170663f), fixed_t(-0.07076250f), fixed_t(-0.04427098f), 
    fixed_t(0.18422921f), fixed_t(0.02277133f), fixed_t(0.03212459f), fixed_t(-0.14542441f), fixed_t(-0.22712749f), fixed_t(0.17940059f), fixed_t(-0.22732656f), fixed_t(0.12516086f), 
    fixed_t(-0.26145869f), fixed_t(-0.11412270f), fixed_t(-0.21602848f), fixed_t(-0.07021353f), fixed_t(0.05241065f), fixed_t(0.21142800f), fixed_t(-0.14572197f), fixed_t(-0.03811123f), 
    fixed_t(-0.10845070f), fixed_t(-0.09739976f), fixed_t(0.02537222f), fixed_t(-0.15069805f), fixed_t(0.19936030f), fixed_t(-0.20121628f), fixed_t(-0.23796810f), fixed_t(0.16486952f), 
    fixed_t(0.03330094f), fixed_t(-0.05591568f), fixed_t(0.12748858f), fixed_t(-0.02284146f), fixed_t(-0.06439722f), fixed_t(-0.01837704f), fixed_t(0.03143146f), fixed_t(0.00088167f), 
    fixed_t(-0.25036955f), fixed_t(0.11175123f), fixed_t(-0.23251031f), fixed_t(0.07876333f), fixed_t(-0.24051954f), fixed_t(-0.15691736f), fixed_t(-0.08134597f), fixed_t(-0.09496637f), 
    fixed_t(-0.19046612f), fixed_t(-0.00494961f), fixed_t(-0.07457279f), fixed_t(-0.15904230f), fixed_t(0.12097291f), fixed_t(0.15512256f), fixed_t(0.09638455f), fixed_t(0.04914914f), 
    fixed_t(-0.00280687f), fixed_t(-0.12950940f), fixed_t(0.19325309f), fixed_t(-0.15635647f), fixed_t(0.00616037f), fixed_t(0.01503309f), fixed_t(0.07723597f), fixed_t(0.14791848f), 
    fixed_t(0.10344129f), fixed_t(0.06217812f), fixed_t(-0.19650458f), fixed_t(0.09080451f), fixed_t(-0.08877720f), fixed_t(-0.10512458f), fixed_t(-0.15055473f), fixed_t(0.01311569f), 
    fixed_t(-0.31915826f), fixed_t(0.45040113f), fixed_t(0.25135365f), fixed_t(-0.03174162f), fixed_t(-0.22896267f), fixed_t(0.12986489f), fixed_t(-0.41044384f), fixed_t(-0.57415950f), 
    fixed_t(-0.50252408f), fixed_t(-0.08055076f), fixed_t(0.08179986f), fixed_t(0.19756722f), fixed_t(0.50427079f), fixed_t(0.29013622f), fixed_t(0.07583161f), fixed_t(-0.17154293f), 
    fixed_t(0.21564889f), fixed_t(-0.05547309f), fixed_t(-0.22851977f), fixed_t(0.01191224f), fixed_t(-0.11664572f), fixed_t(-0.20424762f), fixed_t(0.24088870f), fixed_t(0.11429186f), 
    fixed_t(-0.27929488f), fixed_t(0.08786771f), fixed_t(-0.10903624f), fixed_t(0.04615499f), fixed_t(0.04888230f), fixed_t(0.04761956f), fixed_t(-0.02638517f), fixed_t(0.19492540f), 
    fixed_t(0.03226827f), fixed_t(0.85348558f), fixed_t(0.05101728f), fixed_t(-0.08317588f), fixed_t(-0.05487081f), fixed_t(0.11769228f), fixed_t(0.08790220f), fixed_t(-0.15868726f), 
    fixed_t(0.13198422f), fixed_t(-0.07806658f), fixed_t(0.25779548f), fixed_t(0.30418119f), fixed_t(0.32999054f), fixed_t(0.20217729f), fixed_t(0.36004069f), fixed_t(-0.39082795f), 
    fixed_t(0.70659250f), fixed_t(0.08944255f), fixed_t(-0.17381723f), fixed_t(0.78204244f), fixed_t(0.51956367f), fixed_t(0.37613332f), fixed_t(-0.13705726f), fixed_t(-0.03139035f), 
    fixed_t(-0.05728280f), fixed_t(0.01549338f), fixed_t(0.03469597f), fixed_t(0.10282569f), fixed_t(-0.16410623f), fixed_t(-0.20557921f), fixed_t(0.14182469f), fixed_t(-0.01009328f), 
    fixed_t(-0.03273228f), fixed_t(0.19735879f), fixed_t(-0.00630644f), fixed_t(0.05348631f), fixed_t(0.14110218f), fixed_t(0.36245686f), fixed_t(0.33589876f), fixed_t(0.02935039f), 
    fixed_t(0.26520616f), fixed_t(-0.61346811f), fixed_t(-1.05169463f), fixed_t(0.18811427f), fixed_t(-0.27201852f), fixed_t(-0.32858115f), fixed_t(0.42344624f), fixed_t(0.19310278f), 
    fixed_t(0.32479298f), fixed_t(0.49170542f), fixed_t(0.01830971f), fixed_t(0.06245216f), fixed_t(-0.16874120f), fixed_t(-0.55085027f), fixed_t(0.09699293f), fixed_t(-0.14743134f), 
    fixed_t(-0.02159146f), fixed_t(0.20695797f), fixed_t(0.42749360f), fixed_t(0.33427626f), fixed_t(0.15152326f), fixed_t(0.06649955f), fixed_t(0.15259531f), fixed_t(0.05989141f), 
    fixed_t(0.23165855f), fixed_t(0.29695815f), fixed_t(0.22195952f), fixed_t(0.53525168f), fixed_t(0.42656398f), fixed_t(0.21920142f), fixed_t(0.26581195f), fixed_t(0.29640114f), 
    fixed_t(0.06780801f), fixed_t(-0.32333362f), fixed_t(0.26145908f), fixed_t(0.52767223f), fixed_t(-0.02941017f), fixed_t(0.19275878f), fixed_t(0.16512924f), fixed_t(-0.08715423f), 
    fixed_t(-0.20183524f), fixed_t(-0.35536739f), fixed_t(-0.32201663f), fixed_t(0.10131828f), fixed_t(0.04300963f), fixed_t(0.13802443f), fixed_t(-0.42646858f), fixed_t(-0.15311827f), 
    fixed_t(-0.40666839f), fixed_t(-0.00534090f), fixed_t(-0.76952291f), fixed_t(0.15382352f), fixed_t(-0.06493307f), fixed_t(-0.13985845f), fixed_t(0.18744034f), fixed_t(0.12841782f), 
    fixed_t(0.30800682f), fixed_t(0.26806739f), fixed_t(0.11799221f), fixed_t(0.16247198f), fixed_t(0.28877798f), fixed_t(0.03892706f), fixed_t(0.19732860f), fixed_t(0.02989176f), 
    fixed_t(0.18949144f), fixed_t(0.43720800f), fixed_t(-0.05494453f), fixed_t(-0.06298029f), fixed_t(0.15858640f), fixed_t(-0.08289444f), fixed_t(0.06063245f), fixed_t(0.45850655f)
    
};

const fixed_t conv3_bias[4] = {
    fixed_t(0.13739160f), fixed_t(-0.02082704f), fixed_t(0.00663717f), fixed_t(0.03928938f)
};
#endif
