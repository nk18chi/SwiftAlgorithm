#!/bin/bash

export TIMEFORMAT="%E"

SOURCE_FILE_PATH='MinimumCostFlow.swift' # メインのソースファイル名
RELATED_FILES_PATH='' # 関連ソースのファイル名（スペース区切り）
TEST_PATH='./TestCases/' # テストデータファイルのパス

# コンパイル
swiftc -O $SOURCE_FILE_PATH $RELATED_FILES_PATH

# コンパイルエラーハンドリング
return=$?
if [ $return -ne 0 ]; then
  echo "ERROR: failed to compile"
  exit $return
fi

source=$(basename $SOURCE_FILE_PATH)
binary=${source%.swift}

for test_file in $TEST_PATH*.in; do
  test_case=$(basename $test_file)
  test_case=${test_case%.in}
  echo "--- TEST: $test_case"

  # 時間を図りながら実行して、実行結果と計測された時間を分ける
  result=$((time ./$binary <$TEST_PATH/$test_case.in) 2>&1)
  lines=(${result//\n/ })
  length=${#lines[@]}


  output=""
  real_time=""
  for i in "${!lines[@]}"; do
    if [ `expr $i + 1` -lt $length ]; then
      output="""$output${lines[i]}
"""
    else
      real_time=${lines[i]}
    fi
  done

  # 期待する出力と照らし合わせ
  expected=$(cat $TEST_PATH/$test_case.out)
  diff <(echo $expected) <(echo $output) >/dev/null 2>&1
  if [ $? -eq 0 ]; then # 一致するときは実行時間を表示
    echo -e "\033[32mOK\033[m\nTime: ${lines[`expr $length - 1`]}s"
  else # 一致しないときは実行結果と期待する出力を表示
    echo -e "\033[31mNG\033[m"
    echo -en "Outout:\n$output"
    echo -e "Expected:\n$expected"
  fi
done

rm ./$binary
