
cd ./tmp

chapters="\
  start.md \
  installation.md \
  config.md \
  basic-usage.md \

  architecture.md \
  client.md \
  performance.md \

  sdk.md \
  api.md \
  api-transaction.md \
  api-query.md \

  cases.md \
  shadowdb.md \
  faq.md \
  roadmap.md \
  changes.md \
	"

options="--highlight-style=tango --pdf-engine=xelatex"

pandoc -o ../devbook.pdf -H ../tex/preamble.tex $options --metadata-file=../metadata.yaml $chapters
# pandoc -o ../devbook.tex -H ../tex/preamble.tex $options --metadata-file=../metadata.yaml $chapters

