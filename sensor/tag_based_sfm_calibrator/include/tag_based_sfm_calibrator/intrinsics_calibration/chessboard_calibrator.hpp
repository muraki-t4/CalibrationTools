// Copyright 2024 Tier IV, Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#ifndef TAG_BASED_SFM_CALIBRATOR__INTRINSICS_CALIBRATION__CHESSBOARD_CALIBRATOR_HPP_
#define TAG_BASED_SFM_CALIBRATOR__INTRINSICS_CALIBRATION__CHESSBOARD_CALIBRATOR_HPP_

#include <opencv2/core.hpp>
#include <tag_based_sfm_calibrator/apriltag_detector.hpp>
#include <tag_based_sfm_calibrator/intrinsics_calibration/intrinsics_calibrator.hpp>
#include <tag_based_sfm_calibrator/types.hpp>

#include <memory>
#include <string>
#include <vector>

namespace tag_based_sfm_calibrator
{

class ChessboardBasedCalibrator : public IntrinsicsCalibrator
{
public:
  ChessboardBasedCalibrator(
    int rows, int cols, bool use_tangent_distortion, int num_radial_distortion_coeffs,
    bool debug = false)
  : IntrinsicsCalibrator(use_tangent_distortion, num_radial_distortion_coeffs, debug),
    rows_(rows),
    cols_(cols)
  {
  }

protected:
  void extractCalibrationPoints() override;
  void writeDebugImages(const IntrinsicParameters & intrinsics) override;

  std::vector<std::string> filtered_image_file_names_;

  int rows_;
  int cols_;
};

}  // namespace tag_based_sfm_calibrator

#endif  // TAG_BASED_SFM_CALIBRATOR__INTRINSICS_CALIBRATION__CHESSBOARD_CALIBRATOR_HPP_
