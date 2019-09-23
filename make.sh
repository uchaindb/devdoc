node preprocess.js

cd ./tmp

echo "# 入门" > chapter1.md
echo>>chapter1.md

echo "# 开发" > chapter2.md
echo>>chapter2.md

echo "# API" > chapter3.md
echo>>chapter3.md

echo "# 指南" > chapter4.md
echo>>chapter4.md


chapters="\
  chapter1.md \
  start.md \
  installation.md \
  config.md \
  basic-usage.md \

  chapter2.md \
  architecture.md \
  client.md \
  performance.md \

  chapter3.md \
  sdk.md \
  api.md \
  api-transaction.md \
  api-query.md \

  chapter4.md \
  cases.md \
  shadowdb.md \
  faq.md \
  roadmap.md \

  changes.md \
	"

options="--highlight-style=tango --pdf-engine=xelatex"

pandoc -o ../devbook.pdf -H ../tex/preamble.tex $options --metadata-file=../metadata.yaml $chapters
# pandoc -o ../devbook.tex -H ../tex/preamble.tex $options --metadata-file=../metadata.yaml $chapters

