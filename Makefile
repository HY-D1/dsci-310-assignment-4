# author: Jordan Bourak & Tiffany Timbers
# date: 2021-11-22

all: docs/horse_pop_plot_largest_sd.png \
	docs/horse_pops_plot.png \
	docs/horses_spread.csv \
	docs/index.html \
	docs/qmd_example.pdf



# generate figures and objects for report
docs/horse_pop_plot_largest_sd.png docs/horse_pops_plot.png docs/horses_spread.csv: source/generate_figures.R
	Rscript source/generate_figures.R --input_dir="data/00030067-eng.csv" \
		--out_dir="docs"

# render quarto report in HTML and PDF
docs/index.html: docs docs/qmd_example.qmd
	quarto render docs/qmd_example.qmd --to html

docs/qmd_example.pdf: docs docs/qmd_example.qmd
	quarto render docs/qmd_example.qmd --to pdf

# clean
clean:
	rm -rf docs
	rm -rf docs/index.html \
		docs/qmd_example.html \
		docs/qmd_example.pdf \
		docs/qmd_example_files
