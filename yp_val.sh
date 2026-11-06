set -e
TRAIN_MODEL_NAME=$1
TEST_MODEL_NAME=$2
OUT_MODEL_PATH=$3

if [[ -z "${TEST_MODEL_NAME}" ]]; then
    TEST_MODEL_NAME=${TRAIN_MODEL_NAME}
    if [[ -z "${OUT_MODEL_PATH}" ]]; then
        OUT_MODEL_PATH="data/output/inference_yp/${TRAIN_MODEL_NAME}"
    fi
else
    if [[ -z "${OUT_MODEL_PATH}" ]]; then
        OUT_MODEL_PATH="data/output/inference_yp/${TRAIN_MODEL_NAME}-${TEST_MODEL_NAME}"
    fi
fi

python run.py +preprocess=sfm_inference_yp.yaml +train_model="$TRAIN_MODEL_NAME" use_local_ray=True 
python inference.py +experiment=inference_yp.yaml +train_model="$TRAIN_MODEL_NAME" +test_model="$TEST_MODEL_NAME" +out_model_path="$OUT_MODEL_PATH" use_local_ray=True verbose=True