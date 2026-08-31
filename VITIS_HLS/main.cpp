#include <iostream>
#include <fstream>
#include <chrono>
#include <cmath>
#include <vector>
#include <string>
#include <iomanip>
#include "denoiser.h"   // định nghĩa fixed_t, class Denoiser

#define NUM_IMAGES 100

// Hàm đọc file txt thành mảng fixed_t
bool load_image(const std::string& filename, fixed_t image[28][28][1]) {
    std::ifstream file(filename);
    if (!file.is_open()) return false;
    for (int i = 0; i < 28; ++i) {
        for (int j = 0; j < 28; ++j) {
            float val;
            file >> val;
            image[i][j][0] = fixed_t(val);
        }
    }
    return true;
}

// Tính MSE giữa hai ảnh (dùng to_float())
double compute_mse(fixed_t img1[28][28][1], fixed_t img2[28][28][1]) {
    double mse = 0.0;
    for (int i = 0; i < 28; ++i) {
        for (int j = 0; j < 28; ++j) {
            float diff = img1[i][j][0].to_float() - img2[i][j][0].to_float();
            mse += diff * diff;
        }
    }
    mse /= (28.0 * 28.0);
    return mse;
}

int main() {
    Denoiser denoiser;
    std::vector<double> mse_vs_gold, psnr_vs_gold;
    std::vector<double> mse_vs_gt, psnr_vs_gt;
    fixed_t tmpA[28][28][8], tmpB[28][28][8];
    int processed = 0;

    std::cout << "Start C++ inference on " << NUM_IMAGES << " images...\n";

    for (int idx = 0; idx < NUM_IMAGES; ++idx) {
        std::string input_file = "hls_test_data/test_input_" + std::to_string(idx) + ".txt";
        std::string gt_file = "hls_test_data/test_ground_truth_" + std::to_string(idx) + ".txt";
        std::string gold_file = "hls_test_data/gold_output_" + std::to_string(idx) + ".txt";

        fixed_t input[28][28][1], ground_truth[28][28][1], gold[28][28][1], output[28][28][1];

        if (!load_image(input_file, input)) {
            std::cerr << "Skip " << idx << ": cannot load input\n";
            continue;
        }
        if (!load_image(gt_file, ground_truth)) {
            std::cerr << "Skip " << idx << ": cannot load ground truth\n";
            continue;
        }
        if (!load_image(gold_file, gold)) {
            std::cerr << "Skip " << idx << ": cannot load gold output\n";
            continue;
        }

        denoiser.inference(input, output, tmpA, tmpB);

        // So sánh output C++ với gold Python
        double mse_gold = compute_mse(output, gold);
        double psnr_gold = (mse_gold == 0.0) ? 100.0 : 10.0 * std::log10(1.0 / mse_gold);
        mse_vs_gold.push_back(mse_gold);
        psnr_vs_gold.push_back(psnr_gold);

        // So sánh output C++ với ground truth (chất lượng khử nhiễu)
        double mse_gt = compute_mse(output, ground_truth);
        double psnr_gt = (mse_gt == 0.0) ? 100.0 : 10.0 * std::log10(1.0 / mse_gt);
        mse_vs_gt.push_back(mse_gt);
        psnr_vs_gt.push_back(psnr_gt);

        processed++;
        if ((idx + 1) % 20 == 0) {
            std::cout << "Processed " << (idx + 1) << " images\n";
        }
    }

    if (processed == 0) {
        std::cout << "No images processed. Check directory and file names.\n";
        return 1;
    }

    // Tính trung bình và độ lệch chuẩn
    auto average = [](const std::vector<double>& v) {
        double sum = 0.0; for (double x : v) sum += x; return sum / v.size();
    };
    auto stddev = [](const std::vector<double>& v, double mean) {
        double sum = 0.0; for (double x : v) sum += (x - mean) * (x - mean);
        return std::sqrt(sum / v.size());
    };

    double avg_mse_gold = average(mse_vs_gold);
    double avg_psnr_gold = average(psnr_vs_gold);
    double std_mse_gold = stddev(mse_vs_gold, avg_mse_gold);
    double std_psnr_gold = stddev(psnr_vs_gold, avg_psnr_gold);

    double avg_mse_gt = average(mse_vs_gt);
    double avg_psnr_gt = average(psnr_vs_gt);
    double std_mse_gt = stddev(mse_vs_gt, avg_mse_gt);
    double std_psnr_gt = stddev(psnr_vs_gt, avg_psnr_gt);

    std::cout << std::fixed << std::setprecision(4);
    std::cout << "\n========== C++ INFERENCE RESULTS ==========\n";
    std::cout << "Processed images: " << processed << "\n\n";

    std::cout << "--- Accuracy of conversion (C++ vs Python gold) ---\n";
    std::cout << "Average MSE  : " << avg_mse_gold << "\n";
    std::cout << "Std Dev MSE  : " << std_mse_gold << "\n";
    std::cout << "Average PSNR : " << avg_psnr_gold << " dB\n";
    std::cout << "Std Dev PSNR : " << std_psnr_gold << " dB\n\n";

    std::cout << "--- Denoising quality (C++ vs ground truth) ---\n";
    std::cout << "Average MSE  : " << avg_mse_gt << "\n";
    std::cout << "Std Dev MSE  : " << std_mse_gt << "\n";
    std::cout << "Average PSNR : " << avg_psnr_gt << " dB\n";
    std::cout << "Std Dev PSNR : " << std_psnr_gt << " dB\n\n";

    // Ghi kết quả ra file
    std::ofstream out("cpp_comparison_results.txt");
    out << "C++ vs Python Gold Output (accuracy of conversion)\n";
    out << "Average MSE: " << avg_mse_gold << "\n";
    out << "Average PSNR: " << avg_psnr_gold << " dB\n";
    out << "Std Dev MSE: " << std_mse_gold << "\n";
    out << "Std Dev PSNR: " << std_psnr_gold << " dB\n";
    out.close();

    return 0;
}
