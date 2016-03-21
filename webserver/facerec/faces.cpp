#include "opencv2/core.hpp"
#include "opencv2/face.hpp"
#include "opencv2/highgui.hpp"

#include <iostream>
#include <fstream>
#include <sstream>
#include <stdlib.h>

using namespace cv;
using namespace cv::face;
using namespace std;

static void read_csv(const string& filename, vector<Mat>& images, vector<int>& labels, char separator = ';') {
  std::ifstream file(filename.c_str(), ifstream::in);
  if (!file) {
    string error_message = "No valid input file was given, please check the given filename.";
    CV_Error(CV_StsBadArg, error_message);
  }
  string line, path, classlabel;
  while (getline(file, line)) {
    stringstream liness(line);
    getline(liness, path, separator);
    getline(liness, classlabel);
    if(!path.empty() && !classlabel.empty()) {
      images.push_back(imread(path, CV_LOAD_IMAGE_GRAYSCALE));
      labels.push_back(atoi(classlabel.c_str()));
    }
  }
}

int main(int argc, const char *argv[]) {

  Ptr<FaceRecognizer> model = createLBPHFaceRecognizer();
  vector<Mat> images;
  vector<int> labels;

  if(argc < 4){exit(1);}
  std::string user(argv[3]);
  std::string model_path = "/var/www/html/facePics/"+user+"/model.xml";
  
  if(std::string(argv[1]) == "train") {
    read_csv(argv[2], images, labels);
    model->train(images,labels);
    model->save(model_path);
    const char* cmd = ("chown www-data:www-data "+model_path).c_str();
    system(cmd);
  }
  else if(std::string(argv[1]) == "predict") {
    Mat guess = imread(argv[2], CV_LOAD_IMAGE_GRAYSCALE);
    model->load(model_path);
    int label;
    label = model->predict(guess);
    cout << label << endl;
  }
  else {
    cout << "Cli Usage Error" << endl;
  }
  
  return 0;
}
