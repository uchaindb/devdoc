
cd ./tmp

chapters="\
  docs/start.md \
  docs/installation.md \
  docs/config.md \
	docs/basic-usage.md \

	docs/architecture.md \
	docs/client.md \
	docs/performance.md \

	docs/sdk.md \
	docs/api.md \
  docs/api-transaction.md \
	docs/api-query.md \

  docs/cases.md \
	docs/shadowdb.md \
	docs/faq.md \
	docs/roadmap.md \
  docs/changes.md \
	"

options="../metadata.yaml --highlight-style tango"

pandoc -o ../devbook.pdf -H ../tex/preamble.tex --latex-engine=xelatex $options $chapters

